package com.gdj43.kberp.web.sales.controller;

import java.text.SimpleDateFormat;
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

// ************** 영업관리 ************** //
@Controller
public class SalesMngController {
	@Autowired
	public ICommonService iCommonService;

	@Autowired
	public IPagingService iPagingService;

	@RequestMapping(value = "/salesList")
	public ModelAndView salesList(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

		if (params.get("page") == null || params.get("page") == "") {
			params.put("page", "1");
		}

		int allCnt = iCommonService.getIntData("salesMng.salesListCnt", params);

		int stage0 = iCommonService.getIntData("salesMng.salesStage0", params);
		int stage1 = iCommonService.getIntData("salesMng.salesStage1", params);
		int stage2 = iCommonService.getIntData("salesMng.salesStage2", params);
		int stage3 = iCommonService.getIntData("salesMng.salesStage3", params);

		mav.addObject("allCnt", allCnt);
		mav.addObject("stage0", stage0);
		mav.addObject("stage1", stage1);
		mav.addObject("stage2", stage2);
		mav.addObject("stage3", stage3);

		mav.addObject("page", params.get("page"));

		mav.setViewName("sales/salesMng/salesList");

		return mav;
	}

	// 영업관리 목록
	@RequestMapping(value = "/salesListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")

	@ResponseBody
	public String salesListAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		// 총 게시글 수
		int listCnt = iCommonService.getIntData("salesMng.salesListCnt", params);

		int RsltCnt = iCommonService.getIntData("salesMng.salesSearchListCnt", params);

