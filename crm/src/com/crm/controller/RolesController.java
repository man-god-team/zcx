package com.crm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.entity.Fenye;
import com.crm.entity.Roles;
import com.crm.service.RolesService;
 

@Controller
public class RolesController {

	@Autowired
	private RolesService rolesService;
	

//	��ԃ�Ñ������@ʾ
	@RequestMapping(value=("/showRoles"),method=RequestMethod.POST)
	@ResponseBody 
	public Fenye<Roles> showRoles(Integer page,Integer rows,String r_name) {
			Fenye<Roles> fenye=new Fenye<Roles>();
		 fenye.setR_name(r_name);
		fenye.setPage((page-1)*rows);
		fenye.setPageSize(rows);
		List<Roles> selectRolesAll = rolesService.selectRolesAll(fenye);
		Integer selectRolesCount = rolesService.selectRolesCount();
		fenye.setRows(selectRolesAll);
		fenye.setTotal(selectRolesCount);
		 System.out.println(fenye); 
		return fenye;
	}
//	�����û���ɫ��Ϣ 
	@RequestMapping(value=("/addRoles"),method=RequestMethod.POST)
	@ResponseBody 
	public Integer addRoles(Roles roles) {
//		��ѯ�����û���ɫ��Ϣ
		Integer i = rolesService.selectRolesAllByName(roles);
		if(i>0) {
			return 0;
		}else {	 
			return rolesService.insertRoles(roles);
		}
	}
//	�޸��û���ɫ��Ϣ
	@RequestMapping(value=("/UpdateRoles"),method=RequestMethod.POST)
	@ResponseBody 
	public Integer UpdateRoles(Roles roles) {
//		��ѯ�����û���ɫ��Ϣ
		Integer i = rolesService.selectRolesAllByName(roles);
		if(i>0) {
			return 0;
		}else {	 
		return rolesService.updateRoles(roles);
		}
	}
//	ɾ���û���ɫ��Ϣ  
	@RequestMapping(value=("/deleteRoles"),method=RequestMethod.POST)
	@ResponseBody 
	public Integer deleteRoles(Roles roles) {

			return rolesService.deleteRoles(roles);
		 
		
	}
 
}
