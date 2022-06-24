package com.gdj43.kberp.web.GW.controller;

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
import com.gdj43.kberp.web.common.service.ICommonService;
import com.gdj43.kberp.common.bean.PagingBean;

@Controller
public class NoteController {
	
	@Autowired
	public ICommonService iCommonService;
	
	@Autowired
	public IPagingService iPagingService;

	@RequestMapping(value = "/writeNote")
	public ModelAndView writeNote(ModelAndView mav) {
		
		mav.setViewName("GW/writeNote");
		
		return mav;
	}
	
	@RequestMapping(value = "/rcvdNoteBox")
	public ModelAndView rcvdNoteBox(@RequestParam HashMap<String, String> params,
            						ModelAndView mav) {
		if(params.get("page") == null || params.get("page") == "") {
			params.put("page", "1");
		}

		mav.addObject("page", params.get("page"));
		
		mav.setViewName("GW/rcvdNoteBox");
		
		return mav;
	}
	
	@RequestMapping(value = "/sentNoteBox")
	public ModelAndView sentNoteBox(@RequestParam HashMap<String, String> params,
									ModelAndView mav) {
		
		if(params.get("page") == null || params.get("page") == "") {
			params.put("page", "1");
		}

		mav.addObject("page", params.get("page"));
		
		mav.setViewName("GW/sentNoteBox");
		
		return mav;
	}
	
	@RequestMapping(value = "/rcvdNoteBoxAjax", method = RequestMethod.POST, 
					produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String rcvdNoteBoxAjax(@RequestParam HashMap<String, String> params, HttpSession session) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		params.put("sEmpNum", String.valueOf(session.getAttribute("sEmpNum")));
		
		int cnt = iCommonService.getIntData("note.rcvdNoteIntData", params); 
		
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 9, 5);
		
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iCommonService.getDataList("note.rcvdNoteList", params);
			
		modelMap.put("list", list);
		modelMap.put("pb", pb);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/sentNoteBoxAjax", method = RequestMethod.POST, 
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String sentNoteBoxAjax(@RequestParam HashMap<String, String> params, HttpSession session) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		params.put("sEmpNum", String.valueOf(session.getAttribute("sEmpNum")));
		
		int cnt = iCommonService.getIntData("note.sentNoteIntData", params); 
		
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 9, 5);
		
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iCommonService.getDataList("note.sentNoteList", params);
			
		modelMap.put("list", list);
		modelMap.put("pb", pb);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/NoteAction/{gbn}", method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String NoteActionAjax(@RequestParam HashMap<String, String> params,
							 	 @RequestParam(required = false) List<String> cb,
							 	 HttpSession session,
								 @PathVariable String gbn) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		try {
			switch(gbn) {
			case "insert":
				String seq = iCommonService.getStringData("note.noteSeq");
				params.put("notesq", seq);
				iCommonService.insertData("note.sentNoteWrite", params);
				iCommonService.insertData("note.rcvdNoteWrite", params);
				break;
			case "delete":
				for(String num : cb) {
					HashMap<String, String> data = new HashMap<String, String>();
					data.put("sEmpNum", String.valueOf(session.getAttribute("sEmpNum")));
					data.put("num", num);
					
					iCommonService.updateData("note.sentNoteDelete", data);
					iCommonService.updateData("note.rcvdNoteDelete", data);
				}
			}
			modelMap.put("res", "success");
		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("res", "failed");
		}
		
		return mapper.writeValueAsString(modelMap); 
	}
	
	@RequestMapping(value = "/NoteOrgnztChartAjax", method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String NoteOrgnztChartAjax(@RequestParam HashMap<String, String> params, 
								  HttpSession session) throws Throwable {
				
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		params.put("sEmpNum", String.valueOf(session.getAttribute("sEmpNum")));
		
		List<HashMap<String, String>> list = iCommonService.getDataList("note.NoteOrgnztChart", params) ;
		
		modelMap.put("list", list);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/rcvdNoteView")
	public ModelAndView rcvdNoteView(@RequestParam HashMap<String, String> params,
									 ModelAndView mav) throws Throwable {
		
		iCommonService.updateData("note.rcvdNoteReadCheck", params);
				
		HashMap<String, String> data = iCommonService.getData("note.rcvdNoteView", params);
		
		mav.addObject("data", data);
		
		mav.setViewName("GW/rcvdNoteView");
		
		return mav;
	}
	
	@RequestMapping(value = "/sentNoteView")
	public ModelAndView sentNoteView(@RequestParam HashMap<String, String> params,
			 						 ModelAndView mav) throws Throwable {
				
		HashMap<String, String> data = iCommonService.getData("note.sentNoteView", params);
		
		mav.addObject("data", data);
		
		mav.setViewName("GW/sentNoteView");
		
		return mav;
	}
}
