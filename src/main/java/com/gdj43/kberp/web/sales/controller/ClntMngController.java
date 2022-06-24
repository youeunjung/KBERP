package com.gdj43.kberp.web.sales.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
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
public class ClntMngController {
	@Autowired
	public ICommonService iCommonService;
	@Autowired
	public IPagingService iPagingService;
	
	//고객사 목록
	@RequestMapping(value = "/clntCmpnyList")
	public ModelAndView clntCmpnyList(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		
		if(params.get("page") == null || params.get("page") == "") {
			params.put("page", "1");
		}
		
		int AllCnt = iCommonService.getIntData("clntCmpnyMng.clntCmpnyListAllCnt", params);
		int CntrctCnt = iCommonService.getIntData("clntCmpnyMng.clntCmpnyCntrctCnt", params);
		int PartnerCnt = iCommonService.getIntData("clntCmpnyMng.clntCmpnyPartnerCnt", params);
		int TmnCnt = iCommonService.getIntData("clntCmpnyMng.clntCmpnyTmnCnt", params);
		int SspsCnt = iCommonService.getIntData("clntCmpnyMng.clntCmpnySspsCnt", params);
		int ForeignCnt = iCommonService.getIntData("clntCmpnyMng.clntCmpnyForeignCnt", params);
		int EtcCnt = iCommonService.getIntData("clntCmpnyMng.clntCmpnyEtcCnt", params);
		
		mav.addObject("AllCnt", AllCnt);
		mav.addObject("CntrctCnt", CntrctCnt);
		mav.addObject("PartnerCnt", PartnerCnt);
		mav.addObject("TmnCnt", TmnCnt);
		mav.addObject("SspsCnt", SspsCnt);
		mav.addObject("ForeignCnt", ForeignCnt);
		mav.addObject("EtcCnt", EtcCnt);
		
		mav.addObject("page", params.get("page"));
		mav.setViewName("sales/clntCmpny/clntCmpnyList");
		
		return mav;
	}
	
	//고객사 상세보기
	@RequestMapping(value = "/clntCmpnyCont")
	public ModelAndView clntCmpnyCont(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		
		int clCnt = iCommonService.getIntData("clntCmpnyMng.clListCnt", params);
		
		HashMap<String, String> data = iCommonService.getData("clntCmpnyMng.clntCmpnyCont", params);
		
		mav.addObject("data", data);
		mav.addObject("clCnt", clCnt);
		
		mav.setViewName("sales/clntCmpny/clntCmpnyCont");
		
		return mav;
	}
	
	//고객사 수정
	@RequestMapping(value = "/clntCmpnyUpdate")
	public ModelAndView clntCmpnyUpdate(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		
		HashMap<String, String> data = iCommonService.getData("clntCmpnyMng.clntCmpnyCont", params);
		
		mav.addObject("data", data);
		mav.setViewName("sales/clntCmpny/clntCmpnyUpdate");
		
		return mav;
	}
	
	//고객사 등록
	@RequestMapping(value = "/clntCmpnyReg")
	public ModelAndView clntCmpnyReg(ModelAndView mav) {
		
		mav.setViewName("sales/clntCmpny/clntCmpnyReg");
		
		return mav;
	}
	
