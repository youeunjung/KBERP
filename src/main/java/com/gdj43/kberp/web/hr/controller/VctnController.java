package com.gdj43.kberp.web.hr.controller;

import java.util.ArrayList;
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
import com.gdj43.kberp.common.CommonProperties;
import com.gdj43.kberp.common.bean.PagingBean;
import com.gdj43.kberp.common.service.IPagingService;
import com.gdj43.kberp.util.Utils;
import com.gdj43.kberp.web.common.service.ICommonService;
import com.gdj43.kberp.web.hr.service.IPrsnlService;

/***** 휴가 관련 메뉴 *****/

@Controller
public class VctnController {
	@Autowired
	public IPrsnlService iPrsnlService;
	@Autowired
	public ICommonService iCommonService;
	
	@Autowired
	public IPagingService iPagingService;
	
	@RequestMapping(value = "/vctnRqst")
	public ModelAndView vctnRqst(@RequestParam HashMap<String, String> params, HttpSession session, ModelAndView mav) throws Throwable {
		try {
			// 로그인 확인, 로그인 된 사용자 정보 취득
			if(session.getAttribute("sEmpNum") != null) {
				params.put("sEmpNum", String.valueOf(session.getAttribute("sEmpNum")));
				mav.addObject("is_admnstr", "0");
			} else {
				mav.setViewName("redirect:login");
			}
			
			params.put("menuNum", "18"); // 메뉴 번호 params에 추가
			// 사용자 메뉴 권한 가져오기
			int menuAthrty = iCommonService.getIntData("prsnl.getMenuAthrty", params);
			
			if (menuAthrty != 0) { // 읽기, 쓰기 권한이 있을 때
				mav.addObject("menuAthrty", menuAthrty);
				
				mav.setViewName("hr/vctnRqst");
			} else { // 권한 없을 때
				mav.setViewName("exception/PAGE_NOT_FOUND");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("exception", e);
			mav.setViewName("exception/EXCEPTION_INFO");
		}
		
		return mav;
	}
	
	@RequestMapping(value = "/vctnRqstAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String vctnRqstAjax(@RequestParam HashMap<String, String> params, HttpSession session) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/prsnlAnlVctn")
	public ModelAndView prsnlAnlVctn(@RequestParam HashMap<String, String> params, HttpSession session, ModelAndView mav) throws Throwable {
		try {
			if (session.getAttribute("sEmpNum") != null) {
				params.put("sEmpNum", String.valueOf(session.getAttribute("sEmpNum")));
			} else {
				mav.setViewName("redirect:login");
			}
			
			params.put("menuNum", "19");
			int menuAthrty = iCommonService.getIntData("prsnl.getMenuAthrty", params);
			
			if (menuAthrty != 0) {
				mav.addObject("menuAthrty", menuAthrty);
				mav.setViewName("hr/prsnlAnlVctn");
			} else {
				mav.setViewName("exception/PAGE_NOT_FOUND");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("exception", e);
			mav.setViewName("exception/EXCEPTION_INFO");
		}

		return mav;
	}

	@RequestMapping(value = "/anlVctnAdmnstr")
	public ModelAndView anlVctnAdmnstr(@RequestParam HashMap<String, String> params, HttpSession session, ModelAndView mav) throws Throwable {
		try {
			if (session.getAttribute("sEmpNum") != null) {
				params.put("sEmpNum", String.valueOf(session.getAttribute("sEmpNum")));
			} else {
				mav.setViewName("redirect:login");
			}
			
			params.put("menuNum", "6");
			int menuAthrty = iCommonService.getIntData("prsnl.getMenuAthrty", params);
			
			if (menuAthrty != 0) {
				if (params.get("page") == null || params.get("page") == "") {
					params.put("page", "1");
					System.out.println("* page initialize");
				}
				
				mav.addObject("page", params.get("page"));
				mav.addObject("menuAthrty", menuAthrty);
				mav.setViewName("hr/anlVctnAdmnstr");
			} else {
				mav.setViewName("exception/PAGE_NOT_FOUND");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("exception", e);
			mav.setViewName("exception/EXCEPTION_INFO");
		}

		return mav;
	}
	
	@RequestMapping(value = "/anlVctnAdmnstrAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String anlVctnAdmnstrAjax(@RequestParam HashMap<String, String> params, HttpSession session) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			int cnt = iCommonService.getIntData("prsnl.getEmpCount", params);
			
			System.out.println("* page : " + params.get("page"));
			
			PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 15, 10);

			params.put("startCount", Integer.toString(pb.getStartCount()));
			params.put("endCount", Integer.toString(pb.getEndCount()));
			
			List<HashMap<String, String>> list = iCommonService.getDataList("prsnl.getEmpList", params);
			
			modelMap.put("list", list);
			modelMap.put("pb", pb);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mapper.writeValueAsString(modelMap);
	}

}
