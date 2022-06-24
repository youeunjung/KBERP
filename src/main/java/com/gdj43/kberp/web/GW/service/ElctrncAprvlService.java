package com.gdj43.kberp.web.GW.service;



import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.gdj43.kberp.web.GW.dao.IElctrncAprvlDao;

@Service
public class ElctrncAprvlService implements IElctrncAprvlService{

	@Autowired
	public IElctrncAprvlDao ielctrncAprvlDao;

	@Override
	public List<HashMap<String, String>> getAprvlTmpltBox(HashMap<String, String> params) throws Throwable {
		
		return ielctrncAprvlDao.getAprvlTmpltBox(params);
	}

	@Override
	public void draftTmpltBoxWrite(HashMap<String, String> params) throws Throwable {
		ielctrncAprvlDao.draftTmpltBoxWrite(params);
		
	}
	

	
}

//unsatisfy dependency exception -> 서버 설정 오류, Bean(Controller, Service, Repository) 생성 오류, Bean을 잘못 썻거나
//브런치 커밋 테스트
//브런치 커밋 테스트1

//브런치 커밋 테스트2