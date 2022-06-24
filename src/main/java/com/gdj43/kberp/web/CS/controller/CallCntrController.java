package com.gdj43.kberp.web.CS.controller;

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
import com.gdj43.kberp.web.CS.service.ICallCntrService;
import com.gdj43.kberp.web.common.service.ICommonService;

@Controller
public class CallCntrController {
	@Autowired
	public ICallCntrService iccs;
	
	@Autowired
	public ICommonService iCommonService;
	
	@Autowired
	public IPagingService ips;
	
	@RequestMapping(value="callCenter")
	public ModelAndView callCenter(@RequestParam HashMap<String, String> params,
								   ModelAndView mav) {
		
		mav.setViewName("CS/callCenter");
		
		return mav;
	}
	
	// 콜센터 고객 검색 팝업 내용
	@RequestMapping(value = "/callCenterPopListAjax", method = RequestMethod.POST, 
			produces = "text/json;charset=UTF-8")
		@ResponseBody
		public String callCenterPopListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
			ObjectMapper mapper = new ObjectMapper();
			
			Map<String, Object> modelMap = new HashMap<String, Object>();
			
			List<HashMap<String, String>> list = iCommonService.getDataList("CC.getCallCenterClnt", params);
			
			modelMap.put("list", list);
			
			return mapper.writeValueAsString(modelMap); 
		}
	
	// 고객정보 단건
	@RequestMapping(value = "/callCenterClntAjax", method = RequestMethod.POST, 
			produces = "text/json;charset=UTF-8")
		@ResponseBody
		public String callCenterClntAjax(@RequestParam HashMap<String, String> params) throws Throwable {
			ObjectMapper mapper = new ObjectMapper();
			
			Map<String, Object> modelMap = new HashMap<String, Object>();
			
			HashMap<String, String> data = iCommonService.getData("CC.getCallCenterC", params);
			
			modelMap.put("data", data);
			
			return mapper.writeValueAsString(modelMap); 
		}
	
	// 콜센터 상담이력
	@RequestMapping(value = "/callCenterCnslListAjax", method = RequestMethod.POST, 
			produces = "text/json;charset=UTF-8")
		@ResponseBody
		public String callCenterCnslListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
			ObjectMapper mapper = new ObjectMapper();
			
			Map<String, Object> modelMap = new HashMap<String, Object>();
			
			List<HashMap<String, String>> list = iCommonService.getDataList("CC.getCallCenterCnsl", params);
			
			modelMap.put("list", list);
			
			return mapper.writeValueAsString(modelMap); 
		}
	
	
	
	// 콜센터 고객정보, 상담노트 저장
	@RequestMapping(value="/callCenterAction/{gbn}", method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
			@ResponseBody
			public String callCenterActionAjax(@RequestParam HashMap<String, String> params,
										   	   @PathVariable String gbn) throws Throwable {
				ObjectMapper mapper = new ObjectMapper();
		
				Map<String, Object> modelMap = new HashMap<String, Object>();
				
				try {
					switch(gbn) {
					case "ClntSave":
						//시퀀스 취득
						String seq = iCommonService.getStringData("CC.clntSeq");
						// params에 시퀀스 추가
						params.put("clntSeq", seq);
						
						iCommonService.insertData("CC.clntSave", params);
						
						// modelMap에 시퀀스 추가
						
						HashMap<String, String> data = iCommonService.getData("CC.clntParam", params);
						modelMap.put("data", data);
						modelMap.put("clntSeq", seq);
						
						break;
					case "NoteSave":
						iCommonService.insertData("CC.noteSave", params);
						break;
					case "ClntUpdate":
						
						iCommonService.updateData("CC.clntUpdate", params);
						// modelMap에 시퀀스 추가
						HashMap<String, String> data2 = iCommonService.getData("CC.clntUpParam", params);
						modelMap.put("data", data2);
						break;
					}
					modelMap.put("res", "success");
					
				} catch(Throwable e) {
					e.printStackTrace();
					modelMap.put("res", "failed");
				}
				
				return mapper.writeValueAsString(modelMap);
			}
	
	// [이력] 상담노트 단건
	@RequestMapping(value = "/rcrdCnslNoteAjax", method = RequestMethod.POST, 
			produces = "text/json;charset=UTF-8")
		@ResponseBody
		public String rcrdCnslNoteAjax(@RequestParam HashMap<String, String> params) throws Throwable {
			ObjectMapper mapper = new ObjectMapper();
			
			Map<String, Object> modelMap = new HashMap<String, Object>();
			
			HashMap<String, String> data = iCommonService.getData("CC.getRcrdCnslNote", params);
			
			modelMap.put("data", data);
			
			return mapper.writeValueAsString(modelMap); 
		}
	
	// 대응가이드 리스트
	
	
	
	@RequestMapping(value = "/rspndList")
	public ModelAndView rspndList(@RequestParam HashMap<String, String> params, 
			  						ModelAndView mav) {
		
		if(params.get("page") == null || params.get("page") == "") {
			params.put("page", "1");
		}
		
		mav.addObject("page", params.get("page"));
		
		return mav;
	}
	
	@RequestMapping(value = "/rspndListAjax", method = RequestMethod.POST, 
			produces = "text/json;charset=UTF-8")
		@ResponseBody
		public String rspndListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
			ObjectMapper mapper = new ObjectMapper();
			
			Map<String, Object> modelMap = new HashMap<String, Object>();
			
			// 총 게시글 수
			int cnt = iCommonService.getIntData("CC.getRspndCnt", params);
			
			// 페이징 계산
			PagingBean pb = ips.getPagingBean(Integer.parseInt(params.get("page")), cnt, 3, 5);
			
			params.put("startCnt", Integer.toString(pb.getStartCount()));
			params.put("endCnt", Integer.toString(pb.getEndCount()));
			
			List<HashMap<String, String>> list = iCommonService.getDataList("CC.getRspndList", params);
			
			modelMap.put("list", list);
			modelMap.put("pb", pb);
			
			return mapper.writeValueAsString(modelMap); 
		}
	
	// 대응가이드 등록, 수정, 삭제
	@RequestMapping(value="/rspndListAction/{gbn}", method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
			@ResponseBody
			public String rspndListActionAjax(@RequestParam HashMap<String, String> params,
										   	   @PathVariable String gbn) throws Throwable {
				ObjectMapper mapper = new ObjectMapper();
		
				Map<String, Object> modelMap = new HashMap<String, Object>();
				
				try {
					switch(gbn) {
					case "i":
						iCommonService.insertData("CC.rspndAdd", params);
						break;
					case "u":
						iCommonService.updateData("CC.rspndUp", params);
						break;
					case "d":
						iCommonService.updateData("CC.rspndDel", params);
						break;
					}
					modelMap.put("res", "success");
					
				} catch(Throwable e) {
					e.printStackTrace();
					modelMap.put("res", "failed");
				}
				
				return mapper.writeValueAsString(modelMap);
			}
	
		
	}

	
	
	

