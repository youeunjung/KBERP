package com.gdj43.kberp.web.hr.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.gdj43.kberp.common.service.IPagingService;
import com.gdj43.kberp.web.hr.service.IAtndncService;

/***** 근태 관련 메뉴 *****/

@Controller
public class AtndncController {
	@Autowired
	public IAtndncService iAtndncService;
	
	@Autowired
	public IPagingService ips;
}
