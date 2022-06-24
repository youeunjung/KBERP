package com.gdj43.kberp.web.GW.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ElctrncAprvlDao implements IElctrncAprvlDao {

	@Autowired 
	public SqlSession sqlsession;

	@Override
	public List<HashMap<String, String>> getAprvlTmpltBox(HashMap<String, String> params) throws Throwable {
		
		return sqlsession.selectList("elctrncAprvl.getAprvlTmpltBox", params);
	
}

	@Override
	public void draftTmpltBoxWrite(HashMap<String, String> params) throws Throwable {
		sqlsession.insert("elctrncAprvl.draftTmpltBoxWrite", params);
		
	}
}