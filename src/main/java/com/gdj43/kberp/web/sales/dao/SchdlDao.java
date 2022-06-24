package com.gdj43.kberp.web.sales.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SchdlDao implements ISchdlDao {
	@Autowired
	public SqlSession sqlSession;

	@Override
	public List<HashMap<String, Object>> getDataList(String sql) throws Throwable {
		return sqlSession.selectList(sql);
	}

	@Override
	public HashMap<String, Object> getData(String sql) throws Throwable {
		return sqlSession.selectOne(sql);
	}

	@Override
	public HashMap<String, Object> getData(String sql, HashMap<String, Object> params) throws Throwable {
		return sqlSession.selectOne(sql, params);
	}

	@Override
	public int getIntData(String sql, HashMap<String, Object> params) throws Throwable {
		return sqlSession.selectOne(sql, params);
	}
	
}
