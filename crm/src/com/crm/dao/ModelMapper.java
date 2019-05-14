package com.crm.dao;

import java.util.List;
 
import com.crm.entity.Model;

public interface ModelMapper {
	/**
	 *  查询模块数据信息
	 */
	List<Model> selectModelAll(Model model);
	 
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
	 * 根据id查询模块信息
	 */
	Model selectModuleById(Model model);
}
