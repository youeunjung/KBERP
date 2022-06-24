package com.gdj43.kberp.web.mng.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AcntncDao implements IAcntncDao {
	@Autowired
	public SqlSession sqlSession;

	@Override
	public int deleteMonData(String sql, HashMap<String, String> params) throws Throwable {
		return sqlSession.delete(sql, params);
	}
	
	

}
