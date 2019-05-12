package com.crm.dao;

import java.util.List;

import com.crm.entity.Fenye;
import com.crm.entity.Roles;

public interface RolesMapper {
	/**
	 * 按条件分页查询角色数据信息
	 */
	List<Roles> selectRolesAll(Fenye<Roles> fenye);
	/**
	 * 查询角色数据信息总条数
	 */
	Integer selectRolesCount();
	/**
	 * 查询用户角色信息名称个数
	 */
	Integer selectRolesAllByName(Roles roles);
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
	 

}
