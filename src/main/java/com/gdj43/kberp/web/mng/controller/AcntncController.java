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
import com.gdj43.kberp.web.mng.service.IAcntncService;

/*** 회계 메뉴 ***/

@Controller
public class AcntncController {
	
	@Autowired
	public ICommonService iCommonService;
	
	@Autowired
	public IPagingService iPagingService;
	
	@Autowired
	public IAcntncService iAcntncService;
	
	@Autowired
	public IAprvlService iAprvlService;
	
	// 지출결의서 상세보기
	@RequestMapping(value = "/expnsRsltnDtlView")
	public ModelAndView expnsRsltn(ModelAndView mav) {
		
		mav.setViewName("mng/expnsRsltnDtlView");
		
		return mav;
	}
	
	// 내부비용관리 전체 목록
	@RequestMapping(value ="/intrnlCostMng")
	public ModelAndView intrnlCostMng(@RequestParam HashMap<String, String> params, ModelAndView mav) {
		
		if(params.get("page") == null || params.get("page") == "") {
			params.put("page", "1");
		}
		
		mav.addObject("page", params.get("page"));
		mav.setViewName("mng/intrnlCostMngList");
		
		return mav;
	}
	
	// 내부비용관리 ajax
	@RequestMapping(value ="/intrnlCostMngAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String intrnlCostMngAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		// 총 게시글 수
		int cnt = iCommonService.getIntData("IntrnlCostMng.getIntrnlCostMngCnt", params);
		
		// 페이징 계산
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 10, 5);
		
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iCommonService.getDataList("IntrnlCostMng.getIntrnlCostMngList", params);
		
		modelMap.put("list", list); 
		modelMap.put("pb", pb); 
		
