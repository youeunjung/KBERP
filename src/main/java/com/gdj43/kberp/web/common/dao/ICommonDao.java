package com.gdj43.kberp.web.common.dao;

import java.util.HashMap;
import java.util.List;

public interface ICommonDao {

	public int getIntData(String sql) throws Throwable;
	
	public int getIntData(String sql, HashMap<String, String> params) throws Throwable;
	
	public String getStringData(String sql) throws Throwable;
	
	public String getStringData(String sql, HashMap<String, String> params) throws Throwable;
	
	public HashMap<String, String> getData(String sql) throws Throwable;
	
	public HashMap<String, String> getData(String sql, HashMap<String, String> params) throws Throwable;
	
	public List<HashMap<String, String>> getDataList(String sql) throws Throwable;
	
	public List<HashMap<String, String>> getDataList(String sql, HashMap<String, String> params) throws Throwable;
	
	public int insertData(String sql) throws Throwable;
	
	public int insertData(String sql, HashMap<String, String> params) throws Throwable;
	
	public int updateData(String sql) throws Throwable;
	
	public int updateData(String sql, HashMap<String, String> params) throws Throwable;
	
	public int deleteData(String sql) throws Throwable;
	
	public int deleteData(String sql, HashMap<String, String> params) throws Throwable;

}
