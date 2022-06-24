package com.gdj43.kberp.web.common.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommonDao implements ICommonDao {
	@Autowired
	public SqlSession sqlSession;

	@Override
	public int getIntData(String sql) throws Throwable {
		return sqlSession.selectOne(sql);
	}

	@Override
	public int getIntData(String sql, HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne(sql, params);
	}

	@Override
	public String getStringData(String sql) throws Throwable {
		return sqlSession.selectOne(sql);
	}

	@Override
	public String getStringData(String sql, HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne(sql, params);
	}

	@Override
	public HashMap<String, String> getData(String sql) throws Throwable {
		return sqlSession.selectOne(sql);
	}

	@Override
	public HashMap<String, String> getData(String sql, HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne(sql, params);
	}

	@Override
	public List<HashMap<String, String>> getDataList(String sql) throws Throwable {
		return sqlSession.selectList(sql);
	}

	@Override
	public List<HashMap<String, String>> getDataList(String sql, HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList(sql, params);
	}

	@Override
	public int insertData(String sql) throws Throwable {
		return sqlSession.insert(sql);
	}

	@Override
	public int insertData(String sql, HashMap<String, String> params) throws Throwable {
		return sqlSession.insert(sql, params);
	}

	@Override
	public int updateData(String sql) throws Throwable {
		return sqlSession.update(sql);
	}

	@Override
	public int updateData(String sql, HashMap<String, String> params) throws Throwable {
		return sqlSession.update(sql, params);
	}

	@Override
	public int deleteData(String sql) throws Throwable {
		return sqlSession.delete(sql);
	}

	@Override
	public int deleteData(String sql, HashMap<String, String> params) throws Throwable {
		return sqlSession.delete(sql, params);
	}


}
