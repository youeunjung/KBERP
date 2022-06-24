package com.gdj43.kberp.web.hr.controller;

import java.util.Arrays;
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
import com.gdj43.kberp.common.service.IPagingService;
import com.gdj43.kberp.web.GW.service.IAprvlService;
import com.gdj43.kberp.web.common.service.ICommonService;
import com.gdj43.kberp.web.hr.service.IHrService;

/***** 공통코드, 조직도, 인사발령, 증명서발급 메뉴 *****/

@Controller
public class HrController {
	@Autowired
	public IHrService iHrService;
	@Autowired
	public ICommonService iCommonService;
	@Autowired
	public IPagingService iPagingService;
	@Autowired
	public IAprvlService iAprvlService;
	
	// 인사발령
    @RequestMapping(value = "/apntm")
    public ModelAndView apntmList(@RequestParam HashMap<String,String> params, HttpSession session, ModelAndView mav) throws Throwable {
		try {
			if(session.getAttribute("sEmpNum") != null) {
				params.put("sEmpNum", String.valueOf(session.getAttribute("sEmpNum")));
				mav.setViewName("hr/apntm");
			} else {
				mav.setViewName("redirect:login");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("exception", e);
			mav.setViewName("exception/EXCEPTION_INFO");
		}
		return mav;
	 } 
    
	// 인사발령ajax       
	@RequestMapping(value = "/apntmListAjax/{gbn}", method = RequestMethod.POST, 
			produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String apnmtListAjax(@RequestParam HashMap<String, String> params, @PathVariable String gbn) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
	    try {
		       switch(gbn) {
		       case "list" : // 발령목록
		    	   List<HashMap<String, String>> list = iCommonService.getDataList("hr.getApntmList", params);
		    	   modelMap.put("list", list);
		          break;
		       case "cont" : // 발령목록 > 선택사원 발령상세
		    	   HashMap<String, String> cont = iCommonService.getData("hr.getApntmCont", params);
		    	   HashMap<String, String> emp = iCommonService.getData("hr.getEmpCont", params);
		    	   modelMap.put("cont", cont);
		    	   modelMap.put("emp", emp);
		          break;
		       case "inqryList" : // 발령등록 > 사원조회 리스트
		    	   List<HashMap<String, String>> inqryList = iCommonService.getDataList("hr.getInqryList", params);
		    	   modelMap.put("inqryList", inqryList);
		          break;
		       case "inqryEmp" : // 발령등록 > 선택사원 정보
		    	   HashMap<String, String> inqryEmp = iCommonService.getData("hr.getInqryEmp", params);
		    	   modelMap.put("inqryEmp", inqryEmp);
		    	   break;
		       case "addApntm" : // 발령등록 > 발령부서, 발령직급 리스트
		    	   List<HashMap<String, String>> dept = iCommonService.getDataList("hr.getDeptList", params);
		    	   List<HashMap<String, String>> rank = iCommonService.getDataList("hr.getRankList", params);
		    	   modelMap.put("dept", dept);
		    	   modelMap.put("rank", rank);
		    	   break;
		       case "insertApntm" : // 발령등록
		    	   iCommonService.insertData("hr.insertApntm", params);
		    	   break;
		       case "updateApntm" : // 발령등록 (퇴사)
		    	   iCommonService.updateData("hr.updateApntm", params);
		    	   break;
		       case "deleteApntm" : // 발령삭제
		    	   iCommonService.deleteData("hr.deleteApntm", params);
		    	   break;
		       case "aprvl" : // 결재요청
		    	   String[] aprvler = null; // 결재권자 배열객체
		    	   String[] rfrnc = null; // 참조인 배열객체
		    	   List<String> aprvlerList = null;
		    	   List<String> rfrncList = null;
		    	   if(params.get("aprvlerList") != null && !params.get("aprvlerList").equals("") ) {
		    		   aprvler = params.get("aprvlerList").split(",");
		    		   aprvlerList = Arrays.asList(aprvler);
		    	   }
		    	   if(params.get("rfrncList") != null && !params.get("rfrncList").equals("") ) {
		    		   rfrnc = params.get("rfrncList").split(",");
		    		   rfrncList = Arrays.asList(rfrnc);
		    	   }
		    	   // 그룹웨어 결재서비스에 결재라인 데이터 넘긴 후 결재번호 리턴받기
		    	   String aprvl_num = iAprvlService.aprvlAdd(params.get("emp_num"), params.get("title"), params.get("cont"), aprvlerList, rfrncList, null );
		    	   modelMap.put("aNum", aprvl_num);
		    	   System.out.println("결재번호 : " + aprvl_num);
		    	   break;
		       case "aprvlSuccess" :
		    	   iCommonService.updateData("hr.aprvlSuccess", params);
		    	   break;
		    	   
		       }
		       modelMap.put("res", "success");
		    } catch (Throwable e) {
		       e.printStackTrace();
		       modelMap.put("res", "failed");
	    }
	    
	    return mapper.writeValueAsString(modelMap);
	 }
		
	
	// 증명서발급(관리자)
	@RequestMapping(value = "/crtfctAdmin")
	public ModelAndView cmnCode(@RequestParam HashMap<String, String> params, HttpSession session, ModelAndView mav) throws Throwable {
		try {
			if(session.getAttribute("sEmpNum") != null) {
				params.put("sEmpNum", String.valueOf(session.getAttribute("sEmpNum"))); // 세션 사용자정보 
				List<HashMap<String, String>> rList = iCommonService.getDataList("hr.getAdminRqstList", params); // 증명서 요청목록
				List<HashMap<String, String>> iList = iCommonService.getDataList("hr.getAdminIssueList", params); // 중명서 발급목록
				
				mav.addObject("rList", rList);
				mav.addObject("iList", iList);
				mav.setViewName("hr/crtfctAdmin");
			} else {
				mav.setViewName("redirect:login");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("exception", e);
			mav.setViewName("exception/EXCEPTION_INFO");
		}
		return mav;
	}
	// 증명서발급 ajax (관리자)
	@RequestMapping(value = "/crtfctAdminAjax/{gbn}", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String crtfctAdminrAjax(@RequestParam HashMap<String, String> params, @PathVariable String gbn) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			switch(gbn) {
			case "cont" :
				HashMap<String, String> cont = iCommonService.getData("hr.getAdminRqstCont", params);
				modelMap.put("cont", cont);
				break;
			case "update" :
				iCommonService.updateData("hr.updateCrtfct", params);
				break;
			case "reject" :
				iCommonService.updateData("hr.rejectCrtfct", params);
				break;
			}
			modelMap.put("res", "success");
		} catch(Throwable e) {
			e.printStackTrace();
	       modelMap.put("res", "failed");
		}
		return mapper.writeValueAsString(modelMap); 	
    }
	
	// 증명서발급(사용자)
	@RequestMapping(value = "/crtfct")
	public ModelAndView crtft(@RequestParam HashMap<String, String> params, HttpSession session, ModelAndView mav) throws Throwable {
		try {
			if(session.getAttribute("sEmpNum") != null) {
				params.put("sEmpNum", String.valueOf(session.getAttribute("sEmpNum")));
				List<HashMap<String, String>> list = iCommonService.getDataList("hr.getUserRqstList", params);
				
				mav.addObject("list", list);
				mav.setViewName("hr/crtfct");
			} else {
				mav.setViewName("redirect:login");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("exception", e);
			mav.setViewName("exception/EXCEPTION_INFO");
		}
		return mav;
	 }
	// 증명서발급 ajax (사용자)
	@RequestMapping(value = "/crtfctUserAjax/{gbn}", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String crtfctUserAjax(@RequestParam HashMap<String, String> params, @PathVariable String gbn) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			switch(gbn) {
			case "addCrtfct" :
				iCommonService.insertData("hr.addCrtfct", params);
				break;
			case "print" :
				HashMap<String,String> pCont = iCommonService.getData("getAdminRqstCont", params);
				modelMap.put("pCont", pCont);
				break;
			}
			modelMap.put("res", "success");
		} catch(Throwable e) {
			e.printStackTrace();
	       modelMap.put("res", "failed");
		}
		
		return mapper.writeValueAsString(modelMap); 
    }
	
	// 조직도
    @RequestMapping(value = "/orgnztChart")
    public ModelAndView orgnzt(@RequestParam HashMap<String,String> params,  HttpSession session,
    							ModelAndView mav) throws Throwable {
    	try {
			if(session.getAttribute("sEmpNum") != null) {
				params.put("sEmpNum", String.valueOf(session.getAttribute("sEmpNum")));
				mav.setViewName("hr/orgnztChart");
			} else {
				mav.setViewName("redirect:login");
			}

			params.put("menuNum", "4");
			int menuAthrty = iCommonService.getIntData("prsnl.getMenuAthrty", params);
			mav.addObject("menuAthrty", menuAthrty);
    
    	} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("exception", e);
			mav.setViewName("exception/EXCEPTION_INFO");
		}
      
    	return mav;
    }
    
