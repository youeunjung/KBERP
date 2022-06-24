package com.gdj43.kberp.web.mng.controller;

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
import com.gdj43.kberp.web.common.service.ICommonService;

/*** 카드 관리 메뉴 ***/

@Controller
public class PrjctMngController {
	
	@Autowired
	public ICommonService ics;
	
	@Autowired
	public IPagingService iPagingService;
	
	@RequestMapping(value="/prjctMng")
	public ModelAndView prjctMng(@RequestParam HashMap<String,String> params, ModelAndView mav){
		if(params.get("page")== null || params.get("page")=="") {
			params.put("page", "1");
		}
		mav.addObject("page", params.get("page"));
		mav.setViewName("mng/prjctMng");
		return mav;
	}
	
	@RequestMapping(value="/prjctMngListAjax", method= RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String prjctMngListAjax(@RequestParam HashMap<String,String>params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String, Object>();
		//총 게시글 수
		int cnt = ics.getIntData("prjctMng.getCnt", params);
		
		//페이징 계산
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")),cnt,10,5);
		//PagingBean pb = iPagingService.getPagingBean(Integer.parseInt("1"),cnt,10,5);
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = ics.getDataList("prjctMng.prjctMngList", params);
		
		modelMap.put("pb", pb);
		modelMap.put("list", list);
		
		return mapper.writeValueAsString(modelMap);
	}
	//상세보기
			@RequestMapping(value = "/prjctView")
			public ModelAndView prjctView(@RequestParam HashMap<String, String> params, 
										 ModelAndView mav) throws Throwable {
			
				HashMap<String, String> data = ics.getData("prjctMng.prjctView", params);
				
				mav.addObject("data", data);
				
				mav.setViewName("mng/prjctView");
				
				return mav;
			}
	
			
			@RequestMapping(value="/prjctMngView2Ajax", method= RequestMethod.POST, produces = "text/json;charset=UTF-8")
			@ResponseBody
			public String prjctMngView2Ajax(@RequestParam HashMap<String,String>params) throws Throwable{
				ObjectMapper mapper = new ObjectMapper();
				Map<String,Object> modelMap = new HashMap<String, Object>();
				
				List<HashMap<String, String>> list = ics.getDataList("prjctMng.prjctView2", params);
				modelMap.put("list", list);
				
				return mapper.writeValueAsString(modelMap);
			}
			//프로젝트 등록
			@RequestMapping(value = "/prjctWrite")
			public ModelAndView prjctWrite(@RequestParam HashMap<String, String> params, ModelAndView mav)
					throws Throwable {

				mav.setViewName("mng/prjctWrite");

				return mav;
			}
			//프로젝트업데이트
			@RequestMapping(value = "/prjctUpdate")
			public ModelAndView prjctUpdate(@RequestParam HashMap<String, String> params, 
										 ModelAndView mav) throws Throwable {
				
				HashMap<String, String> data = ics.getData("prjctMng.prjctView", params);
				
				
				mav.addObject("data", data);
				mav.setViewName("mng/prjctUpdate");
				
				return mav;
			}
			@RequestMapping(value ="/prjctMngAction/{gbn}", method = RequestMethod.POST,
					produces = "text/json;charset=UTF-8") 
			@ResponseBody
			public String prjctMngActionAjax(@RequestParam HashMap<String, String> params,
									@PathVariable String gbn) throws Throwable {

				ObjectMapper mapper = new ObjectMapper();
				
				Map<String, Object> modelMap = new HashMap<String,Object>();
				try {
				switch(gbn) {
				case "insert":
					ics.insertData("prjctMng.prjctWrite",params);
					break;
				case "update":
					ics.updateData("prjctMng.prjctUpdate",params);
					break;
				case "delete":
					ics.updateData("prjctMng.prjctDel",params);
					break;
				case "input_delete":
					ics.deleteData("prjctMng.input_delete",params);
					break;
				}
					modelMap.put("res", "success");
				} catch (Throwable e) {
					e.printStackTrace();
					modelMap.put("res", "failed");
				}
			
				return mapper.writeValueAsString(modelMap);
			}
}