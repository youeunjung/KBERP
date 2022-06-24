package com.gdj43.kberp.web.hr.controller;

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
import com.gdj43.kberp.common.service.IPagingService;
import com.gdj43.kberp.web.common.service.ICommonService;
import com.gdj43.kberp.web.hr.service.ISlryService;

/***** 급여 관련 메뉴 *****/

@Controller
public class SlryController {
	@Autowired
	public ISlryService iSlryService;
	
	@Autowired
	public IPagingService ips;
	
	@Autowired
	public ICommonService iCommonService;
	
	//연봉관리
    @RequestMapping(value = "/anlSalAdmnstr")
    public ModelAndView apntmList(@RequestParam HashMap<String,String> params, 
                         ModelAndView mav) {
      mav.setViewName("hr/anlSalAdmnstr");
      
      return mav;
    }
    
    @RequestMapping(value = "/anlInqryAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String anlInqryAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		List<HashMap<String, String>> list = iCommonService.getDataList("hr.getInqryAnl", params);
 	   	modelMap.put("list", list);
		
		return mapper.writeValueAsString(modelMap);
	}
    
    @RequestMapping(value = "/updateAtrbtnAjax", method = RequestMethod.POST,
            produces = "text/json;charset=UTF-8")
	 @ResponseBody
	 public String updateAtrbtnAjax(@RequestParam HashMap<String, String> params) throws Throwable {
	    ObjectMapper mapper = new ObjectMapper();
	    Map<String, Object> modelMap = new HashMap<String, Object>();
	    
	    try {
	    	 iCommonService.updateData("hr.updateAtrbtn", params);
	    	 modelMap.put("res", "success");
	    	} catch (Throwable e) {
	    		e.printStackTrace();
	    		modelMap.put("res", "failed");
	    }
   
	    return mapper.writeValueAsString(modelMap);
    }
    
    @RequestMapping(value = "/bnftRgstn")
    public ModelAndView bnftRgstn(@RequestParam HashMap<String,String> params, 
                         ModelAndView mav) throws Throwable {
    	List<HashMap<String, String>> list = iCommonService.getDataList("hr.getApntmList", params);
    	mav.addObject("list", list);
    	mav.setViewName("hr/bnftRgstn");
      
      return mav;
    }
    
    @RequestMapping(value = "/slryCrntState")
    public ModelAndView slryCrntState(@RequestParam HashMap<String,String> params, 
    		ModelAndView mav) throws Throwable {
    	List<HashMap<String, String>> list = iCommonService.getDataList("hr.getApntmList", params);
    	mav.addObject("list", list);
    	mav.setViewName("hr/slryCrntState");
    	
    	return mav;
    }
    @RequestMapping(value = "/slryCrntStateAjax/{gbn}", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String slryCrntStateAjax(@RequestParam HashMap<String, String> params, @PathVariable String gbn) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			switch(gbn) {
			case "cont" :
				List<HashMap<String, String>> bnft = iCommonService.getDataList("hr.getBnft", params);
				modelMap.put("bnft", bnft);
				HashMap<String, String> tBnft = iCommonService.getData("hr.getTotalBnft", params);
				modelMap.put("tBnft", tBnft);
				HashMap<String, String> slry = iCommonService.getData("hr.getSlry", params);
				modelMap.put("slry", slry);
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