	//고객사 목록 비동기
	@RequestMapping(value = "/clntCmpnyListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody 
	public String clntCmpnyListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper	 = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int listCnt = iCommonService.getIntData("clntCmpnyMng.clntCmpnyListCnt", params);
		
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), listCnt, 3, 5);
		
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iCommonService.getDataList("clntCmpnyMng.getClntCmpntList", params);
		
		modelMap.put("list", list);
		modelMap.put("listCnt", listCnt);
		modelMap.put("pb", pb);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	//고객사 등록,수정,삭제 비동기
	@RequestMapping(value = "/clntCmpnyMngActionAjax/{gbn}", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String clntCmpnyMngActionAjax(@RequestParam HashMap<String, String> params, @PathVariable String gbn) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		
		try {
			switch(gbn) {
			case "insert" :
				int cnt = iCommonService.getIntData("clntCmpnyMng.ccNameCnt", params);
				if(cnt == 0) {
					String seq = iCommonService.getStringData("clntCmpnyMng.clntCmpnySeq"); // 고객 시퀀스 가져오기
					params.put("ccs", seq); // 고객사 시퀀스 넣어주기
					modelMap.put("seq", seq); // 고객사 등록 후 고객사 상세보기로 이동할 때 필요.
					iCommonService.insertData("clntCmpnyMng.ClntCmpnyAdd", params); 
					iCommonService.insertData("clntCmpnyMng.ClntCmpnyAddAttFile", params);
					modelMap.put("res", "success");
				} else {
					modelMap.put("res", "overlap");
				}
				break;
			case "update" :
				iCommonService.updateData("clntCmpnyMng.ClntCmpnyAttFileUpdate", params);
				iCommonService.updateData("clntCmpnyMng.ClntCmpnyUpdate", params);
				modelMap.put("res", "success");
				break;
			case "delete" :
				iCommonService.updateData("clntCmpnyMng.ccDelete", params);
				modelMap.put("res", "success");
				break;
			}
			
		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("res", "faild");
		}

		return mapper.writeValueAsString(modelMap);
	}
	
	//고객 목록
	@RequestMapping(value = "/clntList")
	public ModelAndView clntList(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		
		if(params.get("page") == null || params.get("page") == "") {
			params.put("page", "1");
		}
		
		mav.addObject("page", params.get("page"));
		mav.setViewName("sales/clnt/clntList");
		
		return mav;
	}
	
	//고객 상세보기
	@RequestMapping(value = "/clntCont")
	public ModelAndView clntCont(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		
		HashMap<String, String> data = iCommonService.getData("clntCmpnyMng.clntCont", params);
		
		mav.addObject("data", data);
		
		mav.setViewName("sales/clnt/clntCont");
		
		return mav;
	}
	
	//고객 목록 비동기
	@RequestMapping(value = "/clntListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String clntListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int listCnt = iCommonService.getIntData("clntCmpnyMng.clntListCnt", params);
		
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), listCnt, 7, 5);
		
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iCommonService.getDataList("clntCmpnyMng.getClntList", params);
		
		modelMap.put("list", list);
		modelMap.put("pb", pb);
		modelMap.put("listCnt", listCnt);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	//고객 수정
	@RequestMapping(value = "/clntUpdate")
	public ModelAndView clntUpdate(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		
		HashMap<String, String> data = iCommonService.getData("clntCmpnyMng.clntUpdateCont", params);
		
		mav.addObject("data", data);
		
		mav.setViewName("sales/clnt/clntUpdate");
		
		return mav;
	}
	
	//고객 등록
	@RequestMapping(value = "/clntReg")
	public ModelAndView clntReg(ModelAndView mav) {
		
		mav.setViewName("sales/clnt/clntReg");
		
		return mav;
	}
	
	//고객 등록,수정,삭제 비동기
	@RequestMapping(value = "/clntMngAjax/{gbn}", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String clntMngAjax(@RequestParam HashMap<String, String> params, @PathVariable String gbn) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			switch(gbn) {
			case "insert" :
				String seq = iCommonService.getStringData("clntCmpnyMng.clntSeq"); // 고객 시퀀스 가져오기
				params.put("cs", seq); // 고객 시퀀스 넣어주기
				modelMap.put("seq", seq); // 고객 등록 후 고객 상세보기로 이동할 때 필요.
				iCommonService.getData("clntCmpnyMng.clntAdd", params);
				iCommonService.getData("clntCmpnyMng.clntAttAdd", params);
				break;
			case "update" :
				iCommonService.updateData("clntCmpnyMng.clntAttUpdate", params); // 첨부파일 저장
				iCommonService.updateData("clntCmpnyMng.clntUpdate", params); // 저장
				break;
			case "delete" :
				iCommonService.updateData("clntCmpnyMng.clntDelete", params); // 글삭제
				break;
			}
			modelMap.put("res", "success");
		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("res", "faild");
		}
		
		return mapper.writeValueAsString(modelMap);
		
	}
	
	//(팝업) 고객 목록 비동기 
	@RequestMapping(value = "/popupCcListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String popupCcListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int listCnt = iCommonService.getIntData("clntCmpnyMng.popupCcListCnt", params);
		
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), listCnt, 5, 5);
		
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iCommonService.getDataList("clntCmpnyMng.popupCcList", params);
		
		modelMap.put("list", list);
		modelMap.put("pb", pb);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	//(팝업) 담당자 목록 비동기
	@RequestMapping(value = "/mngListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String mngListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int listCnt = iCommonService.getIntData("clntCmpnyMng.popupMngListCnt", params);
		
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), listCnt, 5, 5);
		
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iCommonService.getDataList("clntCmpnyMng.popupMngList", params);
		
		modelMap.put("mngList", list);
		modelMap.put("mngPb", pb);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	//고객사 의견
	@RequestMapping(value = "/ccOpBotListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String ccOpBotListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int opListCnt = iCommonService.getIntData("clntCmpnyMng.ccOpListCnt", params);
		
		List<HashMap<String, String>> list = iCommonService.getDataList("clntCmpnyMng.getCcOpList", params);
		
		modelMap.put("list", list);
		modelMap.put("opListCnt", opListCnt);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	//고객사 의견 등록,삭제
	@RequestMapping(value = "/ccOpBotActionAjax/{gbn}", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String ccOpBotActionAjax(@RequestParam HashMap<String, String> params, @PathVariable String gbn) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			switch(gbn) {
			case "insert" :
				iCommonService.insertData("clntCmpnyMng.ccOpContAdd", params);
				break;
			case "update" :
				iCommonService.updateData("clntCmpnyMng.ccOpContUpdate", params);
				break;
			}
			modelMap.put("res", "success");
		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("res", "faild");
		}
		
		return mapper.writeValueAsString(modelMap);
		
	}
	
	//고객 의견
	@RequestMapping(value = "/clOpBotListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String clOpBotListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int opListCnt = iCommonService.getIntData("clntCmpnyMng.clOpListCnt", params);
		
		List<HashMap<String, String>> list = iCommonService.getDataList("clntCmpnyMng.getClOpList", params);
		
		modelMap.put("list", list);
		modelMap.put("opListCnt", opListCnt);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	//고객 의견 등록,삭제
	@RequestMapping(value = "/clOpBotActionAjax/{gbn}", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String clOpBotActionAjax(@RequestParam HashMap<String, String> params, @PathVariable String gbn) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			switch(gbn) {
			case "insert" :
				iCommonService.insertData("clntCmpnyMng.clOpContAdd", params);
				break;
			case "update" :
				iCommonService.updateData("clntCmpnyMng.clOpContUpdate", params);
				break;
			}
			modelMap.put("res", "success");
		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("res", "faild");
		}
		
		return mapper.writeValueAsString(modelMap);
		
	}
	
	//(고객사 상세보기) 고객 목록 비동기
	@RequestMapping(value = "/clBotListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String clBotListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int clListCnt = iCommonService.getIntData("clntCmpnyMng.clListCnt", params);
		
		List<HashMap<String, String>> list = iCommonService.getDataList("clntCmpnyMng.getClList", params);
		
		modelMap.put("list", list);
		modelMap.put("clListCnt", clListCnt);
		
		return mapper.writeValueAsString(modelMap);
	}
	
}
