package com.gdj43.kberp.web.GW.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import com.gdj43.kberp.web.GW.service.IMsgrService;
import com.gdj43.kberp.web.common.service.ICommonService;


@Controller
public class MsgrController {

	@Autowired
	public ICommonService ics;
	
	@Autowired
	public IMsgrService ims;
	
	@Autowired
	public IPagingService ips;
	
	@RequestMapping(value = "/msgr")
	public ModelAndView msgr(ModelAndView mav) throws Throwable {
		
		int maxNo = ims.getMaxNo();
		
		mav.addObject("maxNo", maxNo);
		System.out.println("##########" + maxNo);
		
		mav.setViewName("GW/msgr");
		
		return mav;
	}
		
	
	@RequestMapping(value = "/actionChatAjax/{gbn}", method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String actionChatAjax(@RequestParam HashMap<String, String> params,
							  @RequestParam(required = false) List<String> srch_check,
			 				  HttpSession session, // 세션에서 받은것 추가하기
			 				  @PathVariable String gbn) throws Throwable {
		
	ObjectMapper mapper = new ObjectMapper();
	
	Map<String, Object> modelMap = new HashMap<String, Object>();	
	
	
	
	params.put("sEmpNum", String.valueOf(session.getAttribute("sEmpNum")));
	
	if(srch_check != null) {
		srch_check.add(String.valueOf(session.getAttribute("sEmpNum")));
	}
	
		try {
			switch(gbn) {
			case "insert" :
				String seq = ics.getStringData("msgr.chatSeq");
				params.put("chatsq", seq); // 채팅방 번호 넣어주기
				ics.insertData("msgr.insertChat", params);
				
				//반복문으로 하거나 srch_check를 인서트해서 hashmap put 계속추가?
				for(String num : srch_check) {
					HashMap<String, String> data = new HashMap<String, String>();
					data.put("chatsq", seq);
					data.put("num", num);
					ics.insertData("msgr.insertChatHead", data);
				}
				/* ics.insertData("msgr.insertCont",params); */
				break;
				
			case "join" :
				ics.updateData("msgr.joinChat", params);
				break;
				
	/*		case "delete" :
				ims.deleteChat(params);
				break; */
			}
			modelMap.put("res", "success");
		}catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("res", "failed");
		}
		
		return mapper.writeValueAsString(modelMap);
		}
	

	
	@RequestMapping(value = "/addListChatAjax", method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	
	@ResponseBody
	public String addListChatAjax(@RequestParam HashMap<String, String> params, HttpSession session) throws Throwable {
		
		System.out.println("@@@@@@@@@@@@@@dsad" + params);
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		params.put("sEmpNum", String.valueOf(session.getAttribute("sEmpNum")));
		
		List<HashMap<String, String>> list = ics.getDataList("msgr.addListChat", params) ;
		
		modelMap.put("list", list);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	
	// 채팅방리스트
	@RequestMapping(value = "/DrawRoomAjax", method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	
	@ResponseBody
	public String DrawRoomAjax(@RequestParam HashMap<String, String> params, 
								  HttpSession session) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		params.put("sEmpNum", String.valueOf(session.getAttribute("sEmpNum")));
		
		int chatCnt = ics.getIntData("msgr.chatCnt", params);
		
		List<HashMap<String, String>> list = ics.getDataList("msgr.DrawRoom", params);

		modelMap.put("list", list);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	
	
	@RequestMapping(value = "/addListRoomAjax", method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	
	@ResponseBody
	public String addListRoomAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		List<HashMap<String, String>> list = ics.getDataList("msgr.addListRoom", params) ;
		
		modelMap.put("list", list);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	
	@RequestMapping(value = "/insertContAjax", method = RequestMethod.POST, 
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String insertChatAjax(@RequestParam HashMap<String, String> params,
											   HttpServletRequest request,
											   HttpSession session,
											   ModelAndView modelAndView) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();	
		
		params.put("sEmpNum", String.valueOf(session.getAttribute("sEmpNum")));
		
		try {
			System.out.println("!!!!!!!!!!!!!!!" + params);
			
			ics.insertData("msgr.insertCont", params);
			
			modelMap.put("messege", CommonProperties.RESULT_SUCCESS);
		} catch (Exception e) {
			modelMap.put("message", CommonProperties.RESULT_ERROR);
			modelMap.put("errorMessage", e.getMessage());
		}
		return mapper.writeValueAsString(modelMap);
	}
	
	
	@RequestMapping(value = "/getContListAjax", method = RequestMethod.POST, 
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String getContListAjax(@RequestParam HashMap<String, String> params,
												HttpServletRequest request,
												ModelAndView mav) throws Throwable {
		
		System.out.println("#######" + params.get("lastContNo"));
		System.out.println("$$$$$$$" + params.get("chatNum"));
		System.out.println("%%%%%%%" + params);
		System.out.println(params.get("sEmpNum"));
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
	//	int lastContNo = Integer.parseInt(request.getParameter("lastContNo"));
		
		
		try {
			
			List<HashMap<String, String>> list = ims.getContList(params);
			HashMap<String, String> data =  ims.getCont(params);
			// params로 넘겨야함.
			// params로 받았을 경우, 내가 읽은번호 업데이트로 업데이트
			
			
			System.out.println("6666666666" + params);
			System.out.println("7777777777" + list);
			System.out.println("8888888888" + params.get("chatNum"));
			
			modelMap.put("list", list);
			modelMap.put("data", data);
			modelMap.put("message", CommonProperties.RESULT_SUCCESS);
		} catch (Exception e) {
			modelMap.put("message", CommonProperties.RESULT_ERROR);
			modelMap.put("errorMessage", e.getMessage());
		}
		
		return mapper.writeValueAsString(modelMap);
	} 
		
	
}
