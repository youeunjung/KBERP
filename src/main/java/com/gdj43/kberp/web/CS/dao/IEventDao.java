package com.gdj43.kberp.web.CS.dao;

import java.util.HashMap;
import java.util.List;

public interface IEventDao {
	public List<HashMap<String, String>> getEventList(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getEvent(HashMap<String, String> params) throws Throwable;

	public int getEventCnt(HashMap<String, String> params) throws Throwable;

	public void EventWrite(HashMap<String, String> params) throws Throwable;

	public int EventUpdate(HashMap<String, String> params) throws Throwable;

	public int EventDelete(HashMap<String, String> params) throws Throwable;
	
	public List<HashMap<String, String>> getEndEventList(HashMap<String, String> params) throws Throwable;
	
	public int getEndEventCnt(HashMap<String, String> params) throws Throwable;

}
