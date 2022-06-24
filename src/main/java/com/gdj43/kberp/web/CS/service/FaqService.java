package com.gdj43.kberp.web.CS.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj43.kberp.web.CS.dao.IFaqDao;

@Service
public class FaqService implements IFaqService {
	@Autowired
	public IFaqDao iFaqDao;

	@Override
	public List<HashMap<String, String>> getfaqList(HashMap<String, String> params) throws Throwable {
		return iFaqDao.getfaqList(params);
	}

	@Override
	public int getfaqCnt(HashMap<String, String> params) throws Throwable {
		return iFaqDao.getfaqCnt(params);
	}

	@Override
	public HashMap<String, String> getfaqdt(HashMap<String, String> params) throws Throwable {
		return iFaqDao.getfaqdt(params);
	}
}
