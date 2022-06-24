package com.gdj43.kberp.web.CS.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CmbnDao implements ICmbnDao{

	@Autowired
	public SqlSession sqlSession;

	@Override
	public void DataAdd(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("cm.guideAdd",params);
		
	}

	}

