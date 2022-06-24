package com.gdj43.kberp.web.hr.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj43.kberp.web.hr.dao.IHrDao;


@Service
public class HrService implements IHrService {
	@Autowired
	public IHrDao iHrDao;

	@Override
	public List<HashMap<String, String>> getApntmList(HashMap<String, String> params) throws Throwable {
		return iHrDao.getApntmList(params);
	}

	@Override
	public HashMap<String, String> getApntmCont(HashMap<String, String> params) throws Throwable {
		return iHrDao.getApntmCont(params);
	}
}
