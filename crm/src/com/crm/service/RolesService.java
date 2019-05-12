package com.crm.service;

import java.util.List;

import com.crm.entity.Fenye;
import com.crm.entity.Roles;

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

}
