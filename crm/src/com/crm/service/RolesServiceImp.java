package com.crm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.dao.RolesMapper;
import com.crm.entity.Fenye;
import com.crm.entity.Roles;
@Service
public class RolesServiceImp implements RolesService{

	@Autowired
	private RolesMapper rolesMapper;
	
	@Override
	public List<Roles> selectRolesAll(Fenye<Roles> fenye) {
		// TODO Auto-generated method stub
		return rolesMapper.selectRolesAll(fenye);
	}

	@Override
	public Integer selectRolesCount() {
		// TODO Auto-generated method stub
		return rolesMapper.selectRolesCount();
	}

	@Override
	public Integer deleteRoles(Roles roles) {
		// TODO Auto-generated method stub
		return rolesMapper.deleteRoles(roles);
	}

	@Override
	public Integer insertRoles(Roles roles) {
		// TODO Auto-generated method stub
		return rolesMapper.insertRoles(roles);
	}

	@Override
	public Integer updateRoles(Roles roles) {
		// TODO Auto-generated method stub
		return rolesMapper.updateRoles(roles);
	}

	@Override
	public Integer selectRolesAllByName(Roles roles) {
		// TODO Auto-generated method stub
		return rolesMapper.selectRolesAllByName(roles);
	}

}
