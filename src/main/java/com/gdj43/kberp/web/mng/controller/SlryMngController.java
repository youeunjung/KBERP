package com.gdj43.kberp.web.mng.controller;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
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
import com.gdj43.kberp.web.GW.service.IAprvlService;
import com.gdj43.kberp.web.common.service.ICommonService;

/*** 급여 관리 메뉴 ***/

@Controller
public class SlryMngController {
	
	@Autowired
	public ICommonService iCommonService;
	
	@Autowired
	public IPagingService iPagingService;
	
	@Autowired
	public IAprvlService iAprvlService;
	
	// 급여명세서조회(관리자)
	@RequestMapping(value = "/slrSpcfctnList")
	public ModelAndView slrSpcfctnList(@RequestParam HashMap<String, String> params, ModelAndView mav) {
		
		if(params.get("page") == null || params.get("page") == "") {
			params.put("page", "1");
		}
		
		if(params.get("mon") == null || params.get("mon") == "") {
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
			String thisMon = sdf.format(today);
			params.put("mon", thisMon);			
		}
		
		mav.addObject("mon", params.get("mon"));
		mav.addObject("page", params.get("page"));
		
		mav.setViewName("mng/slrSpcfctnList");
		
		return mav;
	}
	
	// 급여명세서조회(관리자) ajax
	@RequestMapping(value ="/slrSpcfctnListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String slrSpcfctnListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		// 총 게시글 수
		int cnt = iCommonService.getIntData("SlryMng.getSlryMngCnt", params);
		
		// 페이징 계산
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 10, 5);
		
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
		
		// 급여명세서 목록 조회
		List<HashMap<String, String>> list = iCommonService.getDataList("SlryMng.getSlryMngList", params);
		
		// 결재 진행 상태 확인
		HashMap<String, String> aprvlSts = iCommonService.getData("SlryMng.getSlryMngAprvlSts", params);
		
		modelMap.put("aprvlSts", aprvlSts);
		
		modelMap.put("list", list);
		modelMap.put("pb", pb);
		
		return mapper.writeValueAsString(modelMap);
	}

	// 급여명세서 상세보기(관리자)
	@RequestMapping(value = "/slrSpcfctnViewMng")
	public ModelAndView slrSpcfctnViewMng(@RequestParam HashMap<String, String> params, 
								 ModelAndView mav) throws Throwable {
	
		HashMap<String, String> data = iCommonService.getData("SlryMng.slrSpcfctnView", params);
		
		mav.addObject("data", data);
		
		mav.setViewName("mng/slrSpcfctnViewMng");
		
		return mav;
	}
		
	@RequestMapping(value = "/slryAprvlRqstAjax/{gbn}", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String aprvlRqstAjax(@RequestParam HashMap<String, String> params, @PathVariable String gbn) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			switch(gbn) {
			case "rqst" :
				String[] aprvler = null;
	    	    String[] rfrnc = null;
	    	    List<String> aprvlerList = null;
	    	    List<String> rfrncList = null;
	    	    
	    	    if(params.get("aprvlerList") != null && !params.get("aprvlerList").equals("") ) {
	    		    aprvler = params.get("aprvlerList").split(",");
	    		    aprvlerList = Arrays.asList(aprvler);
	    	    }
	    	    
	    	    if(params.get("rfrncList") != null && !params.get("rfrncList").equals("") ) {
	    		    rfrnc = params.get("rfrncList").split(",");
	    		    rfrncList = Arrays.asList(rfrnc);
	    	    }
	    	    
	    	    String aprvl_num = iAprvlService.aprvlAdd(params.get("emp_num"), params.get("title"), params.get("cont"), aprvlerList, rfrncList, null);
	    	    modelMap.put("aprvlNum", aprvl_num);
	    	    System.out.println("결재번호 : " + aprvl_num);
	    	    break;
			case "aprvlOk" :
				iCommonService.insertData("SlryMng.aprvlOk", params);
				break;
			case "aprvlAgainOk" :
				iCommonService.updateData("SlryMng.aprvlAgainOk", params);
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
