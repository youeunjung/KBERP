package com.gdj43.kberp.web.CS.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj43.kberp.web.CS.dao.IEISDao;

@Service
public class EISService implements IEISService {
	@Autowired
	public IEISDao ieisd;
}
