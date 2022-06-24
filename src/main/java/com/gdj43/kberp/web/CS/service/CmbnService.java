package com.gdj43.kberp.web.CS.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj43.kberp.web.CS.dao.ICmbnDao;

@Service
public class CmbnService implements ICmbnService{
	@Autowired
	public ICmbnDao iCmbnDao;

	@Override
	public void DataAdd(HashMap<String, String> params) throws Throwable {
		iCmbnDao.DataAdd(params);
		
	}

	}

