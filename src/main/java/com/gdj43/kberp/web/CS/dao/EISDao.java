package com.gdj43.kberp.web.CS.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EISDao implements IEISDao {
	@Autowired
	public SqlSession sqlSession;
}
