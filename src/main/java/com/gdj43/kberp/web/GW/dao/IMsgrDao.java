package com.gdj43.kberp.web.GW.dao;

import java.util.HashMap;
import java.util.List;

public interface IMsgrDao {
	
	public int getMaxNo() throws Throwable;

	public void insertCont(HashMap<String, String> params) throws Throwable;

	public void insertChat(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getContList(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getCont(HashMap<String, String> params) throws Throwable;


}
