package com.gdj43.kberp.web.sales.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj43.kberp.web.sales.dao.ISalesDao;

@Service
public class SalesService implements ISalesService{
	@Autowired
	public ISalesDao isaDao;
}
