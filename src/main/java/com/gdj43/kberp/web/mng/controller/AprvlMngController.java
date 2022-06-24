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

/*** 자산 관리 메뉴 ***/

@Controller
public class AprvlMngController {

	@Autowired
	public ICommonService ics;
	
	@Autowired
	public IPagingService iPagingService;
	
	@RequestMapping(value = "/aprvlMng")
	public ModelAndView aprvlMng(@RequestParam HashMap<String, String> params, ModelAndView mav) {
		
		if (params.get("page") == null || params.get("page") == "") {
			params.put("page", "1");
		}

		mav.addObject("page", params.get("page"));
		
		mav.setViewName("mng/aprvlMng");
		
		return mav;
	}
	
	@RequestMapping(value = "/aprvlMngAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String parvlMngAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		// 총 게시글 수
		int cnt = ics.getIntData("aprvlMng.getCnt", params);
		
		// 페이징 계산
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 10, 5);
		
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = ics.getDataList("aprvlMng.aprvlMngList", params);
		
		modelMap.put("list", list); 
		modelMap.put("pb", pb); 
		
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value= "/aprvlMngDtlView")
	public ModelAndView aprvlMngDtlView(@RequestParam HashMap<String, String> params,
							ModelAndView mav) throws Throwable {
		
		HashMap<String, String> data = ics.getData("aprvlMng.aprvlMngDtlView",params);
		
		mav.addObject("data", data);
		
		mav.setViewName("mng/aprvlMngDtlView");
		
		return mav;
	}
	
	@RequestMapping(value="/aprvlMngAction/{gbn}", method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8") 
	@ResponseBody 
	public String aprvlMngActionAjax(@RequestParam HashMap<String, String> params,
							@PathVariable String gbn) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String,Object> modelMap = new HashMap<String,Object>();
		
		try {			
			switch(gbn) {
			case "aprvl" :
				ics.updateData("aprvlMng.aprvl", params);
				break;
			case "reject" :
				ics.updateData("aprvlMng.reject", params);
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
