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
import com.gdj43.kberp.web.CS.service.ICmbnService;
import com.gdj43.kberp.web.common.service.ICommonService;




@Controller
public class CmbnController {

	@Autowired
	public ICommonService iCommonService;
	
	@Autowired
	public IPagingService ips;
	
	@Autowired
	public ICmbnService ics;
	
	@RequestMapping(value="strgBox")
	public ModelAndView strgBox(ModelAndView mav, @RequestParam HashMap<String,String> params) {

		if(params.get("page")==null || params.get("page")==""){
			params.put("page" , "1");
		}
		
		mav.addObject("page",params.get("page"));
		mav.setViewName("CS/strgBox");
		return mav;
	}
	
	@RequestMapping(value="/strgAjax", method=RequestMethod.POST, 
			produces="text/json;charset=UTF-8")
	@ResponseBody // View로 인식 시킴
	public String strgAjax(@RequestParam HashMap<String,String> params) throws Throwable{
	
		ObjectMapper mapper = new ObjectMapper();
		
		//데이터를 담을 객체
		Map<String,Object> modelMap = new HashMap<String,Object>();
		
		//구현 내용
		//총 게시글 수	

		int strgcnt = iCommonService.getIntData("cm.getStrgCnt",params);
		
		PagingBean pbstrg = ips.getPagingBean(Integer.parseInt(params.get("page")), strgcnt,10,5);
		
		params.put("strgstartCount", Integer.toString(pbstrg.getStartCount()));
		params.put("strgendCount", Integer.toString(pbstrg.getEndCount()));
		
		List<HashMap<String,String>> strg = iCommonService.getDataList("cm.getStrg",params);
		
		modelMap.put("strg",strg);
		modelMap.put("pbstrg",pbstrg);
		
		return mapper.writeValueAsString(modelMap); 
	}
	
	
	@RequestMapping(value="guideWrtngAdd")
	public ModelAndView guideWrtngAdd(ModelAndView mav) {
		
		mav.setViewName("CS/guideWrtngAdd");
		return mav;
	}
	
	@RequestMapping(value="/guidesActionAjax/{gbn}", method=RequestMethod.POST, 
			produces="text/json;charset=UTF-8")
	@ResponseBody // View로 인식 시킴
	public String guidesActionAjax(@RequestParam HashMap<String,String> params,
							@PathVariable String gbn) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String,Object> modelMap = new HashMap<String,Object>();
		try {
			switch(gbn) {
			case "insert":
				iCommonService.insertData("cm.guideAdd",params);
				break;
			case "delete":
				iCommonService.updateData("cm.guideDel",params);
				break;
			case "update":
				iCommonService.updateData("cm.guideUpdate",params);
				break;
			case "strg":
				iCommonService.updateData("cm.guideStrg",params);
				
			}
			modelMap.put("res","success");
		}catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("res","failed");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/guideWrtng")
	public ModelAndView guideWrtng(@RequestParam HashMap<String,String> params,
									ModelAndView mav) {
		
		if(params.get("page")==null || params.get("page")==""){
			params.put("page" , "1");
		}
		
		mav.addObject("page",params.get("page"));
		mav.setViewName("CS/guideWrtng");
		
		return mav;
	}
	
	@RequestMapping(value="/guideWrtngAjax", method=RequestMethod.POST, 
			produces="text/json;charset=UTF-8")
	@ResponseBody // View로 인식 시킴
	public String guideWrtngAjax(@RequestParam HashMap<String,String> params) throws Throwable {
	
		ObjectMapper mapper = new ObjectMapper();
		
		//데이터를 담을 객체
		Map<String,Object> modelMap = new HashMap<String,Object>();
		
		//구현 내용
		//총 게시글 수
		int cnt= iCommonService.getIntData("cm.getGuideCnt",params);
		
		//페이징 계산
		PagingBean pb = ips.getPagingBean(Integer.parseInt(params.get("page")), cnt,10,5);
		
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String,String>> list = iCommonService.getDataList("cm.getGuide",params);
		modelMap.put("list",list);
		modelMap.put("pb",pb);
		
		return mapper.writeValueAsString(modelMap); 
	}
	
	//상세보기
	@RequestMapping(value = "/guides")
	public ModelAndView guides(@RequestParam HashMap<String, String> params,
							  ModelAndView mav) throws Throwable {
		
		iCommonService.updateData("cm.updateHit",params);
		
		HashMap<String, String> data = iCommonService.getData("cm.getaGuide",params);
		
		mav.addObject("data", data);
		
		mav.setViewName("CS/guides");
		
		return mav;
	}
	
	//수정
	@RequestMapping(value="/guideWrtngUpdate")
	public ModelAndView guideWrtngUpdate(@RequestParam HashMap<String, String> params,
										ModelAndView mav) throws Throwable{
		
		HashMap<String, String> data = iCommonService.getData("cm.getaGuide",params);
		
		mav.addObject("data", data);
		mav.setViewName("CS/guideWrtngUpdate");
		return mav;
	}
}
