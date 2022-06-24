package com.gdj43.kberp.web.GW.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj43.kberp.web.GW.dao.IMsgrDao;

@Service
public class MsgrService implements IMsgrService {

	@Autowired
	public IMsgrDao imsDao;
	
	@Override
	public int getMaxNo() throws Throwable {
		return imsDao.getMaxNo();
	}
	
	@Override
	public void insertCont(HashMap<String, String> params) throws Throwable {
		imsDao.insertCont(params);
	}

	@Override
	public void insertChat(HashMap<String, String> params) throws Throwable {
		imsDao.insertChat(params);
	}

	@Override
	public List<HashMap<String, String>> getContList(HashMap<String, String> params) throws Throwable {
		return imsDao.getContList(params);
	}

	@Override
	public HashMap<String, String> getCont(HashMap<String, String> params) throws Throwable {
		return imsDao.getCont(params);
	}


	

}
