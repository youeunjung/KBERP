package com.gdj43.kberp.web.CS.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository; 

@Repository
public class EventCmntDao implements IEventCmntDao {
	@Autowired
	public SqlSession sqlSession;
	
	@Override
	public List<HashMap<String, String>> getEventCmntList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("ev.getEventCmntList", params);
	}
	
	@Override
	public HashMap<String, String> getEventCmnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("ev.getEventCmnt", params);
	}
	
	@Override
	public int getEventCmntCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public HashMap<String, String> getEventCmntAdd(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("ev.getEventCmntAdd", params);
	}
	

	
}
