package com.gdj43.kberp.web.mng.controller;

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

/*** 시설물 관리 메뉴 ***/

@Controller
public class FcltyController {

	@Autowired
	public ICommonService iCommonService;

	@Autowired
	public IPagingService iPagingService;

	//시설물예약목록
	@RequestMapping(value = "/fcltUseRqst")
	public ModelAndView fcltUseRqst(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		if (params.get("page") == null || params.get("page") == "") {
			params.put("page", "1");
		}

		mav.addObject("page", params.get("page"));
		mav.setViewName("mng/fcltUseRqst");

		return mav;
	}
	//시설물예약 ajax
	@RequestMapping(value = "/fcltUseRqstAjax", method = RequestMethod.POST, 
					produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String fcltUseRqstAjax(@RequestParam HashMap<String, String> params,
								  HttpSession session) throws Throwable {
		
		params.put("sesEmpNum", String.valueOf(session.getAttribute("sEmpNum")));
		
		ObjectMapper mapper = new ObjectMapper();
				
		Map<String, Object> modelMap = new HashMap<String, Object>();

		int cnt = iCommonService.getIntData("Fclty.fcltyListRqstCnt", params);

		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 10, 5);

		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));

		List<HashMap<String, String>> list = iCommonService.getDataList("Fclty.rsvtnFcltyList", params);
	
		modelMap.put("pb", pb);
		modelMap.put("list", list);
		
		return mapper.writeValueAsString(modelMap);

	}
	//시설물예약 상세보기
	@RequestMapping(value = "/fcltUseRqstView")
	public ModelAndView fcltUseRqstView(@RequestParam HashMap<String, String> params, ModelAndView mav)
			throws Throwable {

		HashMap<String, String> data = iCommonService.getData("Fclty.fcltUseRqstView", params);

		mav.addObject("data", data);

		mav.setViewName("mng/fcltUseRqstView");

		return mav;
	}
	
	//예약가능한 시설물 목록 Ajax
	@RequestMapping(value = "/fcltUseRqstCalListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String fcltUseRqstCalAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();
		 
		List<HashMap<String, String>> list = iCommonService.getDataList("Fclty.fcltUseRqstCalList", params);

		modelMap.put("list", list);

		return mapper.writeValueAsString(modelMap);

	}
	//시설물예약등록 1페이지 날짜 + 시설물
	@RequestMapping(value = "/fcltUseRqstWrite")
	public ModelAndView fcltUseRqstWrite(@RequestParam HashMap<String, String> params, ModelAndView mav)
			throws Throwable {

		mav.setViewName("mng/fcltUseRqstWrite");

		return mav;
	}
	//시설물 예약가능한 시간대 리스트 
	@RequestMapping(value = "/timeSelAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String timeSelAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		List<HashMap<String, String>> list = iCommonService.getDataList("Fclty.getTimeList", params);
		
		modelMap.put("list", list);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	//시설물예약등록 2페이지
	@RequestMapping(value = "/fcltUseRqstTimeWrite")
	public ModelAndView fcltUseRqstTimeWrite(@RequestParam HashMap<String, String> params
											, ModelAndView mav) throws Throwable {

		mav.setViewName("mng/fcltUseRqstTimeWrite");

		return mav;
	}
	
	//시설물 action insert 캘린더 해결안됨
	@RequestMapping(value = "/fcltRqstAction/{gbn}", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String fcltRqstActionAjax(@RequestParam HashMap<String, String> params, HttpSession session, @PathVariable String gbn)
			throws Throwable {

		params.put("sesEmpNum", String.valueOf(session.getAttribute("sEmpNum")));
		
		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			switch (gbn) {
			case "insert":
				iCommonService.insertData("Fclty.fcltUseRqstWrite", params);
				break;
			case "delete":
				iCommonService.deleteData("Fclty.fcltUseRqstCncl", params);
				break;
			}
			modelMap.put("res", "success");
		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("res", "failed");
		}
		return mapper.writeValueAsString(modelMap);
	}

	//시설물목록
	@RequestMapping(value = "/fcltList")
	public ModelAndView fcltList(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		if (params.get("page") == null || params.get("page") == "") {
			params.put("page", "1");
		}

		mav.addObject("page", params.get("page"));
		mav.setViewName("mng/fcltList");

		return mav;
	}
	//시설물목록 ajax
	@RequestMapping(value = "/fcltAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String fcltAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		
		 int cnt = iCommonService.getIntData("Fclty.fcltyListCnt",params);
		 
		 PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt,10,5);
		
		 params.put("startCount", Integer.toString(pb.getStartCount()));
		 params.put("endCount", Integer.toString(pb.getEndCount()));
		  
		 
		List<HashMap<String, String>> list = iCommonService.getDataList("Fclty.fcltyList", params);

		modelMap.put("pb", pb);
		modelMap.put("list", list);

		return mapper.writeValueAsString(modelMap);

	}
	//시설물상세보기 시설물데이터
	@RequestMapping(value = "/fcltView")
	public ModelAndView fcltView(@RequestParam HashMap<String, String> params, 
								 ModelAndView mav) throws Throwable {
		
		HashMap<String, String> data = iCommonService.getData("Fclty.fcltyView", params);
		
		mav.addObject("data", data);
		
		mav.setViewName("mng/fcltView");
		
		return mav;
	}
	//시설물상세보기안에 시설물예약리스트
	@RequestMapping(value = "/fcltViewListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String fcltViewListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		
		 int cnt = iCommonService.getIntData("Fclty.fcltyViewListCnt",params);
		 
		 PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt,5,5);
		
		 params.put("startCount", Integer.toString(pb.getStartCount()));
		 params.put("endCount", Integer.toString(pb.getEndCount()));
		  
		 
		List<HashMap<String, String>> list = iCommonService.getDataList("Fclty.fcltyViewList", params);

		modelMap.put("pb", pb);
		modelMap.put("list", list);

		return mapper.writeValueAsString(modelMap);

	}
	
	//시설물등록
	@RequestMapping(value = "/fcltAdd")
	public ModelAndView fcltAdd(@RequestParam HashMap<String, String> params, ModelAndView mav)
			throws Throwable {

		mav.setViewName("mng/fcltAdd");

		return mav;
	}
	//시설물수정
	@RequestMapping(value = "/fcltUpdate")
	public ModelAndView fcltUpdate(@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable{
		
		HashMap<String, String> data = iCommonService.getData("Fclty.fcltyView", params);
		
		mav.addObject("data",data);
		
		mav.setViewName("mng/fcltUpdate");
		
		return mav;
	}
	//시설물 action
	@RequestMapping(value = "/fcltAction/{gbn}", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String fcltActionAjax(@RequestParam HashMap<String, String> params, @PathVariable String gbn)
			throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			switch (gbn) {
			case "insert":
				iCommonService.insertData("Fclty.fcltyAdd", params);
				break;
			case "update":
				iCommonService.updateData("Fclty.fcltyUpdate", params);
				break;
			case "delete":
				iCommonService.deleteData("Fclty.fcltDelete", params);
				break;
			}
			modelMap.put("res", "success");
		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("res", "failed");
		}
		return mapper.writeValueAsString(modelMap);
	}
	
	//사원검색 ajax
	@RequestMapping(value = "/empSrchAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String empSrchAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		// 총 게시글 수
		int cnt = iCommonService.getIntData("Fclty.getEmpCnt", params);
		
		// 페이징 계산
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 5, 5);
		
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iCommonService.getDataList("Fclty.getEmpList", params);
		
		modelMap.put("list", list); 
		modelMap.put("pb", pb);
		
		return mapper.writeValueAsString(modelMap);
	}
}











