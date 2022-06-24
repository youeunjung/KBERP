package com.gdj43.kberp.web.hr.controller;

import java.util.ArrayList;
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
import com.gdj43.kberp.common.CommonProperties;
import com.gdj43.kberp.common.bean.PagingBean;
import com.gdj43.kberp.common.service.IPagingService;
import com.gdj43.kberp.util.Utils;
import com.gdj43.kberp.web.common.service.ICommonService;
import com.gdj43.kberp.web.hr.service.IPrsnlService;

/***** 인사기록카드, 사원조회 메뉴 *****/

@Controller
public class PrsnlController {
	@Autowired
	public IPrsnlService iPrsnlService;
	@Autowired
	public ICommonService iCommonService;
	
	@Autowired
	public IPagingService iPagingService;
	
	@RequestMapping(value = "/prsnlCard")
	public ModelAndView prsnlCard(@RequestParam HashMap<String, String> params, HttpSession session, ModelAndView mav) throws Throwable {
		try {
			if (params.get("superEmpNum") == null) {
				// 로그인 확인, 로그인 된 사용자 정보 취득
				if(session.getAttribute("sEmpNum") != null) {
					params.put("sEmpNum", String.valueOf(session.getAttribute("sEmpNum")));
					mav.addObject("is_admnstr", "0");
				} else {
					mav.setViewName("redirect:login");
				}
			} else if (params.get("superEmpNum").equals("-1") || params.get("superEmpNum").equals("")) {
				System.out.println("혹시 모를 예외처리");
				new Exception();
			} else {
				System.out.println("super : " + params.get("superEmpNum"));
				System.out.println("empNum : " + params.get("empNum"));
				params.put("sEmpNum", params.get("empNum"));
				mav.addObject("is_admnstr", "1");
				System.out.println(params.get("superEmpNum") + " 관리자 모드로 조회합니다.");
			}
			
			params.put("menuNum", "5"); // 메뉴 번호 params에 추가
			// 사용자 메뉴 권한 가져오기
			int menuAthrty = iCommonService.getIntData("prsnl.getMenuAthrty", params);
			
			if (menuAthrty != 0) { // 읽기, 쓰기 권한이 있을 때
				mav.addObject("menuAthrty", menuAthrty);
				
				mav.setViewName("hr/prsnlCard");
			} else { // 권한 없을 때
				mav.setViewName("exception/PAGE_NOT_FOUND");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("exception", e);
			mav.setViewName("exception/EXCEPTION_INFO");
		}

		
		return mav;
	}
	
	@RequestMapping(value = "/prsnlCardTabAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String prsnlCardTabAjax(@RequestParam HashMap<String, String> params, HttpSession session) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		// 선택된 탭이 어떤 탭인지 가져오기
		String tabName = new String();
		if (params.get("selectedTopTab") != null) { // 상단 탭 선택시
			tabName = params.get("selectedTopTab");
		} else { // 하단 탭 선택시
			tabName = params.get("selectedBottomTab");
		}
		System.out.println("tab name : " + tabName);
		
		// 탭 내부 데이터 DB에서 가져오기
		try {
			System.out.println("**test : " + params.get("admnstrNum"));
			if (params.get("admnstrNum").equals("-1")) {
				System.out.println("check 1");
				if (params.get("sEmpNum") == null) {
					System.out.println("check 1-1");
					params.put("sEmpNum", String.valueOf(session.getAttribute("sEmpNum")));
				} else {
					new Exception();
				}
			} 
			else if (params.get("admnstrNum") == null){
				System.out.println("check 2");
				new Exception();
			} else {
				System.out.println("check 3");
				params.put("sEmpNum", String.valueOf(params.get("admnstrNum")));
			}
			
			HashMap<String, String> tabData = new HashMap<>();
			List<HashMap<String, String>> bankList = new ArrayList<>();
			List<HashMap<String, String>> tabDataList = new ArrayList<>();
			switch (tabName) {
			case "human_info_btn" :
				tabData = iCommonService.getData("prsnl.getHumanInfo", params);
				break;
			case "work_info_btn" :
				tabData = iCommonService.getData("prsnl.getWorkInfo", params);
				break;
			case "slry_info_btn" :
				tabData = iCommonService.getData("prsnl.getSlryInfo", params);
				bankList = iCommonService.getDataList("prsnl.getBankList");
				break;
			case "edctn_level_btn" :
				tabDataList = iCommonService.getDataList("prsnl.getEdctnLevel", params);
				break;
			case "cr_btn" :
				tabDataList = iCommonService.getDataList("prsnl.getCr", params);
				break;
			case "qlfctn_btn" :
				tabDataList = iCommonService.getDataList("prsnl.getQlfctn", params);
				break;
			}
			
			/*
			 * if (tabData == null) { new Exception(); }
			 */
			System.out.println("check 66");
			modelMap.put("tabName", tabName);
			modelMap.put("tabData", tabData);
			modelMap.put("bankList", bankList);
			modelMap.put("tabDataList", tabDataList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/prsnlCardActionAjax/{gbn}", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String prsnlCardActionAjax(@RequestParam HashMap<String, String> params, @PathVariable String gbn) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		// 구현 내용
		try {
			int check = 0;
			
			switch (gbn) {
			case "insert" :
				switch (params.get("popup_id")) {
				case "edctn_level_btn" :
					check = iCommonService.insertData("prsnl.addEdctnLevel", params);
					break;
					
				case "cr_btn" :
					check = iCommonService.insertData("prsnl.addCr", params);
					break;
					
				case "qlfctn_btn" :
					check = iCommonService.insertData("prsnl.addQlfctn", params);
					break;
				}
				break;
			case "update" :
				switch (params.get("popup_id")) {
				case "human_info_btn" :
					check = iCommonService.updateData("prsnl.editHumanInfo", params);
					break;
					
				case "slry_info_btn" :
					check = iCommonService.updateData("prsnl.editSlryInfo", params);
					break;
					
				case "admnstr_edit_popup" :
					check = iCommonService.updateData("prsnl.editBasicInfo", params);
					break;
				}
				break;
			case "delete" :
				switch (params.get("tabId")) {
				case "edctn_level_btn" :
					check = iCommonService.deleteData("prsnl.deleteEdctnLevel", params);
					break;
					
				case "cr_btn" :
					check = iCommonService.deleteData("prsnl.deleteCr", params);
					break;
					
				case "qlfctn_btn" :
					check = iCommonService.deleteData("prsnl.deleteQlfctn", params);
					break;
				}
				break;
			}
			
			if (check == 1) {
				modelMap.put("res", "success");
			} else {
				modelMap.put("res", "failed");
			}
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "failed");
		}

		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/prsnlCardSubAjax/{gbn}", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String prsnlCardSubAjax(@RequestParam HashMap<String, String> params, @PathVariable String gbn) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		// 구현 내용
		try {
			HashMap<String, String> data = new HashMap<>();
			switch (gbn) {
			case "reloadBasicInfo" :
				data = iCommonService.getData("prsnl.getBasicInfo", params);
				String filePath = CommonProperties.FILE_UPLOAD_PATH;
				modelMap.put("filePath", filePath);
				System.out.println("check 55");
				break;
			}
			modelMap.put("data", data);
			modelMap.put("res", "success");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "failed");
		}

		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/empInqry")
	public ModelAndView empInqry(@RequestParam HashMap<String, String> params, HttpSession session, ModelAndView mav) throws Throwable {
		try {
			if (session.getAttribute("sEmpNum") != null) {
				params.put("sEmpNum", String.valueOf(session.getAttribute("sEmpNum")));
			} else {
				mav.setViewName("redirect:login");
			}
			
			params.put("menuNum", "6");
			int menuAthrty = iCommonService.getIntData("prsnl.getMenuAthrty", params);
			
			if (menuAthrty != 0) {
				if (params.get("page") == null || params.get("page") == "") {
					params.put("page", "1");
					System.out.println("* page initialize");
				}
				
				mav.addObject("page", params.get("page"));
				mav.addObject("menuAthrty", menuAthrty);
				mav.setViewName("hr/empInqry");
			} else {
				mav.setViewName("exception/PAGE_NOT_FOUND");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("exception", e);
			mav.setViewName("exception/EXCEPTION_INFO");
		}

		return mav;
	}
	
	@RequestMapping(value = "/empInqryAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String empInqryAjax(@RequestParam HashMap<String, String> params, HttpSession session) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			int cnt = iCommonService.getIntData("prsnl.getEmpCount", params);
			
			System.out.println("* page : " + params.get("page"));
			
			PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 15, 10);

			params.put("startCount", Integer.toString(pb.getStartCount()));
			params.put("endCount", Integer.toString(pb.getEndCount()));
			
			List<HashMap<String, String>> list = iCommonService.getDataList("prsnl.getEmpList", params);
			
			modelMap.put("list", list);
			modelMap.put("pb", pb);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/empInqryActionAjax/{gbn}", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String empInqryActionAjax(@RequestParam HashMap<String, String> params, @PathVariable String gbn) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		// 구현 내용
		try {
			int check = 0;
			
			switch (gbn) {
			case "select" :
				List<HashMap<String, String>> bankList = new ArrayList<>();
				bankList = iCommonService.getDataList("prsnl.getBankList");
				
				if (!bankList.isEmpty()) {
					check = 1;
					modelMap.put("bankList", bankList);
				}

				break;
			case "insert" :
				params.put("temp_pw", Utils.encryptAES128("1234"));
				check = iCommonService.insertData("prsnl.addEmp", params); // params.get("newEmpNum") - 새로 추가된 사원의 사원번호
				if (check == 1) {
					check = 0;
					check = iCommonService.insertData("prsnl.addSlryAcnt", params);
				}
				HashMap<String, String> newEmpInfo = iCommonService.getData("prsnl.getNewEmpInfo", params);
				modelMap.put("newEmpInfo", newEmpInfo);
				break;
				
			case "deleteCheck" :
				int del_check = iCommonService.getIntData("prsnl.delApntmCount", params);
				if (del_check == 0) {
					int edctn_level_count = iCommonService.getIntData("prsnl.delEdctnLevelCount", params);
					int cr_count = iCommonService.getIntData("prsnl.delCrCount", params);
					int qlfctn_count = iCommonService.getIntData("prsnl.delQlfctnCount", params);
					modelMap.put("edctnLevelCount", edctn_level_count);
					modelMap.put("crCount", cr_count);
					modelMap.put("qlfctnCount", qlfctn_count);
					modelMap.put("delCheck", "1");
				} else {
					modelMap.put("delCheck", "0");
				}
				check = 1;
				break;
				
			case "delete" :
				int del_check_2 = iCommonService.getIntData("prsnl.delApntmCount", params);
				if (del_check_2 == 0) {
					int edctn_level_count = iCommonService.getIntData("prsnl.delEdctnLevelCount", params);
					int cr_count = iCommonService.getIntData("prsnl.delCrCount", params);
					int qlfctn_count = iCommonService.getIntData("prsnl.delQlfctnCount", params);
					
					check = iCommonService.deleteData("prsnl.delEdctnLevel", params);
					System.out.println("학력사항 삭제 : " + check + " 개");
					if (check == edctn_level_count) {
						check = 0;
						check = iCommonService.deleteData("prsnl.delCr", params);
						System.out.println("경력사항 삭제 : " + check + " 개");
						if (check == cr_count) {
							check = 0;
							check = iCommonService.deleteData("prsnl.delQlfctn", params);
							System.out.println("자격사항 삭제 : " + check + " 개");
							if (check == qlfctn_count) {
								check = 0;
								check = iCommonService.deleteData("prsnl.delSlryAcnt", params);
								System.out.println("계좌정보 삭제 : " + check + " 개");
								if (check >= 0) {
									check = 0;
									check = iCommonService.deleteData("prsnl.delEmp", params);
									System.out.println("사원 삭제 : " + check + " 명");
								}
							}
						}

					}

				}
				break;
			}
			
			if (check == 1) {
				modelMap.put("res", "success");
			} else {
				modelMap.put("res", "failed");
			}
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "failed");
		}

		return mapper.writeValueAsString(modelMap);
	}
}
