package com.crm.service;

import java.util.List;

import com.crm.entity.Fenye;
import com.crm.entity.Model;
import com.crm.entity.Modelroles;
import com.crm.entity.Models;
import com.crm.entity.Roles;
import com.crm.entity.Yonghu;

public interface RolesService {
	/**
	 * 按条件分页查询角色数据信息
	 */
	List<Roles> selectRolesAll(Fenye<Roles> fenye);
	/**
	 * 查询角色数据信息总条数
	 */
	Integer selectRolesCount();
	
	/**
	 * 删除角色数据信息
	 */
	Integer deleteRoles(Roles roles);
	/**
	 * 新增角色信息
	 */
	Integer insertRoles(Roles roles);
	
	/**
	 * 修改角色信息
	 */
	Integer updateRoles(Roles roles);
	/**
	 * 查询用户角色信息名称集合
	 */
	Integer selectRolesAllByName(Roles roles);
	/**
	 * 根据角色id查询模块信息
	 */
	List<Models> selectModelByR_id(Integer r_id);
	/**
	 * 遍历新增角色模块信息
	 */
	Integer InsertRolem(String m_id,Integer r_id);
	/**
	 * 查询登录成功时 的登录人角色
	 */
	Roles selectRolesByY_id(Yonghu yonghu);
}