		return mapper.writeValueAsString(modelMap);
	}
	
	// 내부비용관리 월별 목록
	@RequestMapping(value ="/intrnlCostMngMnthlyList")
	public ModelAndView intrnlCostMngMnthlyList(@RequestParam HashMap<String, String> params, ModelAndView mav) {
		
		if(params.get("page2") == null || params.get("page2") == "") {
			params.put("page2", "1");
		}
		
		mav.addObject("page2", params.get("page2"));
		mav.setViewName("mng/intrnlCostMngMnthlyList");
		
		return mav;
	}
	
	// 내부비용관리 월별 목록 ajax
	@RequestMapping(value ="/intrnlCostMngMnthlyListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String intrnlCostMngMnthlyListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		// 총 게시글 수
		int cnt = iCommonService.getIntData("IntrnlCostMng.intrnlCostMngMnthlyCnt", params);
		
		// 페이징 계산
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page2")), cnt, 10, 5);
		
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iCommonService.getDataList("IntrnlCostMng.intrnlCostMngMnthlyList", params);
		
		HashMap<String, String> data = iCommonService.getData("IntrnlCostMng.intrnlCostMngMnthlyData", params);
		
		modelMap.put("data", data);
		modelMap.put("list", list); 
		modelMap.put("pb", pb); 
		
		return mapper.writeValueAsString(modelMap);
	}
	
	// 내부비용관리 상세보기
	@RequestMapping(value = "/intrnlCostMngDtlView")
	public ModelAndView intrnlCostMngDtlView(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		
		HashMap<String, String> data = iCommonService.getData("IntrnlCostMng.intrnlCostMngDtlView", params);
		
		mav.addObject("data", data);
		
		mav.setViewName("mng/intrnlCostMngDtlView");
		
		return mav;
	}
	
	// 내부비용관리 신규
	@RequestMapping(value = "/intrnlCostMngAdd")
	public ModelAndView intrnlCostMngAdd(ModelAndView mav) {
		
		mav.setViewName("mng/intrnlCostMngAdd");
		
		return mav;
	}
	
	// 내부비용관리 수정
	@RequestMapping(value = "/intrnlCostMngUpdate")
	public ModelAndView intrnlCostMngUpdate(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		
		HashMap<String, String> data = iCommonService.getData("IntrnlCostMng.intrnlCostMngDtlView", params);
		
		mav.addObject("data", data);
		
		mav.setViewName("mng/intrnlCostMngUpdate");
		
		return mav;
	}
	
	// 계정 검색 ajax
	@RequestMapping(value = "/acntSrchAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String acntSrchAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		// 총 게시글 수
		int cnt = iCommonService.getIntData("IntrnlCostMng.getAcntSrchCnt", params);
		
		// 페이징 계산
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 6, 5);
		
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iCommonService.getDataList("IntrnlCostMng.getAcntSrchList", params);
		
		modelMap.put("list", list); 
		modelMap.put("pb", pb); 
		
		return mapper.writeValueAsString(modelMap);
	}
	
	// 내부비용관리 Action ajax
	@RequestMapping(value = "/intrnlCostMngAction/{gbn}", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String intrnlCostMngActionAjax(@RequestParam HashMap<String, String> params, @PathVariable String gbn) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			switch(gbn) {
			case "insert":
				iCommonService.insertData("IntrnlCostMng.writeIntrnlCostMng", params);
				break;
			case "update":
				iCommonService.updateData("IntrnlCostMng.updateIntrnlCostMng", params);
				break;
			case "delete":
				iCommonService.deleteData("IntrnlCostMng.deleteIntrnlCostMng", params);
				break;
			case "monDelete":
				iAcntncService.deleteMonData("IntrnlCostMng.deleteMonIntrnlCostMng", params);
			}
			modelMap.put("res", "success");
		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("res", "failed");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	// 전표관리
	@RequestMapping(value = "/chitMng")
	public ModelAndView chitMng(@RequestParam HashMap<String, String> params, ModelAndView mav) {
		
		if(params.get("page") == null || params.get("page") == "") {
			params.put("page", "1");
		}
		
		if(params.get("mon") == null || params.get("mon") == "") {
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
			String thisMon = sdf.format(today);
			params.put("mon", thisMon);			
		}
		
		mav.addObject("page", params.get("page"));
		mav.addObject("mon", params.get("mon"));
		
		mav.setViewName("mng/chitMng");
		
		return mav;
	}
	
	// 전표관리 ajax
	@RequestMapping(value = "/chitMngAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String chitMngAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		// 총 게시글 수
		int cnt = iCommonService.getIntData("ChitMng.getChitMngCnt", params);
		
		// 페이징 계산
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 10, 5);
		
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
		
		// 전표 목록 조회
		List<HashMap<String, String>> list = iCommonService.getDataList("ChitMng.getChitMngList", params);
		
		// 대변 합계, 차변 합계 조회
		HashMap<String, String> data = iCommonService.getData("ChitMng.getChitMngData", params);
		
		// 결재 진행 상태 확인
		HashMap<String, String> aprvlSts = iCommonService.getData("ChitMng.getChitMngAprvlSts", params);
		
		modelMap.put("aprvlSts", aprvlSts);
		modelMap.put("list", list); 
		modelMap.put("pb", pb); 
		modelMap.put("data", data); 
		modelMap.put("monCheck", params.get("mon"));
		
		return mapper.writeValueAsString(modelMap);
		
	}
	
	// 전표관리에서 전표번호 클릭 시 체크
	@RequestMapping(value = "/chitNumCheck")
	public ModelAndView chitNumCheck(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		
		int expnsRsltnCheck = iCommonService.getIntData("ChitMng.expnsRsltnCheck", params);
		
		if(expnsRsltnCheck == 1) {
			// 지출결의서관리 상세보기로 이동
			mav.addObject("res", "expnsRsltnGo");
			mav.addObject("top", "34");
			mav.addObject("menuNum", "39");
			mav.addObject("menuType", "M");
			
		} else {
			
			int intrnlCostCheck = iCommonService.getIntData("ChitMng.intrnlCostCheck", params);
			
			if(intrnlCostCheck == 1) {
				// 내부비용관리 상세보기로 이동
				mav.addObject("res", "intrnlCostGo");
				mav.addObject("top", "34");
				mav.addObject("menuNum", "39");
				mav.addObject("menuType", "M");
				
			} else {
				
				int cntrctCheck = iCommonService.getIntData("ChitMng.cntrctCheck", params);
				
				if(cntrctCheck == 1) {
					mav.addObject("res", "cntrctGo");
					mav.addObject("top", "34");
					mav.addObject("menuNum", "39");
					mav.addObject("menuType", "M");
				}
			}
		}
		
		mav.setViewName("mng/chitNumCheck");
		return mav;
	}
	
	// 지출결의서관리 목록
	@RequestMapping(value = "/expnsRsltnadmnstr")
	public ModelAndView expnsRsltnadmnstr(@RequestParam HashMap<String, String> params, ModelAndView mav) {
		
		if(params.get("page") == null || params.get("page") == "") {
			params.put("page", "1");
		}
		
		mav.addObject("page", params.get("page"));
		
		mav.setViewName("mng/expnsRsltnadmnstrList");
		
		return mav;
	}
	
	// 지출결의서관리 목록 ajax
	@RequestMapping(value = "/expnsRsltnadmnstrAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String expnsRsltnadmnstrAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		// 총 게시글 수
		int cnt = iCommonService.getIntData("expnsRsltnadmnstr.getExpnsCnt", params);
		
		// 페이징 계산
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 10, 5);
		
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iCommonService.getDataList("expnsRsltnadmnstr.getExpnsList", params);
		
		modelMap.put("list", list); 
		modelMap.put("pb", pb); 
		
		return mapper.writeValueAsString(modelMap);
	}
	
	// 지출결의서관리 사원별 월별 목록
	@RequestMapping(value = "/expnsRsltnadmnstrEmpMnthlyList")
	public ModelAndView expnsRsltnadmnstrEmpMnthlyList(@RequestParam HashMap<String, String> params, 
													   ModelAndView mav) throws Throwable {
		
		if(params.get("page2") == null || params.get("page2") == "") {
			params.put("page2", "1");
		}
		
		mav.addObject("page2", params.get("page2"));
		
		mav.setViewName("mng/expnsRsltnadmnstrEmpMnthlyList");
		
		return mav;
	}
	
	// 지출결의서관리 사원별 월별 목록 ajax
	@RequestMapping(value = "/expnsRsltnadmnstrEmpMnthlyListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String expnsRsltnadmnstrEmpMnthlyListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		// 총 게시글 수
		int cnt = iCommonService.getIntData("expnsRsltnadmnstr.getExpnsEmpMnthlyCnt", params);
		
		// 페이징 계산
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page2")), cnt, 10, 5);
		
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iCommonService.getDataList("expnsRsltnadmnstr.getExpnsEmpMnthlyList", params);
		
		HashMap<String, String> data = iCommonService.getData("expnsRsltnadmnstr.getExpnsEmpMnthlyData", params);
		
		modelMap.put("data", data);
		modelMap.put("list", list); 
		modelMap.put("pb", pb); 
		
		return mapper.writeValueAsString(modelMap);
	}
	
	// 지출결의서관리 사원별 월별 상세보기
	@RequestMapping(value = "/expnsRsltnadmnstrEmpMnthly")
	public ModelAndView expnsRsltnadmnstrDtl(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
	
		HashMap<String, String> data = iCommonService.getData("expnsRsltnadmnstr.expnsRsltnadmnstrDtl", params);
			
		mav.addObject("data", data);
		
		mav.setViewName("mng/expnsRsltnadmnstrEmpMnthly");
		
		return mav;
	}
	
	// 영업매출 상세보기
	@RequestMapping(value = "/cntrctDtlView")
	public ModelAndView cntrctDtlView(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		
		HashMap<String, String> data = iCommonService.getData("ChitMng.cntrctDtlView", params);
		
		mav.addObject("data", data);
		
		mav.setViewName("mng/cntrctDtlView");
		
		return mav;
	}
	
	// 결재 요청
	@RequestMapping(value = "/aprvlRqstAjax/{gbn}", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
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
				iCommonService.insertData("ChitMng.aprvlOk", params);
				break;
			case "aprvlAgainOk" :
				iCommonService.updateData("ChitMng.aprvlAgainOk", params);
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
