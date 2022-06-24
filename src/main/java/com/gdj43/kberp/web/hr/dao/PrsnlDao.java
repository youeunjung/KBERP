package com.gdj43.kberp.web.hr.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PrsnlDao implements IPrsnlDao {
	@Autowired
	public SqlSession sqlSession;
}
