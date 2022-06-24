package com.gdj43.kberp.web.mng.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

/*** 카드 관리 메뉴 ***/

@Controller
public class CardController {
	
	@Autowired
	public ICommonService ics;
	
	@Autowired
	public IPagingService iPagingService;
	
	@RequestMapping(value="/cardList")
	public ModelAndView cardList(@RequestParam HashMap<String,String> params, ModelAndView mav){
		if(params.get("page")== null || params.get("page")=="") {
			params.put("page", "1");
		}
		mav.addObject("page", params.get("page"));
		mav.setViewName("mng/cardList");
		return mav;
	}
	
	@RequestMapping(value="/cardListAjax", method= RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String cardListAjax(@RequestParam HashMap<String,String>params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String, Object>();
		//총 게시글 수
		int cnt = ics.getIntData("card.getCnt", params);
		
		//페이징 계산
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")),cnt,10,5);
		//PagingBean pb = iPagingService.getPagingBean(Integer.parseInt("1"),cnt,10,5);
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = ics.getDataList("card.cardList", params);
		
		modelMap.put("pb", pb);
		modelMap.put("list", list);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	//카드상세보기
		@RequestMapping(value = "/cardView")
		public ModelAndView cardView(@RequestParam HashMap<String, String> params, 
									 ModelAndView mav) throws Throwable {
		
			HashMap<String, String> data = ics.getData("card.cardView", params);
			
			mav.addObject("data", data);
			
			mav.setViewName("mng/cardView");
			
			return mav;
		}
		//카드 등록
		@RequestMapping(value = "/cardWrite")
		public ModelAndView cardWrite(@RequestParam HashMap<String, String> params, ModelAndView mav)
				throws Throwable {

			mav.setViewName("mng/cardWrite");

			return mav;
		}
		//카드업데이트
				@RequestMapping(value = "/cardUpdate")
				public ModelAndView cardUpdate(@RequestParam HashMap<String, String> params, 
											 ModelAndView mav) throws Throwable {
					
					HashMap<String, String> data = ics.getData("card.cardView", params);
					
					
					mav.addObject("data", data);
					mav.setViewName("mng/cardUpdate");
					
					return mav;
				}
		
	// @PathVariable : 주소의 {키} 부분을 변수로 취득
		@RequestMapping(value ="/cardMngAction/{gbn}", method = RequestMethod.POST,
				produces = "text/json;charset=UTF-8") 
		@ResponseBody
		public String cardMngActionAjax(@RequestParam HashMap<String, String> params,
								@PathVariable String gbn) throws Throwable {

			ObjectMapper mapper = new ObjectMapper();
			
			Map<String, Object> modelMap = new HashMap<String,Object>();
			try {
			switch(gbn) {
			case "insert":
				ics.insertData("card.writeCard",params);
				break;
			case "update":
				ics.updateData("card.updateCard",params);
				ics.updateData("card.updateCard2",params);
				break;
			case "insert2":
				ics.insertData("card.writeUseCard",params);
				break;
			}
				modelMap.put("res", "success");
			} catch (Throwable e) {
				e.printStackTrace();
				modelMap.put("res", "failed");
			}
		
			return mapper.writeValueAsString(modelMap);
		}
		
		@RequestMapping(value = "/callEmpSrchAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
		@ResponseBody
		public String callEmpSrchAjax(@RequestParam HashMap<String, String> params) throws Throwable {
			ObjectMapper mapper = new ObjectMapper();
			
			Map<String, Object> modelMap = new HashMap<String, Object>();
			
			// 총 게시글 수
			System.out.println(params);
			int cnt = ics.getIntData("card.getAllEmpCnt",params);
			
			// 페이징 계산
			PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 5, 5);
			
			params.put("startCount", Integer.toString(pb.getStartCount()));
			params.put("endCount", Integer.toString(pb.getEndCount()));
			
			List<HashMap<String, String>> list = ics.getDataList("card.getAllEmpList", params);
			
			modelMap.put("list", list); 
			modelMap.put("pb", pb);
			
			return mapper.writeValueAsString(modelMap);
		}
		@RequestMapping(value = "/cardUseHstryAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
		@ResponseBody
		public String cardUseHstryAjax(@RequestParam HashMap<String, String> params) throws Throwable {
			ObjectMapper mapper = new ObjectMapper();
			
			Map<String, Object> modelMap = new HashMap<String, Object>();
			
			// 총 게시글 수
			int cnt = ics.getIntData("card.cardUseHistoryCnt",params);
			
			// 페이징 계산
			PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 5, 5);
			
			params.put("startCount", Integer.toString(pb.getStartCount()));
			params.put("endCount", Integer.toString(pb.getEndCount()));
			
			List<HashMap<String, String>> list = ics.getDataList("card.cardUseHistory", params);
			
			modelMap.put("list", list); 
			modelMap.put("pb", pb);
			
			return mapper.writeValueAsString(modelMap);
		}
		
		//카드 등록
			@RequestMapping(value = "/cardUseWrite")
			public ModelAndView cardUseWrite(@RequestParam HashMap<String, String> params, ModelAndView mav)
						throws Throwable {

			mav.setViewName("mng/cardUseWrite");

				return mav;
		}
}
