package com.gdj43.kberp.web.clnt.controller;

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
import com.gdj43.kberp.util.Utils;
import com.gdj43.kberp.web.common.service.ICommonService;

@Controller
public class IndvdlClntController {
	@Autowired
	public ICommonService iCommonService;

	@RequestMapping(value = "/cHeader")
	public ModelAndView cHeader(ModelAndView mav) {
		mav.setViewName("CS/clnt/cHeader");

		return mav;
	}

	
	@RequestMapping(value = "/cBottom") 
	public ModelAndView cBottom(ModelAndView mav) { 
		mav.setViewName("CS/clnt/cBottom");
	
		return mav; 
	}
	
	// TopMenu
	@RequestMapping(value = "/cTop")
	public ModelAndView cTop(@RequestParam HashMap<String, String> params, 
								HttpSession session, ModelAndView mav) throws Throwable {
		
		try {
			List<HashMap<String, String>> topMenu = iCommonService.getDataList("cl.getTopMenu", params);
			
			mav.addObject("topMenu", topMenu);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mav.setViewName("CS/clnt/cTop");
		
		return mav;
	}
	
	// 로그인
	@RequestMapping(value = "/indvdlLogin")
	public ModelAndView indvdlLogin(HttpSession session, ModelAndView mav) {
		if (session.getAttribute("sClntNum") != null) {
			mav.setViewName("redirect:cmbnInfo");
		} else {
			mav.setViewName("CS/clnt/clntLogin");
		}

		return mav;
	}
	
	// 로그인 Ajax
	@RequestMapping(value = "/indvdlLoginAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String indvdlLoginAjax(@RequestParam HashMap<String, String> params, HttpSession session) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			// 패스워드 암호화
			params.put("pw", Utils.encryptAES128(params.get("pw")));

			HashMap<String, String> data = iCommonService.getData("cl.icloginCheck", params);

			if (data != null && !data.isEmpty()) {
				session.setAttribute("sId", data.get("ID"));
				session.setAttribute("sClntName", data.get("CLNT_NAME"));

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
	
	// 로그아웃
	@RequestMapping(value = "/cLogout")
	public ModelAndView cLogout(HttpSession session, ModelAndView mav) {
		session.invalidate();

		mav.setViewName("redirect:cmbnInfo");

		return mav;
	}
	
	// 로그인 후 보여질 뷰
	@RequestMapping(value = "/cmbnInfo")
	public ModelAndView cmbnInfo(ModelAndView mav) {
		
		mav.setViewName("CS/clnt/cmbnInfo");
		
		return mav;
	}
	
	// 로그인 뷰 고정
	@RequestMapping(value = "/cLoc")
	public ModelAndView cLoc(HttpSession session, ModelAndView mav) {
		if(session.getAttribute("sClntNum") != null) {
			mav.setViewName("CS/clnt/cLoc");
		} else {
			mav.setViewName("redirect:clntLogin");
		}
		
		return mav;
	}
	
	// 아이디 찾기
	@RequestMapping(value = "/findId")
	public ModelAndView findId(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		
		
		
		mav.setViewName("CS/clnt/findId");
		return mav;
	}
	
	@RequestMapping(value="/userAjax", method=RequestMethod.POST, 
			produces="text/json;charset=UTF-8")
	@ResponseBody // View로 인식 시킴
	public String userAjax(@RequestParam HashMap<String,String> params) throws Throwable {
	
		ObjectMapper mapper = new ObjectMapper();
		
		//데이터를 담을 객체
		Map<String,Object> modelMap = new HashMap<String,Object>();
				
		int cnt = iCommonService.getIntData("cl.findId2",params);
		
		modelMap.put("cnt",cnt);
		
		return mapper.writeValueAsString(modelMap); 
	}
	
	
	//아이디 찾기 Ajax
	
	@RequestMapping(value="/findIdAjax", method=RequestMethod.POST, 
			produces="text/json;charset=UTF-8")
	@ResponseBody // View로 인식 시킴
	public String findIdAjax(@RequestParam HashMap<String,String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String,Object> modelMap = new HashMap<String,Object>();
		
		List<HashMap<String, String>> list = iCommonService.getDataList("cl.findId",params);
		int cnt = iCommonService.getIntData("cl.findId2",params);
		modelMap.put("list",list);
		modelMap.put("cnt",cnt);
		// 정보 없을시
		if(cnt==0) {
			modelMap.put("res", "failed");
		}
		return mapper.writeValueAsString(modelMap);
	}
	
	// 비밀번호 찾기
	@RequestMapping(value = "/findPw")
	public ModelAndView findPw(ModelAndView mav) {
		mav.setViewName("CS/clnt/findPw");

		return mav;
	}
	
	// 비밀번호 체크
	@RequestMapping(value="/pwCheckAjax", method=RequestMethod.POST, 
			produces="text/json;charset=UTF-8")
	@ResponseBody // View로 인식 시킴
	public String pwCheckAjax(@RequestParam HashMap<String,String> params) throws Throwable {
	
		ObjectMapper mapper = new ObjectMapper();
		
		//데이터를 담을 객체
		Map<String,Object> modelMap = new HashMap<String,Object>();
				
		int cnt = iCommonService.getIntData("cl.pwCheck",params);
		
		modelMap.put("cnt",cnt);
		
		return mapper.writeValueAsString(modelMap); 
	}
	
	
	// 비밀번호 찾기 Ajax
	
	@RequestMapping(value="/findPwAjax", method=RequestMethod.POST, 
			produces="text/json;charset=UTF-8")
	@ResponseBody // View로 인식 시킴
	public String findPwAjax(@RequestParam HashMap<String,String> params) throws Throwable {
		
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String,Object> modelMap = new HashMap<String,Object>();
		
		List<HashMap<String, String>> list = iCommonService.getDataList("cl.findPw",params);
		int cnt = iCommonService.getIntData("cl.pwCheck",params);
		modelMap.put("list",list);
		modelMap.put("cnt",cnt);
		// 정보 없을시
		if(cnt==0) {
			modelMap.put("res", "failed");
		}
		return mapper.writeValueAsString(modelMap);
	}
	
	// 회원가입
	@RequestMapping(value = "/signUp")
	public ModelAndView signUp(ModelAndView mav) {
		mav.setViewName("CS/clnt/signUp");
		
		return mav;
	}
	
	// 회원 가입, 수정, 탈퇴
	@RequestMapping(value="/signUpActionAjax/{gbn}", method = RequestMethod.POST,
					produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String signUpActionAjax(@RequestParam HashMap<String, String> params,
								   @PathVariable String gbn) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			
			switch(gbn) {
			case "i":
				int cnt = iCommonService.getIntData("cl.checkid",params);
				if(cnt == 0) {
					params.put("signup_pw", Utils.encryptAES128(params.get("signup_pw")));
					iCommonService.insertData("cl.signUp", params);
				} else {
					modelMap.put("chc","falied");
				}
				break;
			case "m":
				params.put("pw", Utils.encryptAES128(params.get("pw")));
				iCommonService.updateData("cl.mdfyPw", params);
				break;
			case "u":
				params.put("pw", Utils.encryptAES128(params.get("pw")));
				iCommonService.updateData("cl.updateClnt", params);
				break;
			case "d":
				iCommonService.updateData("cl.delClnt", params);
				break;
			}
			modelMap.put("res", "success");
			
		} catch(Throwable e) {
			e.printStackTrace();
			modelMap.put("res", "failed");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/cont")
	public ModelAndView cont(ModelAndView mav) {
		mav.setViewName("CS/clnt/cont");
		
		return mav;
	}
}
