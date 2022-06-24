package com.gdj43.kberp.web.CS.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FaqDao implements IFaqDao {
	@Autowired
	public SqlSession sqlSession;

	@Override
	public List<HashMap<String, String>> getfaqList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("FQ.getfaqList", params);
	}

	@Override
	public int getfaqCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("FQ.getfaqCnt", params);
	}

	@Override
	public HashMap<String, String> getfaqdt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("FQ.getfaqdt", params);
	}
}
