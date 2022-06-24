package com.gdj43.kberp.web.sales.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gdj43.kberp.common.bean.PagingBean;
import com.gdj43.kberp.common.service.IPagingService;
import com.gdj43.kberp.util.Utils;
import com.gdj43.kberp.web.common.service.ICommonService;
import com.gdj43.kberp.web.sales.service.ISchdlService;


@Controller
public class RprtController {
	@Autowired
	public ICommonService iCommonService;
	
	@Autowired
	public IPagingService iPagingService;
	
	@Autowired
	public ISchdlService iSchdlService; 	
	
	//고객차트 보고서
	@RequestMapping(value = "/clntChart")
	public ModelAndView clntList(@RequestParam HashMap<String, String> params, 
								 ModelAndView mav) throws Throwable {
		
		Date mon = new Date();
		
		SimpleDateFormat month = new SimpleDateFormat("yyyy-MM");
	
		String  tMonth = month.format(mon);
		if(params.get("tMonth") == null || params.get("tMonth") == "") {
			params.put("tMonth", tMonth);			
		}
		
		mav.addObject("tMonth", params.get("tMonth"));
		mav.setViewName("sales/rprt/clntChart");
		
		return mav;
		
	}
	// 신규고객, 부서별 차트
	@RequestMapping(value = "/clntRprtAjax", method=RequestMethod.POST, 
					produces = "text/json;chartset=UTF-8")
	@ResponseBody
	public String clntRprtAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();
				
		HashMap<String, String> ccAll = iCommonService.getData("clntRprt.allCnt", params);
		System.out.println(params.get("tMonth"));
		
		ccAll.put("tMonth", params.get("tMonth"));
		
		modelMap.put("ccAll", ccAll);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	//고객등급 원형차트
	@RequestMapping(value = "/clntRprtDataAjax", method = RequestMethod.POST, 
					produces = "text/json;charset=UTF-8" )
	@ResponseBody
	public String clntRprtDataAjax(HttpServletRequest request, @RequestParam HashMap<String, Object> params) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
			
		int clntsize = Integer.parseInt(request.getParameter("clntsize"));
			
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		
		HashMap<String, Object> clntList = iSchdlService.getData("clntRprt.allCnt", params);
				
		for(int i = 0 ; i < clntsize ; i++) {
			HashMap<String, Object> temp = new HashMap<String, Object>();
			
			if(i == 0) {
				temp.put("name", "S등급");
			} else if(i == 1) {
				temp.put("name", "A등급");
			} else if(i == 2) {
				temp.put("name", "B등급");
			} else if(i == 3) {
				temp.put("name", "C등급");
			} else {
				temp.put("name", "D등급");
			}
			temp.put("y", Integer.parseInt(String.valueOf(clntList.get("GRADENUM"+i))));
				
			list.add(temp);
		}
		modelMap.put("list", list);
			
