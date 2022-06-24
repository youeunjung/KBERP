package com.gdj43.kberp.web.hr.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj43.kberp.web.hr.dao.IPrsnlDao;

@Service
public class PrsnlService implements IPrsnlService {
	@Autowired
	public IPrsnlDao iPrsnlDao;
}