	// 조직도 ajax
	@RequestMapping(value = "/orgnztChartAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String orgnztChartAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		List<HashMap<String, String>> dept = iCommonService.getDataList("hr.getOrgnztDeptList", params);
		List<HashMap<String, String>> emp = iCommonService.getDataList("hr.getOrgnztEmpList", params);
		
		modelMap.put("dept", dept);
		modelMap.put("emp", emp);
		
		return mapper.writeValueAsString(modelMap); 
    }
	 
	// 조직도 action ajax
	@RequestMapping(value = "/orgnztChartActionAjax/{gbn}", method = RequestMethod.POST,
             produces = "text/json;charset=UTF-8")
	 @ResponseBody
	 public String orgnztChartActionAjax(@RequestParam HashMap<String, String> params, @PathVariable String gbn) throws Throwable {
	    ObjectMapper mapper = new ObjectMapper();
	    Map<String, Object> modelMap = new HashMap<String, Object>();
	    
	    try {
	       switch(gbn) {
	       case "insert" :
	    	   iCommonService.insertData("hr.addDept", params);
	          break;
	       case "update" :
	    	   iCommonService.updateData("hr.updateDept", params);
	          break;
	       case "delete" :
	    	   iCommonService.updateData("hr.deleteDept", params);
	          break;
	       case "empInfo" :
	    	   HashMap<String, String> empInfo = iCommonService.getData("hr.orgnztEmpInfo", params);
	    	   modelMap.put("empInfo", empInfo);
	       }
	       modelMap.put("res", "success");
	    } catch (Throwable e) {
	       e.printStackTrace();
	       modelMap.put("res", "failed");
    }
    
    return mapper.writeValueAsString(modelMap);
 }
	
}

