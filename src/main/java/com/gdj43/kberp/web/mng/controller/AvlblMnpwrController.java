package com.gdj43.kberp.web.mng.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gdj43.kberp.common.bean.PagingBean;
import com.gdj43.kberp.common.service.IPagingService;
import com.gdj43.kberp.web.common.service.ICommonService;

/*** 투입관리 가용인력현황 ***/

@Controller
public class AvlblMnpwrController {
	@Autowired
	public ICommonService iCommonService;
	
	@Autowired
	public IPagingService iPagingService;
	
	//가용인력현황 페이지
	@RequestMapping(value = "/avlblManPwrCrntState")
	public ModelAndView fcltUseRqst(@RequestParam HashMap<String, String> params, 
									ModelAndView mav) throws Throwable {
		
		mav.setViewName("mng/avlblManPwrCrntState");
		
		return mav;
	}
	
	//가용인력 사원리스트
	@RequestMapping(value = "/avlblMnpwrAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String fcltViewListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
			ObjectMapper mapper = new ObjectMapper();
			
			int cnt = iCommonService.getIntData("avlblManPwr.empCount", params);
			
			Map<String, Object> modelMap = new HashMap<String, Object>();
			 
			List<HashMap<String, String>> list = iCommonService.getDataList("avlblManPwr.empList", params);

			modelMap.put("list", list);
			modelMap.put("cnt", cnt);

			return mapper.writeValueAsString(modelMap);

		}
}











