package com.gdj43.kberp.web.mng.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;
import com.fasterxml.jackson.databind.ObjectMapper;

import com.gdj43.kberp.web.common.service.ICommonService;


/*** 급여 관리 메뉴 ***/

@Controller
public class empSlryMngController {
	
	@Autowired
	public ICommonService iCommonService;

	


	//급여명세서 상세보기(관리자)
			@RequestMapping(value = "/slrSpcfctnView")
			public ModelAndView slrSpcfctnView(@RequestParam HashMap<String, String> params, 
										 HttpSession session, ModelAndView mav) throws Throwable {
				
				params.put("sEmpNum", String.valueOf(session.getAttribute("sEmpNum")));
				if(params.get("mon") == null || params.get("mon") == "") {
					Date today = new Date();
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
					String thisMon = sdf.format(today);
					params.put("mon", thisMon);			
				} 
				System.out.println("thisMon");
				System.out.println("sEmpNum");
				HashMap<String, String> data = iCommonService.getData("empSlryMng.slrSpcfctnView", params);
		
				mav.addObject("data", data);
				System.out.println(3);
				mav.addObject("mon", params.get("mon"));
				
				mav.setViewName("mng/slrSpcfctnView");
				
				return mav;
			}
		
}
