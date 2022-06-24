package com.gdj43.kberp.web.GW.service;

import java.util.List;

public interface IAprvlService {
 
	/**
	 *  결재 요청
	 * @param emp_num : 신청사원번호
	 * @param title : 제목
	 * @param cont : 내용
	 * @param aprvlerList : 결재권자 목록(사번)
	 * @param rfrncList : 참조 목록(사번)
	 * @param att : 첨부파일명
	 * @return 결재번호
	 * @throws Throwable
	 */
	public String aprvlAdd(String emp_num, String title, 
			String cont, List<String> aprvlerList, List<String> rfrncList, String att) throws Throwable;
	
	/**
	 *  결재 상태
	 * @param aprvlNum : 결재번호
	 * @return 결재상태(0 - 대기, 1 - 승인, 2 - 거부)
	 * @throws Throwable
	 */
	public String aprvlResult(String aprvl_num) throws Throwable;
}