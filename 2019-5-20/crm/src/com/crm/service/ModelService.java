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
	
}
