package com.crm.service;

import java.util.List;

import com.crm.entity.Fenye;
import com.crm.entity.Model;
import com.crm.entity.Models;
import com.crm.entity.Roles;
import com.crm.entity.Yonghu;
import com.crm.entity.Model;

public interface ModelService {
	/**
	 * 根据id查询模块信息
	 */
	Model selectModuleById(Model model);
	/**
	 *  查询模块数据信息
	 */
	 List<Models> selectModelAll(Model model);
	/**
	 * 修改用户模块信息
	 */
	Integer updateModelAll(Model model);
	/**
	 * 删除模块数据信息
	 */
	Integer deleteModel(Model model);
	/**
	 * 新增模块信息
	 */
	Integer insertModel(Model model);
	/**
	 * 根据用户名称查询模块信息
	 */
	List<Models> selectModelByY_name(Yonghu yonghu);
	/**
	 * 判定条件添加过得模块名字不能进行添加
	 */
	Integer selectModelByM_name(Model model);
	/**
	 * 判定删除条件 存在角色模块关系的不能删除
	 */
	Integer selectRolesModelByM_idCount(Model model);
	
}
