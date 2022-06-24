package com.gdj43.kberp.web.CS.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EventDao implements IEventDao {
	@Autowired
	public SqlSession sqlSession;

	@Override
	public List<HashMap<String, String>> getEventList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("ev.getEventList", params);
	}

	@Override
	public HashMap<String, String> getEvent(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("ev.getEvent", params);
	}

	@Override
	public int getEventCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void EventWrite(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int EventUpdate(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int EventDelete(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public List<HashMap<String, String>> getEndEventList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("ev.getEndEventList", params);
	}
	
	@Override
	public int getEndEventCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
