package com.gdj43.kberp.web.CS.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gdj43.kberp.common.service.IPagingService;
import com.gdj43.kberp.web.CS.service.IEISService;
import com.gdj43.kberp.web.common.service.ICommonService;

@Controller
public class EISController {
	@Autowired
	public IEISService ieiss;
	
	@Autowired
	public ICommonService iCommonService;
	
	@Autowired
	public IPagingService ips;
	
	@RequestMapping(value="dshbrd")
	public ModelAndView dshbrd(@RequestParam HashMap<String, String> params,
							   ModelAndView mav) {
		
		mav.setViewName("CS/dshbrd");
		
		return mav;
	}
	
	
	
	
	@RequestMapping(value="setting")
	public ModelAndView setting(@RequestParam HashMap<String, String> params,
							    ModelAndView mav) {
		
		mav.setViewName("CS/setting");
		
		return mav;
	}
	
	
	
	
}
