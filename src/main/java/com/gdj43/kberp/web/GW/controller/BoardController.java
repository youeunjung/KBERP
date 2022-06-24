package com.gdj43.kberp.web.GW.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gdj43.kberp.common.bean.PagingBean;
import com.gdj43.kberp.common.service.IPagingService;
import com.gdj43.kberp.web.common.service.ICommonService;
	@Controller
	public class BoardController {
		@Autowired
		public ICommonService ics;		
		@Autowired
		public IPagingService iPagingService;
		
		@RequestMapping(value = "/board")
	public ModelAndView boardList(@RequestParam HashMap<String, String> params,
							ModelAndView mav) {
		
		if(params.get("page") == null || params.get("page") == "") {
			params.put("page", "1");
		}
	
		mav.addObject("page", params.get("page"));
	
		mav.setViewName("GW/board");
	
		return mav;
	}
	@RequestMapping(value = "/boardAjax", method = RequestMethod.POST,
			produces = "test/json;charset=UTF-8")
	@ResponseBody 
	public String boardAjax(@RequestParam HashMap<String, String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
	
		Map<String, Object> modelMap = new HashMap<String, Object>();
		// 총 게시글 수	
		int cnt = ics.getIntData("board.getBoardCnt", params);
		// 페이징 계산
		
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 9, 5);
		
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = ics.getDataList("board.getBoardList",params);
	
		
		modelMap.put("list", list);
		modelMap.put("pb", pb);
		
		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value = "/boardntcAjax", method = RequestMethod.POST,
			produces = "test/json;charset=UTF-8")
	@ResponseBody 
	public String boardntcAjax(@RequestParam HashMap<String, String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
	
		Map<String, Object> modelMap = new HashMap<String, Object>();
		// 총 게시글 수	
		
		List<HashMap<String, String>> list = ics.getDataList("board.getBoardntc",params);
	
		
		modelMap.put("list", list);
		
		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value = "/cmntAjax", method = RequestMethod.POST,
			produces = "test/json;charset=UTF-8")
	@ResponseBody 
	public String cmntAjax(@RequestParam HashMap<String, String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
	
		Map<String, Object> modelMap = new HashMap<String, Object>();	
		
		int cnt = ics.getIntData("board.getCmntCnt", params);
		
		
			
		List<HashMap<String, String>> list = ics.getDataList("board.boardCmntlist",params);
		
		modelMap.put("list", list);	
		
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/admnstrAjax", method = RequestMethod.POST,
			produces = "test/json;charset=UTF-8")
	@ResponseBody 
	public String admnstrAjax(@RequestParam HashMap<String, String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
	
		Map<String, Object> modelMap = new HashMap<String, Object>();
			
		List<HashMap<String, String>> list = ics.getDataList("board.boardAdmnstrlist",params);
		
		modelMap.put("list", list);

		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/boardWrite")
	public ModelAndView boardWrite(ModelAndView mav) {
		
		mav.setViewName("GW/boardWrite");
		
		return mav;
	}
	// @PathVariable : 주소의 {키} 부분을 변수로 취득
	@RequestMapping(value = "/boardAction/{gbn}", method = RequestMethod.POST,
			produces = "test/json;charset=UTF-8")
	@ResponseBody 
	public String boardActionAjax(@RequestParam HashMap<String, String> params,
							@PathVariable String gbn, HttpSession session) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		
		
	
		Map<String, Object> modelMap = new HashMap<String, Object>();
		try {
			switch(gbn) {
			case "insert":
				ics.getData("board.boardWrite",params);
				break;
			case "update":
				ics.getData("board.boardUpdate",params);
				break;
			case "delete":
				ics.getData("board.boardDelete",params);
				break;
			}
			modelMap.put("res", "success");
		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("res", "failed");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/cmntAction/{gbn}", method = RequestMethod.POST,
			produces = "test/json;charset=UTF-8")
	@ResponseBody 
	public String cmntActionAjax(@RequestParam HashMap<String, String> params,
							@PathVariable String gbn, HttpSession session) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		
		
	
		Map<String, Object> modelMap = new HashMap<String, Object>();
		try {
			switch(gbn) {
			case "insert":
				ics.getData("board.boardCmntWrite",params);
				break;
			case "update":
				ics.getData("board.boardCmntUpdate",params);
				break;
			case "delete":
				ics.getData("board.boardCmntDelete",params);
				break;
			}
			modelMap.put("res", "success");
		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("res", "failed");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	
	@RequestMapping(value = "/boardView")
	public ModelAndView boardView(@RequestParam HashMap<String, String> params,
								 ModelAndView mav) throws Throwable {
					
		ics.getData("board.updateBoardViewHit",params);
				
		HashMap<String, String> data = ics.getData("board.boardView",params);
										/*getBoard*/
		mav.addObject("data", data);
		
		mav.setViewName("GW/boardView");
		
		return mav;

	}
	
	@RequestMapping(value = "/boardUpdate")
	public ModelAndView boardUpdate(@RequestParam HashMap<String, String> params,
								 ModelAndView mav) throws Throwable {
		HashMap<String, String> data = ics.getData("board.boardView", params);
		
		mav.addObject("data", data);
		
		mav.setViewName("GW/boardUpdate");
		
		return mav;

	}
	@RequestMapping(value = "/boardAdmnstr")
	public ModelAndView boardAdmnstr(@RequestParam HashMap<String, String> params,
								 ModelAndView mav) throws Throwable {
				
		mav.setViewName("GW/boardAdmnstr");
		
		return mav;

	}
	
	@RequestMapping(value = "/admnstrAction/{gbn}", method = RequestMethod.POST,
			produces = "test/json;charset=UTF-8")
	@ResponseBody 
	public String admnstrActionAjax(@RequestParam HashMap<String, String> params,
							@PathVariable String gbn, HttpSession session) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		
		
	
		Map<String, Object> modelMap = new HashMap<String, Object>();
		try {
			switch(gbn) {
			case "insert":
				ics.getData("board.boardAdmnstrWrite",params);
				break;
			case "update":
				ics.getData("board.boardAdmnstrUpdate",params);
				break;
			case "delete":
				ics.getData("board.boardAdmnstrDelete",params);
				break;
			}
			modelMap.put("res", "success");
		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("res", "failed");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
}

