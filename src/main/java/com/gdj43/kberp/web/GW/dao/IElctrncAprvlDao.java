package com.gdj43.kberp.web.GW.dao;

import java.util.HashMap;
import java.util.List;

public interface IElctrncAprvlDao {

	public List<HashMap<String, String>> getAprvlTmpltBox(HashMap<String, String> params) throws Throwable;

	public void draftTmpltBoxWrite(HashMap<String, String> params) throws Throwable;



}
