package com.crm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.dao.YonghuMapper;
import com.crm.entity.Fenye;
import com.crm.entity.Yonghu;
@Service
public class YonghuServiceImp implements YonghuService{
	@Autowired
	private YonghuMapper yonghuMapper;

	@Override
	public List<Yonghu> selectYonghuAll(Fenye<Yonghu> fenye) {
		// TODO Auto-generated method stub
		return yonghuMapper.selectYonghuAll(fenye);
	}

	@Override
	public Integer selectYonghuCount() {
		// TODO Auto-generated method stub
		return yonghuMapper.selectYonghuCount();
	}

	@Override
	public Integer deleteYonghu(Yonghu yonghu) {
		// TODO Auto-generated method stub
		return yonghuMapper.deleteYonghu(yonghu);
	}

	@Override
	public Integer insertYonghu(Yonghu yonghu) {
		// TODO Auto-generated method stub
		return yonghuMapper.insertYonghu(yonghu);
	}

	@Override
	public Integer updateYonghu(Yonghu yonghu) {
		// TODO Auto-generated method stub
		return yonghuMapper.updateYonghu(yonghu);
	}

	@Override
	public Integer updateYonghujiesoByisLockout(Yonghu yonghu) {
		// TODO Auto-generated method stub
		return yonghuMapper.updateYonghujiesoByisLockout(yonghu);
	}

	 

}
