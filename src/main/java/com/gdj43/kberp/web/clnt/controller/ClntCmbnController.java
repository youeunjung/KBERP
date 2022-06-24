package com.gdj43.kberp.web.clnt.controller;

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
public class ClntCmbnController {

	@Autowired
	public ICommonService iCommonService;
	
	@Autowired
	public IPagingService ips;
	
	@RequestMapping(value="/cGuideWrtng")
	public ModelAndView cGuideWrtng(@RequestParam HashMap<String,String> params,
									ModelAndView mav) {
		
		if(params.get("page")==null || params.get("page")==""){
			params.put("page" , "1");
		}
		
		mav.addObject("page",params.get("page"));
		mav.setViewName("CS/clnt/cmbnInfo");
		
		return mav;
	}
	
	@RequestMapping(value="/cGuideWrtngAjax", method=RequestMethod.POST, 
			produces="text/json;charset=UTF-8")
	@ResponseBody // View로 인식 시킴
	public String cGuideWrtngAjax(@RequestParam HashMap<String,String> params) throws Throwable {
	
		ObjectMapper mapper = new ObjectMapper();
		
		//데이터를 담을 객체
		Map<String,Object> modelMap = new HashMap<String,Object>();
		
		//구현 내용
		//총 게시글 수
		int cnt= iCommonService.getIntData("clcm.getGuideCnt",params);
		
		//페이징 계산
		PagingBean pb = ips.getPagingBean(Integer.parseInt(params.get("page")), cnt,10,5);
		
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String,String>> list = iCommonService.getDataList("clcm.getGuide",params);
		modelMap.put("list",list);
		modelMap.put("pb",pb);
		
		return mapper.writeValueAsString(modelMap); 
	}
	
	//상세보기
	@RequestMapping(value = "/cGuides")
	public ModelAndView cGuides(@RequestParam HashMap<String, String> params,
							  ModelAndView mav) throws Throwable {
		
		iCommonService.updateData("clcm.updateHit",params);
		
		HashMap<String, String> data = iCommonService.getData("clcm.getaGuide",params);
		
		mav.addObject("data", data);
		
		mav.setViewName("CS/cGuides");
		
		return mav;
	}
	
}

