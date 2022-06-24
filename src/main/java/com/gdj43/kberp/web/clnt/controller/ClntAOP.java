package com.gdj43.kberp.web.clnt.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.gdj43.kberp.web.common.service.ICommonService;

@Component
@Aspect
public class ClntAOP {
	@Autowired
	public ICommonService iCommonService;
	
	@Pointcut("execution(* com.gdj43.kberp..clnt..*Controller.*(..))"
			+ "&&!execution(* com.gdj43.kberp..clnt..*Controller.*Ajax(..))"
			+ "&&!execution(* com.gdj43.kberp..clnt..*Controller.find*(..))"
			+ "&&!execution(* com.gdj43.kberp..clnt..*Controller.c*(..))"
			+ "&&!execution(* com.gdj43.kberp..clnt..*Controller.*Up(..))"
			+ "&&!execution(* com.gdj43.kberp..clnt..*Controller.*Login*(..))"
			+ "&&!execution(* com.gdj43.kberp..clnt..*Controller.*Info*(..))"
			+ "&&!execution(* com.gdj43.kberp..clnt..*Controller.*Logout*(..))")
	
	public void testAOP() {}
	
	@Around("testAOP()")
	public ModelAndView testAOP(ProceedingJoinPoint joinPoint)
														throws Throwable {
		ModelAndView mav = new ModelAndView();
		
		//Request 객체 취득
		HttpServletRequest request
		= ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("sClntNum") != null) {
			try {
				mav = (ModelAndView) joinPoint.proceed(); //기존 이벤트 처리 행위를 이어서 진행
			} catch (Exception e) {
				e.printStackTrace();
				mav.setViewName("redirect:cmbnInfo");
			}
		} else {
			mav.setViewName("redirect:clntLogin");
		}
		
		return mav;
	}
}













