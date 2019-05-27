package com.crm.dao;

import java.util.List;

import com.crm.entity.Fenye;
import com.crm.entity.Model;
import com.crm.entity.Modelroles;
import com.crm.entity.Roles;
import com.crm.entity.Yonghu;

public interface RolesMapper {
	/**
	 * 查询角色数据信息
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
	/**
	 * 查询模块信息
	 */
	List<Model> selectModel();
	/**
	 * 遍历新增角色模块信息
	 */
	Integer insertRoleModule(List<Modelroles> list_mr);
	/**
	 * 删除角色模块信息
	 */
	Integer deleteRoleModule(Integer r_id);
	/**
	 * 根据角色id和模块id查询数据总条数
	 */
	Integer selectRoleModulByR_idAndM_id(Modelroles modelroles);
	/**
	 * 根据父节点查询模块总条数
	 */
	Integer selectModulByM_parentId(Integer m_parentId);
	
	/**
	 * 查询登录成功时 的登录人角色
	 */
	Integer selectRolesByY_id(Yonghu yonghu);
	
	/**
	 * 删除角色判定条件 
	 * 用户角色表中存在角色id的不能够删除
	 * 模块角色表中存在角色id的不能够删除
	 */
	Integer selectYonghuRolesByR_id(Roles roles);
	Integer selectModelRolesByR_id(Roles roles);
}
