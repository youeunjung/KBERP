package com.gdj43.kberp.web.sales.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SalesDao implements ISalesDao{
	@Autowired
	public SqlSession sqlSession;
}
