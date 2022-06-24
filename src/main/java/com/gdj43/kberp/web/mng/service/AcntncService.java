package com.gdj43.kberp.web.mng.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj43.kberp.web.mng.dao.IAcntncDao;

@Service
public class AcntncService implements IAcntncService {
	@Autowired
	public IAcntncDao iAcntncDao;

	@Override
	public int deleteMonData(String sql, HashMap<String, String> params) throws Throwable {
		return iAcntncDao.deleteMonData(sql, params);
	}
	
	

}
