package com.gdj43.kberp.web.sales.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj43.kberp.web.sales.dao.ISalesMngDao;

@Service
public class SalesMngService implements ISalesMngService {
	@Autowired
	public ISalesMngDao iSalesMngDao;

}
