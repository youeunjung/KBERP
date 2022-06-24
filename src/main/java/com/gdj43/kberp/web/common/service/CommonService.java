package com.gdj43.kberp.web.common.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj43.kberp.web.common.dao.ICommonDao;

@Service
public class CommonService implements ICommonService {
	@Autowired
	public ICommonDao iCommonDao;

	@Override
	public int getIntData(String sql) throws Throwable {
		return iCommonDao.getIntData(sql);
	}

	@Override
	public int getIntData(String sql, HashMap<String, String> params) throws Throwable {
		return iCommonDao.getIntData(sql, params);
	}

	@Override
	public String getStringData(String sql) throws Throwable {
		return iCommonDao.getStringData(sql);
	}

	@Override
	public String getStringData(String sql, HashMap<String, String> params) throws Throwable {
		return iCommonDao.getStringData(sql, params);
	}

	@Override
	public HashMap<String, String> getData(String sql) throws Throwable {
		return iCommonDao.getData(sql);
	}

	@Override
	public HashMap<String, String> getData(String sql, HashMap<String, String> params) throws Throwable {
		return iCommonDao.getData(sql, params);
	}

	@Override
	public List<HashMap<String, String>> getDataList(String sql) throws Throwable {
		return iCommonDao.getDataList(sql);
	}

	@Override
	public List<HashMap<String, String>> getDataList(String sql, HashMap<String, String> params) throws Throwable {
		return iCommonDao.getDataList(sql, params);
	}

	@Override
	public int insertData(String sql) throws Throwable {
		return iCommonDao.insertData(sql);
	}

	@Override
	public int insertData(String sql, HashMap<String, String> params) throws Throwable {
		return iCommonDao.insertData(sql, params);
	}

	@Override
	public int updateData(String sql) throws Throwable {
		return iCommonDao.updateData(sql);
	}

	@Override
	public int updateData(String sql, HashMap<String, String> params) throws Throwable {
		return iCommonDao.updateData(sql, params);
	}

	@Override
	public int deleteData(String sql) throws Throwable {
		return iCommonDao.deleteData(sql);
	}

	@Override
	public int deleteData(String sql, HashMap<String, String> params) throws Throwable {
		return iCommonDao.deleteData(sql, params);
	}


}
