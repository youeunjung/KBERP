package com.gdj43.kberp.web.hr.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HrDao implements IHrDao {
	@Autowired
	public SqlSession sqlSession;

	@Override
	public List<HashMap<String, String>> getApntmList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("hr.getApntmList", params);
	}

	@Override
	public HashMap<String, String> getApntmCont(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("hr.getApntmCont", params);
	}
}
