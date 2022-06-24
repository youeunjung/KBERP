package com.gdj43.kberp.web.CS.dao;

import java.util.HashMap;
import java.util.List;

public interface IFaqDao {

	public List<HashMap<String, String>> getfaqList(HashMap<String, String> params) throws Throwable;

	public int getfaqCnt(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getfaqdt(HashMap<String, String> params) throws Throwable;

}
