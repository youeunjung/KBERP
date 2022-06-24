package com.gdj43.kberp.web.CS.service;

import java.util.HashMap;
import java.util.List;

public interface IEventService {

	public List<HashMap<String, String>> getEventList(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getEndEventList(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getEvent(HashMap<String, String> params) throws Throwable;
}
