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

/*** 자산 관리 메뉴 ***/

@Controller
public class AssetController {

	@Autowired
	public ICommonService ics;
	
	@Autowired
	public IPagingService iPagingService;
	
	@RequestMapping(value = "/assetList")
	public ModelAndView assetList(@RequestParam HashMap<String, String> params, ModelAndView mav) {
		
		if (params.get("page") == null || params.get("page") == "") {
			params.put("page", "1");
		}

		mav.addObject("page", params.get("page"));
		
		mav.setViewName("mng/assetList");
		
		return mav;
	}
	
	@RequestMapping(value = "/assetMngAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String assetMngAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		// 총 게시글 수
		int cnt = ics.getIntData("asset.getCnt", params);
		
		// 페이징 계산
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 10, 5);
		
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = ics.getDataList("asset.assetMngList", params);
		
		modelMap.put("list", list); 
		modelMap.put("pb", pb); 
		
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value= "/assetDtlViewDrbl")
	public ModelAndView assetDtlViewDrbl(@RequestParam HashMap<String, String> params,
							ModelAndView mav) throws Throwable {
		
		HashMap<String, String> data = ics.getData("asset.assetDtlViewDrbl",params);
		
		mav.addObject("data", data);
		
		mav.setViewName("mng/assetDtlViewDrbl");
		
		return mav;
	}
	
	@RequestMapping(value= "/assetDtlViewExpndblt")
	public ModelAndView assetDtlViewExpndblt(@RequestParam HashMap<String, String> params,
							ModelAndView mav) throws Throwable {
		
		HashMap<String, String> data = ics.getData("asset.assetDtlViewExpndblt",params);
		
		mav.addObject("data", data);
		
		mav.setViewName("mng/assetDtlViewExpndblt");
		
		return mav;
	}
	
	@RequestMapping(value="/assetRgstrtn")
	public ModelAndView assetRgstrtn(ModelAndView mav) {
		
		mav.setViewName("mng/assetRgstrtn");
		
		return mav;
		
	}
	
	@RequestMapping(value ="/assetAction/{gbn}", method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8") 
	@ResponseBody
	public String assetActionAjax(@RequestParam HashMap<String, String> params,
							@PathVariable String gbn) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String,Object>();
		try {
		switch(gbn) {
		case "insert":
			ics.insertData("asset.assetRgstrtn",params);
			break;
		case "insertRntl":
			ics.insertData("asset.assetRntlRgstrtn",params);
			break;
		case "insertTkt":
			ics.insertData("asset.assetTktRgstrtn",params);
			ics.updateData("asset.assetTktCntUpdate", params);
			break;
		case "update":
			ics.updateData("asset.drblMdfy",params);
			break;	
		case "update1":
			ics.updateData("asset.expndbltMdfy",params);
			break;
		case "updateRnt":
			ics.updateData("asset.rntlMdfy",params);
			break;
		}
			modelMap.put("res", "success");
		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("res", "failed");
		}
	
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value= "/assetDtlViewDrblMdfy")
	public ModelAndView assetDtlViewDrblMdfy(@RequestParam HashMap<String, String> params,
							ModelAndView mav) throws Throwable {
		
		
		HashMap<String, String> data = ics.getData("asset.assetDtlViewDrbl",params);
		
		mav.addObject("data", data);
		
		mav.setViewName("mng/assetDtlViewDrblMdfy");
		
		return mav;
	}
	
	@RequestMapping(value= "/assetDtlViewExpndbltMdfy")
	public ModelAndView assetDtlViewExpndbltMdfy(@RequestParam HashMap<String, String> params,
							ModelAndView mav) throws Throwable {
		
		
		HashMap<String, String> data = ics.getData("asset.assetDtlViewExpndblt",params);
		
		mav.addObject("data", data);
		
		mav.setViewName("mng/assetDtlViewExpndbltMdfy");
		
		return mav;
	}
	
	@RequestMapping(value = "/assetRntl")
	public ModelAndView assetRntl(@RequestParam HashMap<String, String> params, ModelAndView mav) {
		
		if (params.get("page") == null || params.get("page") == "") {
			params.put("page", "1");
		}

		mav.addObject("page", params.get("page"));
		
		mav.setViewName("mng/assetRntl");
		
		return mav;
	}
	
	@RequestMapping(value = "/assetRntlAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String assetRntlAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		// 총 게시글 수
		int cnt = ics.getIntData("asset.getRntlCnt", params);
		
		// 페이징 계산
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 10, 5);
		
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = ics.getDataList("asset.assetRntlList", params);
		
		modelMap.put("list", list); 
		modelMap.put("pb", pb); 
		
		
		return mapper.writeValueAsString(modelMap);
	
	}
	
	@RequestMapping(value= "/assetRntlDtlView")
	public ModelAndView assetRntlDtlView(@RequestParam HashMap<String, String> params,
							ModelAndView mav) throws Throwable {
		
		HashMap<String, String> data = ics.getData("asset.assetRntlDtlView",params);
		
		mav.addObject("data", data);
		
		mav.setViewName("mng/assetRntlDtlView");
		
		return mav;
	}
	
	@RequestMapping(value= "/assetRntlDtlViewMdfy")
	public ModelAndView assetRntlDtlViewMdfy(@RequestParam HashMap<String, String> params,
							ModelAndView mav) throws Throwable {
		
		
		HashMap<String, String> data = ics.getData("asset.assetRntlDtlView",params);
		
		mav.addObject("data", data);
		
		mav.setViewName("mng/assetRntlDtlViewMdfy");
		
		return mav;
	}
	
	@RequestMapping(value="/assetRntlRgstrtn")
	public ModelAndView assetRntlRgstrtn(ModelAndView mav) {
		
		mav.setViewName("mng/assetRntlRgstrtn");
		
		return mav;
		
	}
	
	@RequestMapping(value = "/assetTkt")
	public ModelAndView assetTkt(@RequestParam HashMap<String, String> params, ModelAndView mav) {
		
		if (params.get("page") == null || params.get("page") == "") {
			params.put("page", "1");
		}

		mav.addObject("page", params.get("page"));
		
		mav.setViewName("mng/assetTkt");
		
		return mav;
	}
	
	@RequestMapping(value = "/assetTktAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String assetTktAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		// 총 게시글 수
		int cnt = ics.getIntData("asset.getTktCnt", params);
		
		// 페이징 계산
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 10, 5);
		
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = ics.getDataList("asset.assetTktList", params);
		
		modelMap.put("list", list); 
		modelMap.put("pb", pb); 
		
		
		return mapper.writeValueAsString(modelMap);
	
	}
	
	@RequestMapping(value= "/assetTktDtlView")
	public ModelAndView assetTktDtlView(@RequestParam HashMap<String, String> params,
							ModelAndView mav) throws Throwable {
		
		HashMap<String, String> data = ics.getData("asset.assetTktDtlView",params);
		
		mav.addObject("data", data);
		
		mav.setViewName("mng/assetTktDtlView");
		
		return mav;
	}
	
	@RequestMapping(value="/assetTktRgstrtn")
	public ModelAndView assetTktRgstrtn(ModelAndView mav) {
		
		mav.setViewName("mng/assetTktRgstrtn");
		
		return mav;
		
	}
	
	@RequestMapping(value = "/mngmntEmpSrchAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String mngmntEmpSrchAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		// 총 게시글 수
		int cnt = ics.getIntData("asset.getMngmntEmpCnt", params);
		
		// 페이징 계산
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 5, 5);
		
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = ics.getDataList("asset.getMngmntEmpList", params);
		
		modelMap.put("list", list); 
		modelMap.put("pb", pb);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/assetUseHstryAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String assetUseHstryAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		// 총 게시글 수
		int cnt = ics.getIntData("asset.useHistoryCnt",params);
		
		// 페이징 계산
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 5, 5);
		
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = ics.getDataList("asset.useHistory", params);
		
		modelMap.put("list", list); 
		modelMap.put("pb", pb);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/allEmpSrchAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String allEmpSrchAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		// 총 게시글 수
		System.out.println(params);
		int cnt = ics.getIntData("asset.getAllEmpCnt",params);
		
		// 페이징 계산
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 5, 5);
		
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = ics.getDataList("asset.getAllEmpList", params);
		
		modelMap.put("list", list); 
		modelMap.put("pb", pb);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/assetSrchAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String assetSrchAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		// 총 게시글 수
		System.out.println(params);
		int cnt = ics.getIntData("asset.psblassetListCnt",params);
		
		// 페이징 계산
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 5, 5);
		
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = ics.getDataList("asset.psblassetList", params);
		
		modelMap.put("list", list); 
		modelMap.put("pb", pb);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/tktAssetSrchAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String tktAssetSrchAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		// 총 게시글 수
		System.out.println(params);
		int cnt = ics.getIntData("asset.psblTktAssetListCnt",params);
		
		// 페이징 계산
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 5, 5);
		
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = ics.getDataList("asset.psblTktAssetList", params);
		
		modelMap.put("list", list); 
		modelMap.put("pb", pb);
		
		return mapper.writeValueAsString(modelMap);
	}
}
