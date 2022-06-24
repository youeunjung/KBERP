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

@Controller
public class AcntController {
	@Autowired
	public ICommonService iCommonService;

	@Autowired
	public IPagingService iPagingService;

	@RequestMapping(value = "/acntRgstrtn")
	public ModelAndView d(@RequestParam HashMap<String, String> params, ModelAndView mav) {
		
		mav.addObject("mainPage",params.get("mainPage"));
		mav.addObject("subPage",params.get("subPage"));

		mav.setViewName("mng/acntRgstrtn");

		return mav;
	}

	@RequestMapping(value = "/acntMainAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String acntMainAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		int cnt = iCommonService.getIntData("acnt.getAcntMainCnt", params);

		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("mainPage")), cnt, 5, 5);

		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));

		List<HashMap<String, String>> list = iCommonService.getDataList("acnt.getAcntMainList", params);
		

		modelMap.put("list", list);
		modelMap.put("pb", pb);

		return mapper.writeValueAsString(modelMap);

	}
	
	@RequestMapping(value = "/acntSubAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String acntSubAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int subcnt = iCommonService.getIntData("acnt.getAcntSubCnt", params);

		PagingBean subpb = iPagingService.getPagingBean(Integer.parseInt(params.get("subPage")), subcnt, 5, 5);

		params.put("startCount", Integer.toString(subpb.getStartCount()));
		params.put("endCount", Integer.toString(subpb.getEndCount()));

		List<HashMap<String, String>> sublist = iCommonService.getDataList("acnt.getAcntSubList", params);
		
		List<HashMap<String, String>> maxs = iCommonService.getDataList("acnt.getAcntMaxSubdata", params);
		
		int submaxcnt = iCommonService.getIntData("acnt.getAcntMaxSubCnt", params);

		modelMap.put("sublist", sublist);
		modelMap.put("subpb", subpb);
		modelMap.put("submaxcnt", submaxcnt);

		return mapper.writeValueAsString(modelMap);

	}
	@RequestMapping(value = "/acntRgstrtnAction/{gbn}", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String acntRgstrtnActionAjax(@RequestParam HashMap<String, String> params, @PathVariable String gbn) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			switch(gbn) {
			case "insert":
				iCommonService.insertData("acnt.WriteAcntRgstrtn", params);
				break;
			case "update":
				System.out.println(params);
				iCommonService.updateData("acnt.UpdateAcntRgstrtn", params);
				break;
			case "delete":
				iCommonService.deleteData("acnt.DeleteAcntRgstrtn", params);
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
