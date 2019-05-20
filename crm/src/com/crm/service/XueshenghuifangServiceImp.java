package com.crm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.dao.XueshenghuifangMapper;
import com.crm.entity.Fenye;
import com.crm.entity.Xueshenghuifang;

@Service
public class XueshenghuifangServiceImp implements XueshenghuifangService {
	@Autowired
	private XueshenghuifangMapper xueshenghuifangMapper;

	@Override
	public Integer selectCount(Fenye fenye) {
		// TODO Auto-generated method stub
		return xueshenghuifangMapper.selectCount(fenye);
	}

	@Override
	public List<Xueshenghuifang> selectAllXueshenghuifang(Fenye fenye) {
		// TODO Auto-generated method stub
		return xueshenghuifangMapper.selectAllXueshenghuifang(fenye);
	}
	@Override
	public Integer insertXueshenghuifang(Xueshenghuifang xueshenghuifang) {
		// TODO Auto-generated method stub
		return xueshenghuifangMapper.insertXueshenghuifang(xueshenghuifang);
	}

}
