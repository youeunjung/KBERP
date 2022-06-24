package com.gdj43.kberp.web.GW.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj43.kberp.web.common.dao.ICommonDao;

@Service
public class AprvlService implements IAprvlService{
	@Autowired
	public ICommonDao iCommonDao;
	
	@Override
	public String aprvlAdd(String emp_num, String title, String cont, List<String> aprvlerList, 
			List<String> rfrncList, String att)	throws Throwable {
		// 시퀀스취득
		String aprvl_num = iCommonDao.getStringData("elctrncAprvl.aprvlSeq");
		
		// 시퀀스랑 나머지 데이터로 해쉬맵 생성
		HashMap<String, String> aprvl_data = new HashMap<String, String>();
		
		aprvl_data.put("aprvl_num",aprvl_num);
		aprvl_data.put("emp_num", emp_num);
		aprvl_data.put("title", title);
		aprvl_data.put("cont", cont);
		
		if(att != null) {
			aprvl_data.put("att", att);
		}
		
		// 결재데이터 넣기
		iCommonDao.insertData("elctrncAprvl.aprvlAdd", aprvl_data);
		// 결재권자 리스트 사이즈만큼 반복문돌기
		if(aprvlerList != null) {
			for (int i = 0; i < aprvlerList.size(); i++) {
				// 해쉬맵 만들기
				HashMap<String, String> aprvler = new HashMap<String, String>();
				aprvler.put("aprvl_num",aprvl_num); // 해쉬맵에 결재번호 담기
				aprvler.put("aprvl_turn", Integer.toString(i)); // 결재순번 담기
				aprvler.put("aprvler", aprvlerList.get(i));
				System.out.println(aprvler);
				// 해쉬맵 사용 결재권자 데이터 저장
				iCommonDao.insertData("elctrncAprvl.aprvlerAdd", aprvler);
			}
		}

		// 참조 리스트 사이즈만큼 반복문돌기 
		if(rfrncList != null) {
			for (int i = 0; i < rfrncList.size(); i++) {
				// 해쉬맵 만들기
				HashMap<String, String> rfrnc = new HashMap<String, String>();
				rfrnc.put("aprvl_num",aprvl_num); // 해쉬맵에 결재번호 담기
				rfrnc.put("rfrnc", rfrncList.get(i));
				System.out.println(rfrnc);
				// 해쉬맵 사용 결재권자 데이터 저장
				iCommonDao.insertData("elctrncAprvl.rfrncAdd", rfrnc);
			}
		}
		
		return aprvl_num;
		
		
	}

	@Override
	public String aprvlResult(String aprvl_num) throws Throwable {
		HashMap<String, String> aprvl_data = new HashMap<String, String>();
		aprvl_data.put("aprvl_num",aprvl_num);
		String aprvl_sts = iCommonDao.getStringData("elctrncAprvl.aprvlResult",aprvl_data);
		return aprvl_sts;
	}

}
