package com.gdj43.kberp.web.GW.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MsgrDao implements IMsgrDao {
	@Autowired
	public SqlSession sqlSession;

	@Override
	public int getMaxNo() throws Throwable {
		return (int) sqlSession.selectOne("msgr.getMaxNo");
	}
	
	@Override
	public void insertCont(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("msgr.insertCont", params);
	}

	@Override
	public void insertChat(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("msgr.insertChat", params);
	}

	@Override
	public List<HashMap<String, String>> getContList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("msgr.getContList", params);
	}

	@Override
	public HashMap<String, String> getCont(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("msgr.getCont", params);
	}



	
}
