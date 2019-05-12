package com.crm.dao;

import java.util.List;

import com.crm.entity.Fenye;
import com.crm.entity.Model;

public interface ModelMapper {
	/**
	 * 按条件分页查询模块数据信息
	 */
	List<Model> selectModelAll(Fenye<Model> fenye);
	/**
	 * 查询模块数据信息总条数
	 */
	Integer selectModelCount();
	/**
	 * 修改用户模块信息
	 */
	Integer updateModelAll(Model Model);
	/**
	 * 删除模块数据信息
	 */
	Integer deleteModel(Model Model);
	/**
	 * 新增模块信息
	 */
	Integer insertModel(Model Model);
	
}
