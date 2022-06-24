package com.gdj43.kberp.web.hr.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj43.kberp.web.hr.dao.IAtndncDao;

@Service
public class AtndncService implements IAtndncService {
	@Autowired
	public IAtndncDao iAtndncDao;
}
