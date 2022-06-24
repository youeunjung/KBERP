package com.gdj43.kberp.web.hr.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj43.kberp.web.hr.dao.ISlryDao;

@Service
public class SlryService implements ISlryService {
	@Autowired
	public ISlryDao iSlryDao;
	
	@Override
	public List<HashMap<String, String>> getInqryAnl(HashMap<String, String> params) throws Throwable {
		return iSlryDao.getInqryAnl(params);
	}
}
