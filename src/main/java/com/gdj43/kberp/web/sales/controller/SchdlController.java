package com.gdj43.kberp.web.sales.controller;

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
import com.gdj43.kberp.web.sales.service.ISchdlService;

@Controller
public class SchdlController {
	@Autowired
	public ICommonService  iCommonService;
	
	@Autowired
	public ISchdlService iscService;
	
	@Autowired
	public IPagingService iPagingService;
	
	/* 영업 일정 목록 페이지 */
	@RequestMapping(value = "/salesSchdl")
	public ModelAndView salesSchdl(ModelAndView mav) throws Throwable {
		
		mav.setViewName("sales/salesSchdl");
		
		return mav;
	}
	
	
	/* 영업 일정 목록 그리기 */
	@RequestMapping(value = "/salesSchdlAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String salesSchdlAjax(@RequestParam HashMap<String, String> params) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		List<HashMap<String, String>> slist = iCommonService.getDataList("salesSchdl.getSalesDaySchdlList", params);
		
		modelMap.put("slist", slist);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/salesDaySchdlAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String salesDaySchdlAjax(@RequestParam HashMap<String, String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		List<HashMap<String, String>> list = iCommonService.getDataList("salesSchdl.getSalesSchdlList", params);
		
		modelMap.put("list", list);
		
		return mapper.writeValueAsString(modelMap);
	}

	/* 담당자 팝업 띄우 */
	@RequestMapping(value = "/mgrListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String mgrListAjax(@RequestParam HashMap<String, String> params, 
						   HttpSession session) throws Throwable {
	
	ObjectMapper mapper = new ObjectMapper();
	
	Map<String, Object> modelMap = new HashMap<String, Object>();		
	
	int cnt = iCommonService.getIntData("salesSchdl.getMgrCnt", params);
	
	PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 5, 5);
	
	params.put("startCount", Integer.toString(pb.getStartCount()));
	params.put("endCount", Integer.toString(pb.getEndCount()));
	
	List<HashMap<String, String>> mgrList = iCommonService.getDataList("salesSchdl.getMgrList", params);
	
	modelMap.put("mgrList", mgrList);
	modelMap.put("pb", pb);
	
	return mapper.writeValueAsString(modelMap);
	}
	
	//영업일정 등록 - 영업 팝업, 리드 팝업 조회용	
	@RequestMapping(value = "/salesPopAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String salesPopAjax(@RequestParam HashMap<String, String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();		
		
		// 영업관리 목록 총 게시글 수
		int salesCnt = iCommonService.getIntData("salesSchdl.getSalesCnt", params);
		
		
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), salesCnt, 4, 5);
		
		// 영업관리 페이지 시작 종료
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
		
		
		// 영업관리 목록 리스트로 가져옴
		List<HashMap<String, String>> salesList = iCommonService.getDataList("salesSchdl.getSalesList", params);
		
		
		// 영업관리 목록 가져오기 위한 일
		modelMap.put("salesList", salesList);
		modelMap.put("salesPb", pb);
		
		
		return mapper.writeValueAsString(modelMap);
	}
	
	/* 리드 팝업 띄우기 */
	@RequestMapping(value = "/leadPopAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String leadPopAjax(@RequestParam HashMap<String, String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		// 리드 목록 총 게시글 수
		int leadCnt = iCommonService.getIntData("salesSchdl.getLeadCnt", params);
		
		// 페이징
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("lpage")), leadCnt, 4, 5);
		
		//리드 페이지 시작 종료
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
		
		// 리드 목록 리스트로 가져오기
		List<HashMap<String, String>> leadList = iCommonService.getDataList("salesSchdl.getLeadList", params);
		
		// 리드 목록 가져오기 위한 작업
		modelMap.put("leadList", leadList);
		modelMap.put("pb", pb);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	/* 영업 일정 등록 페이지 이동 */
	@RequestMapping(value = "/salesSchdlReg")
	public ModelAndView salesSchdlReg(ModelAndView mav) {
		mav.setViewName("sales/salesSchdlReg");
		
		return mav;
	}
	
	/* 영업 일정 상세보기 페이지 이동 */
	@RequestMapping(value = "/salesSchdlCont")
	public ModelAndView salesSchdlCOnt(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable{
		
		HashMap<String, String> data = iCommonService.getData("salesSchdl.salesSchdlCont", params);
		
		mav.addObject("data", data);
		
		mav.setViewName("sales/salesSchdlCont");
		
		return mav;
	}
	
	/* 영업 일정 CRUD */
	@RequestMapping(value = "/salesSchdlAction/{gbn}", method = RequestMethod.POST, produces = "text/json;charest=UTF-8")
	@ResponseBody
	public String salesSchdlActionAjax(@RequestParam HashMap<String, String> params,
								   @PathVariable String gbn) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		System.out.println(params);
		try {
			switch (gbn) {
			case "insert":
				String seq = iCommonService.getStringData("salesSchdl.schdlSeq"); // 일정번호 시퀀스 가져오기
				params.put("schdlSeq", seq); // 일정번호 시퀀스 넣어주기
				modelMap.put("schdlnum", seq); // 일정 등록 후 영업기회 상세보기로 이동할 때 필요.
				iCommonService.insertData("salesSchdl.salesSchdlAdd", params); // 전체 데이터 저장
				iCommonService.insertData("salesSchdl.salesSchdlAttFile", params); // 첨부파일 저장
				break;
			case "update":
				iCommonService.updateData("salesSchdl.salesSchdlAttFileUpdate", params);
				iCommonService.updateData("salesSchdl.salesSchdlUpdate", params);
				break;
			case "delete":
				iCommonService.updateData("salesSchdl.salesSchdlDelete", params);
				break;
			}
			modelMap.put("res", "success");
		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("res", "failed");
		}
		return mapper.writeValueAsString(modelMap);
	}
	
	/* 리드 의견 Ajax */
	@RequestMapping(value = "/llopBotListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String llopBotListAjax(@RequestParam HashMap<String, String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int opListCnt = iCommonService.getIntData("salesSchdl.opListCnt", params);
		
		List<HashMap<String, String>> list = iCommonService.getDataList("salesSchdl.getOpList", params);
		
		modelMap.put("list", list);
		modelMap.put("opListCnt", opListCnt);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	/* 리드 상세보기 Action */
	@RequestMapping(value = "/llBotActionAjax/{gbn}", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String llBotActionAjax(@RequestParam HashMap<String, String> params, @PathVariable String gbn) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			switch(gbn) {
			case "insert":
				iCommonService.insertData("salesSchdl.opContAdd", params);
				break;
			case "update":
				iCommonService.updateData("salesSchdl.opContUpdate", params);
				break;
			}
			modelMap.put("res", "success");
		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("res", "failed");
		}
		
		return mapper.writeValueAsString(modelMap);
		
	}
	
	
	/* 리드 상세보기 예정된 일정 Ajax */
	@RequestMapping(value = "/shdlBotListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String shdlBotListAjax(@RequestParam HashMap<String, String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int scListCnt = iCommonService.getIntData("salesSchdl.scListCnt", params);
		
		List<HashMap<String, String>> list = iCommonService.getDataList("salesSchdl.getSCList", params);
		
		modelMap.put("list", list);
		modelMap.put("scListCnt", scListCnt);
		
		
		return mapper.writeValueAsString(modelMap);
	}
	
}