		return mapper.writeValueAsString(modelMap);		
	}

	/* 영업 차트 */
	@RequestMapping(value = "/salesChart")
	public ModelAndView salesChart(ModelAndView mav) throws Throwable{
		mav.setViewName("sales/salesChart");
		
		return mav;
	}
	
	/* 실적 차트 */
	@RequestMapping(value = "/pfmcChart")
	public ModelAndView pfmcChart(ModelAndView mav) throws Throwable {
		
		mav.setViewName("sales/pfmcChart");
		
		return mav;
	}
	
	/* 담당자 팝업 띄우기 */
	@RequestMapping(value = "/rprtmngListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8" )
	@ResponseBody
	public String mngListAjax(@RequestParam HashMap<String, String> params, HttpSession session) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int cnt = iCommonService.getIntData("salesRprt.getMngCnt", params);
		
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 5, 5);
		
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> mngList = iCommonService.getDataList("salesRprt.getMngList", params);
		
		modelMap.put("mngList", mngList);
		modelMap.put("pb", pb);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	
	/* 영업 차트 데이터 가져오기 */
	@RequestMapping(value = "/salesgetChartDataAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String salesgetChartDataAjax(@RequestParam HashMap<String, String> params, HttpServletRequest request) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int size = Integer.parseInt(request.getParameter("size"));
		
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		
		HashMap<String, String> bsnList = iCommonService.getData("salesRprt.getSalesBsnChart", params);
		HashMap<String, String> bsnName = iCommonService.getData("salesRprt.getSalesBsnName");
		
		for(int i = 0 ; i < size ; i++) {
			HashMap<String, Object> temp = new HashMap<String, Object>();
			
			temp.put("name", String.valueOf(bsnName.get("COL"+i)));
			temp.put("y", Integer.parseInt(String.valueOf(bsnList.get("BSNTYPE"+i))));
			
			list.add(temp);
		}

		modelMap.put("list", list);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	/* 실적 차트 데이터 가져오기 */
	@RequestMapping(value = "/pfmcgetChartData", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String pfmcgetChartData(@RequestParam HashMap<String, String> params, HttpSession session) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		/*
		 * List<HashMap<String, Object>> list =
		 * iCommonService.getDataList("salesRprt.get")
		 */
		
		return mapper.writeValueAsString(modelMap);
	}
	
	// 종합차트 화면
 	@RequestMapping(value = "/totalChart")
	public ModelAndView totalChart(ModelAndView mav) throws Throwable {
		
		int sumRvn = iCommonService.getIntData("salesRprt.getSalesMdSumRvn"); // 당월 매출 합계

		mav.addObject("sumRvn", sumRvn); // 당월 매출 합계
		
		mav.setViewName("sales/rprt/totalChart");
		
		return mav;
	}
	
	// 당월 매출 실적
	@RequestMapping(value = "/salesRvnAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String salesRvnAjax(HttpServletRequest request, @RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		List<HashMap<String, String>> rvn = iCommonService.getDataList("salesRprt.getSalesRvn", params);

		rvn = Utils.toLowerListMapKey(rvn);
		
		modelMap.put("rvn", rvn);
		
        return mapper.writeValueAsString(modelMap);
	}
	

	
	
	// 영업 차트 진행상태 개수
	@RequestMapping(value = "/prgrsChartAjax", method=RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String prgrsChartAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		//영업 전체 개수
		int totalCnt = iCommonService.getIntData("salesRprt.getTotalCnt", params);
		//영업 종료(실패)개수
		int failCnt = iCommonService.getIntData("salesRprt.getFailCnt", params);
		//영업 종료(성공)개수
		int endCnt = iCommonService.getIntData("salesRprt.getEndCnt", params);
		//영업 진행중 개수
		int ingCnt = iCommonService.getIntData("salesRprt.getIngCnt", params);
		
		modelMap.put("totalCnt", totalCnt);
		modelMap.put("failCnt", failCnt);
		modelMap.put("endCnt", endCnt);
		modelMap.put("ingCnt", ingCnt);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	// 영업 차트 진행단계 개수
	@RequestMapping(value = "/prgrsStepAjax", method=RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String prgrsStepAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		//영업기회 개수
		int salesChncCnt = iCommonService.getIntData("salesRprt.getSalesChncCnt", params);
		//제안 개수
		int sgstnCnt = iCommonService.getIntData("salesRprt.getSgstnCnt", params);
		//견적 개수
		int qtnCnt = iCommonService.getIntData("salesRprt.getQtnCnt", params);
		//계약 개수
		int cntrctCnt = iCommonService.getIntData("salesRprt.getCntrctCnt", params);
		
		modelMap.put("salesChncCnt", salesChncCnt);
		modelMap.put("sgstnCnt", sgstnCnt);
		modelMap.put("qtnCnt", qtnCnt);
		modelMap.put("cntrctCnt", cntrctCnt);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	//당월 매출 실적
	@RequestMapping(value = "/saleMdRvnAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String saleMdRvnAjax(HttpServletRequest request) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		List<HashMap<String, String>> mdRvnList = iCommonService.getDataList("salesRprt.getSalesMdRvn");
		
		modelMap.put("mdRvnList", mdRvnList);
		
        return mapper.writeValueAsString(modelMap);
	}
	
	//신규 영업 활동
	@RequestMapping(value = "/newSalesRegAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String newSalesRegAjax(HttpServletRequest request, @RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int ccCnt = iCommonService.getIntData("salesRprt.getCcRegCnt", params); // 당월 고객 등록 수
		int ldCnt = iCommonService.getIntData("salesRprt.getRegLeadCnt", params); // 당월 잠재고객 등록 수
		
		modelMap.put("ccCnt", ccCnt);
		modelMap.put("ldCnt", ldCnt);
		
		return mapper.writeValueAsString(modelMap);
	}
}
