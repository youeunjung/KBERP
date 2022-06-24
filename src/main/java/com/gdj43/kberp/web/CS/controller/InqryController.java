package com.gdj43.kberp.web.CS.controller;

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

@Controller
public class InqryController {
	@Autowired
	public ICommonService iCommonService;
	
	@Autowired
	public IPagingService ips;
	
	// 목록
	@RequestMapping(value = "/inqryList")
	public ModelAndView inqryList(@RequestParam HashMap<String, String> params, 
			  						ModelAndView mav) {
		
		if(params.get("page") == null || params.get("page") == "") {
			params.put("page", "1");
		}
		
		mav.addObject("page", params.get("page"));
		
		mav.setViewName("CS/inqryList");
		
		return mav;
	}
	
	// 목록 Ajax
	@RequestMapping(value = "/inqryListAjax", method = RequestMethod.POST,
					produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String inqryListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		// 총 게시글 수
		int cnt = iCommonService.getIntData("in.getInqryCnt", params);
		
		// 페이징 계산
		PagingBean pb = ips.getPagingBean(Integer.parseInt(params.get("page")), cnt, 10, 5);
		
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iCommonService.getDataList("in.getInqryList", params);
		
		modelMap.put("list", list); 
		modelMap.put("pb", pb); 
		
		return mapper.writeValueAsString(modelMap);
	}
	
	// 상세보기
	@RequestMapping(value = "/inqry")
	public ModelAndView inqry(@RequestParam HashMap<String, String> params,
							  ModelAndView mav) throws Throwable {
		
		HashMap<String, String> data = iCommonService.getData("in.getInqry", params);
		
		mav.addObject("data", data);
		
		mav.setViewName("CS/inqry");
		
		return mav;
	}
	
	// 글등록
	@RequestMapping(value = "/ansrAdd")
	public ModelAndView ansrAdd(@RequestParam HashMap<String, String> params,
			  					ModelAndView mav) throws Throwable {
		
		HashMap<String, String> data = iCommonService.getData("in.getInqry", params);
		
		mav.addObject("data", data);
		
		mav.setViewName("CS/ansrAdd");
		
		return mav;
	}
	// 답변 등록, 수정, 삭제
	@RequestMapping(value = "/inqryActionAjax/{gbn}", method = RequestMethod.POST,
					produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String inqryActionAjax(@RequestParam HashMap<String, String> params,
							  @PathVariable String gbn) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		try {
			switch(gbn) {
			case "insert":
				iCommonService.updateData("in.ansrAdd", params);
				break;
			case "update":
				iCommonService.updateData("in.ansrUpdate", params);
				break;
			case "delete":
				iCommonService.updateData("in.ansrDelete", params);
				break;
		}
				modelMap.put("res", "success");
		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("res", "failed");
		}
			return mapper.writeValueAsString(modelMap);
		}
	
	// 대응가이드 리스트
	@RequestMapping(value = "/inqryRspndList")
	public ModelAndView inqryRspndList(@RequestParam HashMap<String, String> params, 
			  							ModelAndView mav) {
		
		if(params.get("page") == null || params.get("page") == "") {
			params.put("page", "1");
		}
		
		mav.addObject("page", params.get("page"));
		
		return mav;
	}
	
	// 대응가이드 페이지
	@RequestMapping(value = "/inqryRspndListAjax", method = RequestMethod.POST, 
					produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String inqryRspndListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		// 총 게시글 수
		int cnt = iCommonService.getIntData("in.inqryRspndCnt", params);
		
		// 페이징 계산
		PagingBean pb = ips.getPagingBean(Integer.parseInt(params.get("page")), cnt, 3, 5);
		
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iCommonService.getDataList("in.inqryRspndList", params);
		
		modelMap.put("list", list);
		modelMap.put("pb", pb);
		
		return mapper.writeValueAsString(modelMap); 
	}
	
	// 대응가이드 등록, 수정, 삭제
	@RequestMapping(value="/inqryRspndListActionAjax/{gbn}", method = RequestMethod.POST,
					produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String inqryRspndListActionAjax(@RequestParam HashMap<String, String> params,
								   	   @PathVariable String gbn) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			switch(gbn) {
			case "i":
				iCommonService.insertData("in.inqryRspndAdd", params);
				break;
			case "u":
				iCommonService.updateData("in.inqryRspndUp", params);
				break;
			case "d":
				iCommonService.updateData("in.inqryRspndDel", params);
				break;
			}
			modelMap.put("res", "success");
			
		} catch(Throwable e) {
			e.printStackTrace();
			modelMap.put("res", "failed");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	
}