		modelMap.put("RsltCnt", RsltCnt);

		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), RsltCnt, 3, 5);

		// 데이터 시작, 종료 할당
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));

		// 목록 조회
		List<HashMap<String, String>> list = iCommonService.getDataList("salesMng.getSalesList", params);

		modelMap.put("list", list);
		modelMap.put("pb", pb);

		return mapper.writeValueAsString(modelMap);
	}

	// sales1SalesChncReg : 영업기회 등록
	@RequestMapping(value = "/sales1SalesChncReg")
	public ModelAndView sales1SalesChncReg(@RequestParam HashMap<String, String> params, ModelAndView mav)
			throws Throwable {

		// params.put("leadNum", "12"); // 나중에 지우기...

		// 영업시작일 넣어주기
		Date tday = new Date();

		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");

		// 조회
		HashMap<String, String> leadData = iCommonService.getData("salesMng.getSales1BringLead", params);

		mav.addObject("tday", sdf.format(tday));
		mav.addObject("ln", leadData);

		mav.setViewName("sales/salesMng/sales1SalesChncReg");

		return mav;
	}

	// salesMng1ActionAjax : 영업기회 등록, 수정, 삭제
	@RequestMapping(value = "/salesMng1ActionAjax/{gbn}", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")

	@ResponseBody
	public String salesMng1ActionAjax(@RequestParam HashMap<String, String> params, @PathVariable String gbn)
			throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			switch (gbn) {
			case "insert":
				String seq = iCommonService.getStringData("salesMng.salesSeq"); // 영업번호 시퀀스 가져오기
				params.put("ss", seq); // 영업번호 시퀀스 넣어주기
				modelMap.put("seq", seq); // 영업기회 등록 후 영업기회 상세보기로 이동할 때 필요.
				iCommonService.insertData("salesMng.sales1AddSales", params); // 영업기회 등록
				iCommonService.insertData("salesMng.sales1AddLoan", params); // 영업기회 대출상세정보tab
				iCommonService.insertData("salesMng.sales1AddBsns", params); // 영업기회 예정사업 상세정보tab
				iCommonService.insertData("salesMng.sales1AddBsnsAtt", params); // 영업기회 예정사업 첨부파일tab
				iCommonService.updateData("lead.psNumUpdate", params); // 리드 진행상태 변경
				break;
			case "update":
				iCommonService.updateData("salesMng.sales1UpdateSales", params);
				iCommonService.updateData("salesMng.sales1UpdateLoan", params);
				iCommonService.updateData("salesMng.sales1UpdateBsns", params);
				iCommonService.updateData("salesMng.sales1UpdateBsnsAtt", params);
				break;
			case "failure":
				iCommonService.updateData("salesMng.sales1Failure", params);
				break;
			}
			modelMap.put("res", "success");
		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("res", "failed");
		}

		return mapper.writeValueAsString(modelMap);
	}

	// sales1SalesChncCont : 영업기회 상세보기
	@RequestMapping(value = "/sales1SalesChncCont")
	public ModelAndView sales1SalesChncCont(@RequestParam HashMap<String, String> params, ModelAndView mav)
			throws Throwable {

		HashMap<String, String> data = iCommonService.getData("salesMng.getSales1", params);

		mav.addObject("data", data);

		mav.setViewName("sales/salesMng/sales1SalesChncCont");

		return mav;
	}

	// sales1Update : 영업기회 수정
	@RequestMapping(value = "/sales1Update")
	public ModelAndView sales1Update(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

		HashMap<String, String> data = iCommonService.getData("salesMng.getSales1", params);

		mav.addObject("data", data);

		mav.setViewName("sales/salesMng/sales1Update");

		return mav;
	}

	// sales2SgstnReg : 제안 등록
	@RequestMapping(value = "/sales2SgstnReg")
	public ModelAndView sales2SgstnReg(@RequestParam HashMap<String, String> params, ModelAndView mav)
			throws Throwable {

		// 조회
		HashMap<String, String> sales1DataLead = iCommonService.getData("salesMng.getSales2BringLead", params);
		HashMap<String, String> sales1DataLoan = iCommonService.getData("salesMng.getSales2BringLoan", params);
		HashMap<String, String> sales1DataBsns = iCommonService.getData("salesMng.getSales2BringBsns", params);

		mav.addObject("lead", sales1DataLead);
		mav.addObject("loan", sales1DataLoan);
		mav.addObject("bsns", sales1DataBsns);

		mav.setViewName("sales/salesMng/sales2SgstnReg");

		return mav;
	}

	// salesMng2ActionAjax : 제안 등록, 수정, 삭제
	@RequestMapping(value = "/salesMng2ActionAjax/{gbn}", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")

	@ResponseBody
	public String salesMng2ActionAjax(@RequestParam HashMap<String, String> params, @PathVariable String gbn)
			throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			switch (gbn) {
			case "insert":
				iCommonService.insertData("salesMng.sales2AddLoan", params); // 제안 대출상세정보tab
				iCommonService.insertData("salesMng.sales2AddClntCmpny", params); // 제안 고객사 상세정보tab
				iCommonService.insertData("salesMng.sales2AddDtlInfo", params); // 제안 상세정보tab
				iCommonService.insertData("salesMng.sales2AddDtlInfoAtt", params); // 제안 상세정보 첨부파일tab
				iCommonService.updateData("salesMng.sales1to2", params); // 진행 단계 전환
				break;
			case "update":
				iCommonService.updateData("salesMng.sales1UpdateSales", params); // 제안 담당자 수정
				iCommonService.updateData("salesMng.sales2UpdateLoan", params); // 제안 대출 상세정보tab 수정
				iCommonService.updateData("salesMng.sales2UpdateClntCmpny", params); // 제안 고객사 상세정보tab 수정
				iCommonService.updateData("salesMng.sales2UpdateDtl", params); // 제안 상세정보tab 수정
				iCommonService.updateData("salesMng.sales2UpdateDtlInfoAtt", params); // 제안 상세정보 첨부파일tab
				break;
			case "failure":
				iCommonService.updateData("salesMng.sales2Failure", params);
				break;
			}
			modelMap.put("res", "success");
		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("res", "failed");
		}

		return mapper.writeValueAsString(modelMap);
	}

	// sales2SgstnCont : 제안 상세보기
	@RequestMapping(value = "/sales2SgstnCont")
	public ModelAndView sales2SgstnCont(@RequestParam HashMap<String, String> params, ModelAndView mav)
			throws Throwable {

		HashMap<String, String> data = iCommonService.getData("salesMng.getSales1", params);
		HashMap<String, String> data2 = iCommonService.getData("salesMng.getSales2", params);

		mav.addObject("data", data);
		mav.addObject("data2", data2);

		mav.setViewName("sales/salesMng/sales2SgstnCont");

		return mav;
	}

	// sales2Update : 제안 수정
	@RequestMapping(value = "/sales2Update")
	public ModelAndView sales2Update(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

		HashMap<String, String> data = iCommonService.getData("salesMng.getSales1", params);
		HashMap<String, String> data2 = iCommonService.getData("salesMng.getSales2", params);

		mav.addObject("data", data);
		mav.addObject("data2", data2);

		mav.setViewName("sales/salesMng/sales2Update");

		return mav;
	}

	// sales3QtnReg : 견적 등록
	@RequestMapping(value = "/sales3QtnReg")
	public ModelAndView sales3QtnReg(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

		// 조회
		HashMap<String, String> data = iCommonService.getData("salesMng.getSales1", params);
		HashMap<String, String> data2 = iCommonService.getData("salesMng.getSales2", params);
		HashMap<String, String> data3 = iCommonService.getData("salesMng.getSales3", params);
		
		mav.addObject("data", data);
		mav.addObject("data2", data2);
		mav.addObject("data3", data3);
		mav.setViewName("sales/salesMng/sales3QtnReg");
		 
		return mav;
	 }
	 
	// (팝업) 상품 상세보기 Ajax
	@RequestMapping(value = "/popupMdContAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String popupMdContAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		HashMap<String, String> data = iCommonService.getData("md.getMdContData", params);

		modelMap.put("data", data);

		return mapper.writeValueAsString(modelMap);
	}

	// (팝업) 상품 목록 비동기
	@RequestMapping(value = "/popupMdListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String popupMdListAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		int listCnt = iCommonService.getIntData("salesMng.popupMdListCnt", params);

		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), listCnt, 5, 5);

		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));

		List<HashMap<String, String>> list = iCommonService.getDataList("salesMng.popupMdList", params);

		modelMap.put("list", list);
		modelMap.put("pb", pb);

		return mapper.writeValueAsString(modelMap);
	}

	// 영업기회 의견 목록 리스트
	@RequestMapping(value = "/salesOpBotListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String salesOpBotListAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		int opListCnt = iCommonService.getIntData("salesMng.salesOpListCnt", params);

		List<HashMap<String, String>> list = iCommonService.getDataList("salesMng.getSalesOpList", params);

		modelMap.put("list", list);
		modelMap.put("opListCnt", opListCnt);

		return mapper.writeValueAsString(modelMap);
	}

	// 영업기회 의견 등록,삭제 비동기
	@RequestMapping(value = "/salesBotActionAjax/{gbn}", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String salesBotActionAjax(@RequestParam HashMap<String, String> params, @PathVariable String gbn)
			throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			switch (gbn) {
			case "insert":
				iCommonService.insertData("salesMng.salesOpContAdd", params);
				break;
			case "update":
				iCommonService.updateData("salesMng.salesOpContUpdate", params);
				break;
			}
			modelMap.put("res", "success");
		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("res", "faild");
		}

		return mapper.writeValueAsString(modelMap);

	}

	// 제안 의견 목록 리스트
	@RequestMapping(value = "/sgstnOpBotListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String sgstnOpBotListAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		int opListCnt = iCommonService.getIntData("salesMng.sgstnOpListCnt", params);

		List<HashMap<String, String>> list = iCommonService.getDataList("salesMng.getSgstnOpList", params);

		modelMap.put("list", list);
		modelMap.put("opListCnt", opListCnt);

		return mapper.writeValueAsString(modelMap);
	}

	// 제안 의견 등록,삭제 비동기
	@RequestMapping(value = "/sgstnBotActionAjax/{gbn}", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String sgstnBotActionAjax(@RequestParam HashMap<String, String> params, @PathVariable String gbn)
			throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			switch (gbn) {
			case "insert":
				iCommonService.insertData("salesMng.sgstnOpContAdd", params);
				break;
			case "update":
				iCommonService.updateData("salesMng.sgstnOpContUpdate", params);
				break;
			}
			modelMap.put("res", "success");
		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("res", "faild");
		}

		return mapper.writeValueAsString(modelMap);

	}

	// 견적 상품 리스트 비동기
	@RequestMapping(value = "/qtnMdListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String qtnMdListAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		List<HashMap<String, String>> list = iCommonService.getDataList("salesMng.mdList", params);

		modelMap.put("list", list);

		return mapper.writeValueAsString(modelMap);
	}

	// salesMng3ActionAjax : 견적 등록, 수정, 삭제
	@RequestMapping(value = "/salesMng3ActionAjax/{gbn}", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String salesMng3ActionAjax(@RequestParam HashMap<String, String> params, @PathVariable String gbn)
			throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			switch (gbn) {
			case "insert":
				iCommonService.insertData("salesMng.sales3QtnAdd", params); // 견적
				iCommonService.insertData("salesMng.sales3QtnAttAdd", params); // 견적 첨부파일
				iCommonService.updateData("salesMng.sales2to3", params); // 진행 단계 전환
				break;
			case "update":
				iCommonService.updateData("salesMng.sales1UpdateSales", params); // 제안 담당자 수정
				break;
			case "failure":
				iCommonService.updateData("salesMng.sales3Failure", params);
				break;
			}
			modelMap.put("res", "success");
		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("res", "failed");
		}

		return mapper.writeValueAsString(modelMap);
	}

	// sales3QtnCont : 견적 상세보기
	@RequestMapping(value = "/sales3QtnCont")
	public ModelAndView sales3QtnCont(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

		HashMap<String, String> data = iCommonService.getData("salesMng.getSales1", params);
		HashMap<String, String> data2 = iCommonService.getData("salesMng.getSales2", params);
		HashMap<String, String> data3 = iCommonService.getData("salesMng.getSales3", params);

		mav.addObject("data", data);
		mav.addObject("data2", data2);
		mav.addObject("data3", data3);

		mav.setViewName("sales/salesMng/sales3QtnCont");

		return mav;
	}

	// 견적 의견 등록,삭제 비동기
	@RequestMapping(value = "/qtnBotActionAjax/{gbn}", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String qtnBotActionAjax(@RequestParam HashMap<String, String> params, @PathVariable String gbn)
			throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			switch (gbn) {
			case "insert":
				iCommonService.insertData("salesMng.qtnOpContAdd", params);
				break;
			case "update":
				iCommonService.updateData("salesMng.qtnOpContUpdate", params);
				break;
			}
			modelMap.put("res", "success");
		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("res", "faild");
		}

		return mapper.writeValueAsString(modelMap);

	}

	// 견적 의견 목록 리스트
	@RequestMapping(value = "/qtnOpBotListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String qtnOpBotListAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		int opListCnt = iCommonService.getIntData("salesMng.qtnOpListCnt", params);

		List<HashMap<String, String>> list = iCommonService.getDataList("salesMng.getQtnOpList", params);

		modelMap.put("list", list);
		modelMap.put("opListCnt", opListCnt);

		return mapper.writeValueAsString(modelMap);
	}

	// 견적 - 지난견적서 목록 리스트
	@RequestMapping(value = "/PQListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String PQListAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		int PQListCnt = iCommonService.getIntData("salesMng.PQListCnt", params);

		List<HashMap<String, String>> list = iCommonService.getDataList("salesMng.getQtnPQList", params);

		modelMap.put("list", list);
		modelMap.put("PQListCnt", PQListCnt);

		return mapper.writeValueAsString(modelMap);
	}


	// 견적 추가 등록
	@RequestMapping(value = "/qtnAddAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String qtnAddAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		iCommonService.updateData("salesMng.salesQtnAddUpdate", params);

		return mapper.writeValueAsString(modelMap);
	}

	// 견적 추가 등록 취소
	@RequestMapping(value = "/qtnBackAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String qtnBackAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		iCommonService.updateData("salesMng.salesQtnBackUpdate", params);

		return mapper.writeValueAsString(modelMap);
	}

	// sales4CntrctReg : 계약 등록
	@RequestMapping(value = "/sales4CntrctReg")
	public ModelAndView sals4CntrctReg(@RequestParam HashMap<String, String> params, ModelAndView mav)
			throws Throwable {

		// 조회
		HashMap<String, String> data = iCommonService.getData("salesMng.getSales1", params);
		HashMap<String, String> data2 = iCommonService.getData("salesMng.getSales2", params);
		HashMap<String, String> data3 = iCommonService.getData("salesMng.getSales3", params);

		mav.addObject("data", data);
		mav.addObject("data2", data2);
		mav.addObject("data3", data3);

		mav.setViewName("sales/salesMng/sales4CntrctReg");

		return mav;
	}

	// salesMng4ActionAjax : 계약 등록, 수정, 삭제
	@RequestMapping(value = "/salesMng4ActionAjax/{gbn}", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String salesMng4ActionAjax(@RequestParam HashMap<String, String> params, @PathVariable String gbn)
			throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			switch (gbn) {
			case "insert":
				iCommonService.insertData("salesMng.sales4CntrctAdd", params); // 계약
				iCommonService.insertData("salesMng.sales4CntrctAttAdd", params); // 계약 첨부파일
				iCommonService.updateData("salesMng.sales3to4", params); // 계약 단계 전환
				iCommonService.updateData("salesMng.sales4Failure", params); // 종료(성공)
				break;
			case "update" :
				iCommonService.updateData("salesMng.sales4Update", params); // 계약 정보 수정
				iCommonService.updateData("salesMng.sales4UpdateAttFile", params); // 계약 첨부파일 수정
				break;
			}
			modelMap.put("res", "success");
		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("res", "failed");
		}

		return mapper.writeValueAsString(modelMap);
	}
	
	  // 계약 상세보기
	  @RequestMapping(value = "/sales4CntrctCont")
	  public ModelAndView sales4CntrctCont(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		  /*견적까지 내용 가져오는 부분*/
		 HashMap<String, String> data = iCommonService.getData("salesMng.getSales1", params);
		 HashMap<String, String> data2 = iCommonService.getData("salesMng.getSales2", params);
		 HashMap<String,String> data3 = iCommonService.getData("salesMng.getSales3", params);
		  
		  /*계약 내용 가져오는 부분*/
		  HashMap<String, String> data4 = iCommonService.getData("salesMng.getSales4", params);
		 
		  /*견적까지 내용 가져온 거 보내는 작업*/
		  mav.addObject("data", data);
		  mav.addObject("data2",data2);
		  mav.addObject("data3", data3);
		  
		  /* 계약 내용 가져온거 보내는 부분 */
		  mav.addObject("data4", data4);
		  
		  mav.setViewName("sales/salesMng/sales4CntrctCont");
		  return mav; 
	  }
	  
	  	// 계약 의견 등록,삭제 비동기
		@RequestMapping(value = "/cntrctBotActionAjax/{gbn}", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
		@ResponseBody
		public String cntrctBotActionAjax(@RequestParam HashMap<String, String> params, @PathVariable String gbn)
				throws Throwable {

			ObjectMapper mapper = new ObjectMapper();

			Map<String, Object> modelMap = new HashMap<String, Object>();

			try {
				switch (gbn) {
				case "insert":
					iCommonService.insertData("salesMng.cntrctOpContAdd", params);
					break;
				case "update":
					iCommonService.updateData("salesMng.cntrctOpContUpdate", params);
					break;
				}
				modelMap.put("res", "success");
			} catch (Throwable e) {
				e.printStackTrace();
				modelMap.put("res", "faild");
			}

			return mapper.writeValueAsString(modelMap);

		}

		// 계약 의견 목록 리스트
		@RequestMapping(value = "/cntrctOpBotListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
		@ResponseBody
		public String cntrctOpBotListAjax(@RequestParam HashMap<String, String> params) throws Throwable {

			ObjectMapper mapper = new ObjectMapper();

			Map<String, Object> modelMap = new HashMap<String, Object>();

			int cntrctListCnt = iCommonService.getIntData("salesMng.cntrctOpListCnt", params);

			List<HashMap<String, String>> list = iCommonService.getDataList("salesMng.cntrctOpList", params);

			modelMap.put("list", list);
			modelMap.put("cntrctListCnt", cntrctListCnt);

			return mapper.writeValueAsString(modelMap);
		}
		
		// 계약 수정
		@RequestMapping(value = "/sales4Update")
		public ModelAndView sales4Update(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
			/* 내용 가져오는 부분*/
			HashMap<String, String> data = iCommonService.getData("salesMng.getSales1", params);
			HashMap<String, String> data2 = iCommonService.getData("salesMng.getSales2", params);
			HashMap<String,String> data3 = iCommonService.getData("salesMng.getSales3", params); 
			HashMap<String, String> data4 = iCommonService.getData("salesMng.getSales4", params);
			 
			/*내용 가져온 거 보내는 작업*/
			mav.addObject("data", data);
			mav.addObject("data2",data2);
			mav.addObject("data3", data3);
			mav.addObject("data4", data4);
			  
			mav.setViewName("sales/salesMng/sales4Update");
			return mav; 
		}

		// 영업관리 예정된 일정 목록
		@RequestMapping(value = "/SSchdlListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
		@ResponseBody
		public String SSchdlListAjax(@RequestParam HashMap<String, String> params) throws Throwable{
			ObjectMapper mapper = new ObjectMapper();
			
			Map<String, Object> modelMap = new HashMap<String, Object>();
			
			int SScListCnt = iCommonService.getIntData("salesMng.SScListCnt", params);
			
			List<HashMap<String, String>> list = iCommonService.getDataList("salesMng.getSScList", params);
			
			modelMap.put("list", list);
			modelMap.put("SScListCnt", SScListCnt);
			
			
			return mapper.writeValueAsString(modelMap);
		}
		
		// 영업관리 예정된 일정 상세보기
		@RequestMapping(value ="/SSchdlAjax", method = RequestMethod.POST,
				produces = "text/json;charset=UTF-8")
		@ResponseBody
		public String SSchdlAjax(@RequestParam HashMap<String, String> params) throws Throwable {
			
			ObjectMapper mapper = new ObjectMapper();
			
			Map<String, Object> modelMap = new HashMap<String, Object>();

			HashMap<String, String> SSData = iCommonService.getData("salesMng.SSchdlCont", params);
			
			modelMap.put("SSData", SSData);
			
			return mapper.writeValueAsString(modelMap); 
		}
		
		// 영업관리 지난 견적서 상세보기
		@RequestMapping(value ="/pQAjax", method = RequestMethod.POST,
				produces = "text/json;charset=UTF-8")
		@ResponseBody
		public String pQAjax(@RequestParam HashMap<String, String> params) throws Throwable {
			
			ObjectMapper mapper = new ObjectMapper();
			
			Map<String, Object> modelMap = new HashMap<String, Object>();
			
			HashMap<String, String> pQData = iCommonService.getData("salesMng.pQCont", params);
			
			modelMap.put("pQData", pQData);
			
			return mapper.writeValueAsString(modelMap); 
		}
		
}
