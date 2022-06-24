package com.gdj43.kberp.web.sales.service;

import java.util.HashMap;
import java.util.List;

public interface ISchdlService {

	public List<HashMap<String, Object>> getDataList(String sql) throws Throwable;

	public HashMap<String, Object> getData(String sql) throws Throwable;
	
	public HashMap<String, Object> getData(String sql, HashMap<String, Object> params) throws Throwable;

	public int getIntData(String sql, HashMap<String, Object> params) throws Throwable;

	

}
