package com.gdj43.kberp.web.hr.dao;

import java.util.HashMap;
import java.util.List;

public interface IHrDao {

	public List<HashMap<String, String>> getApntmList(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getApntmCont(HashMap<String, String> params) throws Throwable;


}
