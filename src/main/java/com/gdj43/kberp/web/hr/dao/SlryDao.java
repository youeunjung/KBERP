package com.gdj43.kberp.web.hr.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SlryDao implements ISlryDao {
	@Autowired
	public SqlSession sqlSession;
	
	@Override
	public List<HashMap<String, String>> getInqryAnl(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("hr.getInqryAnl", params);
	}
}
