package com.crm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.dao.ZidongfenpeiMapper;
import com.crm.entity.Zidongfenpei;
@Service
public class ZidongfenpeiServiceImp implements ZidongfenpeiService{

	@Autowired
	private ZidongfenpeiMapper mapper;
	@Override
	public Zidongfenpei selectAllByZidongfenpei() {
		// TODO Auto-generated method stub
		return mapper.selectAllByZidongfenpei();
	}

	@Override
	public Integer updateZidongfenpei(Zidongfenpei zidongfenpei) {
		// TODO Auto-generated method stub
		return mapper.updateZidongfenpei(zidongfenpei);
	}
	

}
