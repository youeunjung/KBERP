package com.gdj43.kberp.web.CS.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj43.kberp.web.CS.dao.IEventDao;

@Service
public class EventService implements IEventService {
	@Autowired
	public IEventDao iEventDao;
	
	@Override
	public List<HashMap<String, String>> getEventList(HashMap<String, String> params) throws Throwable {
		return iEventDao.getEventList(params);
	}

	@Override
	public HashMap<String, String> getEvent(HashMap<String, String> params) throws Throwable {
		return iEventDao.getEvent(params);
	}
	
	@Override
	public List<HashMap<String, String>> getEndEventList(HashMap<String, String> params) throws Throwable {
		return iEventDao.getEndEventList(params);
	}

}
