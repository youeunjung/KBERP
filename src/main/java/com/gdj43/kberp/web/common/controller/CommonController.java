package com.gdj43.kberp.web.common.controller;

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
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gdj43.kberp.common.CommonProperties;
import com.gdj43.kberp.util.Utils;
import com.gdj43.kberp.web.common.service.ICommonService;

@Controller
public class CommonController {
	@Autowired
	public ICommonService iCommonService;
	
	@RequestMapping(value = "/header")
	public ModelAndView header(ModelAndView mav) {
		mav.setViewName("common/header");
		
		return mav;
	}
	
	@RequestMapping(value = "/bottom")
	public ModelAndView bottom(ModelAndView mav) {
		mav.setViewName("common/bottom");
		
		return mav;
	}
	
	@RequestMapping(value = "/topLeft")
	public ModelAndView topLeft(@RequestParam HashMap<String, String> params, 
								HttpSession session, ModelAndView mav) throws Throwable {
		params.put("athrtyNum", String.valueOf(session.getAttribute("sAthrtyNum")));
		
		String athrtyTypeNum = iCommonService.getStringData("common.menuAthrtyCheck", params);
		
		try {
			List<HashMap<String, String>> topMenu = iCommonService.getDataList("common.getTopMenu", params);
			
			mav.addObject("athrtyTypeNum", athrtyTypeNum);
			mav.addObject("topMenu", topMenu);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mav.setViewName("common/topLeft");
		
		return mav;
	}
	
	@RequestMapping(value = "/leftMenuAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String leftMenuAjax(@RequestParam HashMap<String, String> params, HttpSession session) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		params.put("athrtyNum", String.valueOf(session.getAttribute("sAthrtyNum")));
		
		List<HashMap<String, String>> leftMenu = iCommonService.getDataList("common.getLeftMenu", params);
		
		modelMap.put("leftMenu", leftMenu);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping({"/", "/login"})
	public ModelAndView login(HttpSession session, ModelAndView mav) {
		if(session.getAttribute("sEmpNum") != null) {
			mav.setViewName("redirect:loc");
		} else {
			mav.setViewName("common/login");
		}
		
		return mav;
	}
	
	@RequestMapping(value = "/loginAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String loginAjax(@RequestParam HashMap<String, String> params, HttpSession session) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			//패스워드 암호화
			params.put("pw", Utils.encryptAES128(params.get("pw")));

			HashMap<String, String> data = iCommonService.getData("common.loginCheck", params);
			
			if (data != null && !data.isEmpty()) {
				session.setAttribute("sEmpNum", data.get("EMP_NUM"));
				session.setAttribute("sEmpName", data.get("EMP_NAME"));
				session.setAttribute("sEmpPctrFile", data.get("EMP_PCTR_FILE"));
				session.setAttribute("sAthrtyNum", data.get("ATHRTY_NUM"));
				session.setAttribute("sDeptNum", data.get("DEPT_NUM"));
				session.setAttribute("sDeptName", data.get("DEPT_NAME"));
				session.setAttribute("sRankName", data.get("RANK_NAME"));

				modelMap.put("res", CommonProperties.RESULT_SUCCESS);
			} else {
				modelMap.put("res", CommonProperties.RESULT_FAILED);
			}

		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", CommonProperties.RESULT_ERROR);
		}
		
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/logout")
	public ModelAndView logout(HttpSession session, ModelAndView mav) {
		session.invalidate();
		
		mav.setViewName("redirect:login");
		
		return mav;
	}
	
	@RequestMapping(value = "/loc")
	public ModelAndView loc(HttpSession session, ModelAndView mav) {
		if(session.getAttribute("sEmpNum") != null) {
			mav.setViewName("common/loc");
		} else {
			mav.setViewName("redirect:login");
		}
		
		return mav;
	}
	
	/**
	* getCmnCodeAjax - 공통코드 취득용
	* - params필수사항 -
	* mainCtgrNum - 대분류코드
	*/
	@RequestMapping(value = "/getCmnCodeAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String getCmnCodeAjax(@RequestParam HashMap<String, String> params, HttpSession session) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			List<HashMap<String, String>> codeList = iCommonService.getDataList("common.getCmnCode", params);
			
			modelMap.put("codeList", codeList);
			
			modelMap.put("res", CommonProperties.RESULT_SUCCESS);

		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", CommonProperties.RESULT_ERROR);
		}
		
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/sample")
	public ModelAndView sample(ModelAndView mav) {
		mav.setViewName("common/sample");
		
		return mav;
	}
}
