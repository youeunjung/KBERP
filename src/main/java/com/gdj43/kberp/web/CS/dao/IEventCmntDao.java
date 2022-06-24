package com.gdj43.kberp.web.CS.dao;

import java.util.HashMap;
import java.util.List;

public interface IEventCmntDao {
	public List<HashMap<String, String>> getEventCmntList(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getEventCmnt(HashMap<String, String> params) throws Throwable;

	public int getEventCmntCnt(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getEventCmntAdd(HashMap<String, String> params) throws Throwable;
	
}
