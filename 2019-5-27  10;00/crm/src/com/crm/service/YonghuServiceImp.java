package com.crm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.dao.YonghuMapper;
import com.crm.entity.Fenye;
import com.crm.entity.Roles;
import com.crm.entity.Student;
import com.crm.entity.Yonghu;
import com.crm.entity.Yonghujuese;
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

	@Override
	public Integer updateYonghuReset(Yonghu yonghu) {
		// TODO Auto-generated method stub
		return yonghuMapper.updateYonghuReset(yonghu);
	}

	@Override
	public List<Roles> selectRolesNofenye(Roles roles) {
		// TODO Auto-generated method stub
		return yonghuMapper.selectRolesNofenye(roles);
	}

	@Override
	public List<Roles> selectRolesById(Yonghu yonghu) {
		// TODO Auto-generated method stub
		return yonghuMapper.selectRolesById(yonghu);
	}

	@Override
	public Integer insertYonghuJuese(Yonghujuese yonghujuese) {
		// TODO Auto-generated method stub
		return yonghuMapper.insertYonghuJuese(yonghujuese);
	}

	@Override
	public Integer selecttYonghuJueseByR_idAndY_id(Yonghujuese yonghujuese) {
		// TODO Auto-generated method stub
		return yonghuMapper.selecttYonghuJueseByR_idAndY_id(yonghujuese);
	}

	@Override
	public Integer deleteYonghuJueseByR_idAndY_id(Yonghujuese yonghujuese) {
		// TODO Auto-generated method stub
		return yonghuMapper.deleteYonghuJueseByR_idAndY_id(yonghujuese);
	}

	@Override
	public Integer updateYonghuqiandaoByisLockout(Yonghu yonghu) {
		// TODO Auto-generated method stub
		return yonghuMapper.updateYonghuqiandaoByisLockout(yonghu);
	}

	@Override
	public Integer updateYonghuPassword(Yonghu yonghu) {
		// TODO Auto-generated method stub
		return yonghuMapper.updateYonghuPassword(yonghu);
	}

	@Override
	public Yonghu selectYonghuByY_name(Yonghu yonghu) {
		// TODO Auto-generated method stub
		return yonghuMapper.selectYonghuByY_name(yonghu);
	}

	@Override
	public List<Yonghu> selectYonghuByR_id(Yonghu yonghu) {
		// TODO Auto-generated method stub
		return yonghuMapper.selectYonghuByR_id(yonghu);
	}

	@Override
	public List<Student> selectAllByfenpei(Fenye<Student> fenye) {
		// TODO Auto-generated method stub
		return yonghuMapper.selectAllByfenpei(fenye);
	}

	@Override
	public Integer selectStudentCount(Fenye<Student> fenye) {
		// TODO Auto-generated method stub
		return yonghuMapper.selectStudentCount(fenye);
	}

	@Override
	public List<Yonghu> selectYonghuAllBynone(Yonghu yonghu) {
		// TODO Auto-generated method stub
		return yonghuMapper.selectYonghuAllBynone(yonghu);
	}

	@Override
	public Integer updateYonghuqiandaoByyijianqiantui(Yonghu yonghu) {
		// TODO Auto-generated method stub
		return yonghuMapper.updateYonghuqiandaoByyijianqiantui(yonghu);
	}

	@Override
	public Integer selectYonghuByY_nameCount(Yonghu yonghu) {
		// TODO Auto-generated method stub
		return yonghuMapper.selectYonghuByY_nameCount(yonghu);
	}

	@Override
	public Integer selectYonghurolesByY_idCount(Yonghu yonghu) {
		// TODO Auto-generated method stub
		return yonghuMapper.selectYonghurolesByY_idCount(yonghu);
	}

	 

	 

}
