package com.gdj43.kberp.web.GW.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj43.kberp.web.GW.dao.IClndrDao;

@Service
public class ClndrService implements IClndrService{
	@Autowired
	public IClndrDao iClndrDao;
	
	
	@Override
	public void clndrAdd(HashMap<String, String> params) throws Throwable {
		iClndrDao.clndrAdd(params);
	}

	@Override
	public void clndrUpdate(HashMap<String, String> params) throws Throwable {
		iClndrDao.clndrUpdate(params);
	}

	@Override
	public void clndrDelete(HashMap<String, String> params) throws Throwable {
		iClndrDao.clndrDelete(params);
	}

	@Override
	public List<HashMap<String, String>> getSchdl(HashMap<String, String> params) throws Throwable {
		return iClndrDao.getSchdl(params);
	}

	@Override
	public List<HashMap<String, String>> dtlSchdl(HashMap<String, String> params) throws Throwable {
		return iClndrDao.dtlSchdl(params);
	}

}
