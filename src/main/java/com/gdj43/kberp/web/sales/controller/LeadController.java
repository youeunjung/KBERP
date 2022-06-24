package com.gdj43.kberp.web.sales.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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
import com.gdj43.kberp.common.bean.PagingBean;
import com.gdj43.kberp.common.service.IPagingService;
import com.gdj43.kberp.web.common.service.ICommonService;

// ********** 리드관리 *********
@Controller
public class LeadController {
	
	@Autowired
	public ICommonService iCommonService;
	
	@Autowired
	public IPagingService iPagingService;

// 리드 리스트
	@RequestMapping(value = "/leadList")
	public ModelAndView leadList(@RequestParam HashMap<String, String> params,
								 ModelAndView mav) throws Throwable {
		
		if(params.get("page") == null || params.get("page") == "") {
			params.put("page", "1");
		}
		
		int listCnt = iCommonService.getIntData("lead.getListCnt", params);
		int ongoingCnt = iCommonService.getIntData("lead.getOngoingCnt", params);
		int rcgntnCnt = iCommonService.getIntData("lead.getRcgntnCnt", params);
		int failCnt = iCommonService.getIntData("lead.getFailCnt", params);
		
		Date dt = new Date();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(dt);
		cal.add(Calendar.DATE, -30);
		
		String startDate = sdf.format(cal.getTime());
		String endDate = sdf.format(dt);

		
		if(params.get("startDate") == null || params.get("startDate") == "") {
			params.put("startDate", startDate); 
			params.put("endDate", endDate); // 넘어오는게 없으면 현재날짜뽑아온거를 추가.
		}
		

		mav.addObject("page", params.get("page"));
		
		mav.addObject("listCnt", listCnt);
		mav.addObject("ongoingCnt", ongoingCnt);
		mav.addObject("rcgntnCnt", rcgntnCnt);
		mav.addObject("failCnt", failCnt);
		mav.addObject("startDate", params.get("startDate"));
		mav.addObject("endDate", params.get("endDate"));
		
		mav.setViewName("sales/lead/leadList");
		
		return mav;
	}
	
	@RequestMapping(value = "/leadListAjax", method = RequestMethod.POST, 
					produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String leadListAjax(@RequestParam HashMap<String, String> params, 
							   HttpSession session) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		// 총 게시글 수
		
		int cnt = iCommonService.getIntData("lead.getLeadCnt", params);
		
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 10, 5);
				
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iCommonService.getDataList("lead.getLeadList", params);
		
		modelMap.put("cnt", cnt);
		modelMap.put("list", list);
		modelMap.put("pb", pb);
		
		return mapper.writeValueAsString(modelMap);
	}

// 리드 등록
	@RequestMapping(value = "/leadReg")
	public ModelAndView leadReg(ModelAndView mav) {
		
		mav.setViewName("sales/lead/leadReg");
		
		return mav;
	}
	
	@RequestMapping(value ="/leadAction/{gbn}", method = RequestMethod.POST,
					produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String leadActionAjax(@RequestParam HashMap<String, String> params,
								 @PathVariable String gbn) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			switch(gbn) {
			case "insert" :
				iCommonService.insertData("lead.getLeadAdd", params); // 리드 등록
				iCommonService.insertData("lead.getLeadAttAdd", params); // 리드 등록 첨부파일
				break;
			case "ecInsert" :
				iCommonService.insertData("lead.getClntAdd", params); // 리드 등록에서 고객추가		
				break;	
			case "update" :
				iCommonService.updateData("lead.getLeadUpdate", params); // 리드 수정
				iCommonService.updateData("lead.getLeadAttUpdate", params); // 리드 첨부파일 수정
				break;
			case "salesChangeSuccess" :
				iCommonService.updateData("lead.scsUpdate", params); // 리드 셀렉트박스에서 진행상태-영업기회전환시 진행상태빼고 업데이트
				break;
			case "delete" :
				iCommonService.updateData("lead.getLeadDelete", params); // 리드 삭제
				break;
			}
			modelMap.put("res", "success");
		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("res", "failed");
		}
		
		return mapper.writeValueAsString(modelMap); 
	}
		
//	리드 상세보기
	@RequestMapping(value = "/leadCont")
	public ModelAndView leadCont(@RequestParam HashMap<String, String> params, 
								 ModelAndView mav) throws Throwable {
		
		HashMap<String, String> data = iCommonService.getData("salesSchdl.getLeadCont", params);
		
		mav.addObject("data", data);
		
		mav.setViewName("sales/lead/leadCont");
		
		return mav;
	}
// 리드 수정
	@RequestMapping(value = "/leadUpdate")
	public ModelAndView leadUpdate(@RequestParam HashMap<String, String> params, 
								 ModelAndView mav) throws Throwable {
		
		HashMap<String, String> data = iCommonService.getData("lead.getLeadCont", params);
		
		mav.addObject("data", data);
		
		mav.setViewName("sales/lead/leadUpdate");
		
		return mav;
	}
// 리드 일정	
	@RequestMapping(value ="/leadSchdlAjax", method = RequestMethod.POST,
					produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String leadSchdlAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();

		HashMap<String, String> lsData = iCommonService.getData("salesSchdl.leadSchdlCont", params);
		
		modelMap.put("lsData", lsData);
		
		return mapper.writeValueAsString(modelMap); 
	}
// 담당자 조회 팝업	
	@RequestMapping(value = "/mngrListAjax", method = RequestMethod.POST, 
					produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String mngrListAjax(@RequestParam HashMap<String, String> params, 
							   HttpSession session) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
			
		Map<String, Object> modelMap = new HashMap<String, Object>();		
			
	// 총 게시글 수
		int cnt = iCommonService.getIntData("lead.getMngrCnt", params);
			
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 5, 5);
			
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
			
		List<HashMap<String, String>> mngrList = iCommonService.getDataList("lead.getMngrList", params);
			
		modelMap.put("cnt", cnt);
		modelMap.put("list", mngrList);
		modelMap.put("pb", pb);
		
		return mapper.writeValueAsString(modelMap);
	}
// 고객사 조회 팝업
	@RequestMapping(value = "/ccListAjax", method = RequestMethod.POST, 
					produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String ccListAjax(@RequestParam HashMap<String, String> params, 
	  					     HttpSession session) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();		
		
	// 총 게시글 수
		int ccCnt = iCommonService.getIntData("lead.getCcCnt", params);
		
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), ccCnt, 5, 5);
		
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> ccList = iCommonService.getDataList("lead.getCcList", params);
		
		modelMap.put("list", ccList);
		modelMap.put("pb", pb);
		
		return mapper.writeValueAsString(modelMap);
	}
		
// 고객 조회 팝업
	@RequestMapping(value = "/ecListAjax", method = RequestMethod.POST, 
					produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String ecListAjax(@RequestParam HashMap<String, String> params, 
 						     HttpSession session) throws Throwable {
			
		ObjectMapper mapper = new ObjectMapper();
			
		Map<String, Object> modelMap = new HashMap<String, Object>();		
		
	// 총 게시글 수
		int ecCnt = iCommonService.getIntData("lead.getEcCnt", params);
			
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), ecCnt, 5, 5);
			
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
			
		List<HashMap<String, String>> ecList = iCommonService.getDataList("lead.getEcList", params);
			
		modelMap.put("list", ecList);
		modelMap.put("pb", pb);
			
		return mapper.writeValueAsString(modelMap);
	}	
}