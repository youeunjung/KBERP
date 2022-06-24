package com.gdj43.kberp.web.mng.controller;

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

@Controller
public class ExpnsRsltnController {
	
	@Autowired
	public ICommonService iCommonService;

	@Autowired
	public IPagingService iPagingService;
	
	@RequestMapping(value = "/expnsRsltn")
	public ModelAndView expnsRsltn(@RequestParam HashMap<String, String> params, ModelAndView mav) {
		
		mav.addObject("Page",params.get("Page"));

		mav.setViewName("mng/expnsRsltn");

		return mav;
	}
	
	@RequestMapping(value = "/expnsRsltnAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String expnsRsltnAjax(@RequestParam HashMap<String, String> params,
									HttpSession session) throws Throwable {
		
		params.put("sesEmpNum", String.valueOf(session.getAttribute("sEmpNum")));
		
		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		int cnt = iCommonService.getIntData("expnsRsltn.getexpnsRsltnCnt", params);

		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("Page")), cnt, 8, 5);

		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iCommonService.getDataList("expnsRsltn.getexpnsRsltnList", params);
		
		
		modelMap.put("list", list);
		modelMap.put("pb", pb);

		return mapper.writeValueAsString(modelMap);

	}
	
	@RequestMapping(value = "/expnsRsltnEmpMnthlyList")
	public ModelAndView expnsRsltnEmpMnthlyList(@RequestParam HashMap<String, String> params, ModelAndView mav) {
		
	

		mav.setViewName("mng/expnsRsltnEmpMnthlyList");

		return mav;
	}
	
	@RequestMapping(value = "/expnsRsltnEmpMnthlyListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String expnsRsltnEmpMnthlyListAjax(@RequestParam HashMap<String, String> params,
											HttpSession session) throws Throwable {
		
		params.put("sesEmpNum", String.valueOf(session.getAttribute("sEmpNum")));
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		// 총 게시글 수
		int cnt = iCommonService.getIntData("expnsRsltn.getExpnsEmpMnthlyCnt", params);
		
		// 페이징 계산
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page2")), cnt, 10, 5);
		
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iCommonService.getDataList("expnsRsltn.getExpnsEmpMnthlyList", params);
		
		HashMap<String, String> data = iCommonService.getData("expnsRsltn.getExpnsEmpMnthlyData", params);
		
		modelMap.put("data", data);
		modelMap.put("list", list); 
		modelMap.put("pb", pb); 
		
		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value = "/expnsRsltnEmpMnthly")
	public ModelAndView expnsRsltnEmpMnthly(@RequestParam HashMap<String, String> params, ModelAndView mav,
			HttpSession session) throws Throwable {
		
		params.put("sesEmpNum", String.valueOf(session.getAttribute("sEmpNum")));
		
		HashMap<String, String> data = iCommonService.getData("expnsRsltn.expnsRsltnDtl", params);
		
		mav.addObject("data", data);
		
	
		mav.setViewName("mng/expnsRsltnEmpMnthly");

		return mav;
	}
	
	@RequestMapping(value = "/expnsRsltnEmpMnthlyWrite")
	public ModelAndView expnsRsltnEmpMnthlyWrite(@RequestParam HashMap<String, String> params, ModelAndView mav) {

		mav.setViewName("mng/expnsRsltnEmpMnthlyWrite");

		return mav;
	}
	
	@RequestMapping(value = "/expnsRsltnacntSrchAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String expnsRsltnacntSrchAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		
		
		ObjectMapper mapper = new ObjectMapper();
		
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		// 총 게시글 수
		int cnt = iCommonService.getIntData("expnsRsltn.getAcntSrchCnt", params);
		
		// 페이징 계산
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 6, 5);
		
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iCommonService.getDataList("expnsRsltn.getAcntSrchList", params);
		
		modelMap.put("list", list); 
		modelMap.put("pb", pb); 
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/expnsRsltnAction/{gbn}", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String expnsRsltnActionAjax(@RequestParam HashMap<String, String> params, @PathVariable String gbn,
										HttpSession session) throws Throwable {
		
		params.put("sesEmpNum", String.valueOf(session.getAttribute("sEmpNum")));
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			switch(gbn) {
			case "insert":
				iCommonService.insertData("expnsRsltn.WriteExpnsRsltn", params);
				break;
			case "update":
				System.out.println(params);
				iCommonService.updateData("expnsRsltn.UpdateExpnsRsltn", params);
				break;
			case "delete":
				iCommonService.deleteData("expnsRsltn.DeleteExpnsRsltn", params);
				break;
			case "monthdelete":
				iCommonService.deleteData("expnsRsltn.MonthDeleteExpnsRsltn", params);
				break;
			}
			modelMap.put("res", "success");
		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("res", "failed");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/expnsRsltnEmpMnthlyUpdate")
	public ModelAndView expnsRsltnEmpMnthlyUpdate(@RequestParam HashMap<String, String> params, ModelAndView mav,
			HttpSession session) throws Throwable {
		
		params.put("sesEmpNum", String.valueOf(session.getAttribute("sEmpNum")));
		
		HashMap<String, String> data = iCommonService.getData("expnsRsltn.expnsRsltnDtlUpdate", params);
		
		mav.addObject("data", data);

		mav.setViewName("mng/expnsRsltnEmpMnthlyUpdate");

		return mav;
	}
	
	
}
