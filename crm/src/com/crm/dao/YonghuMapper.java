package com.crm.dao;

import java.util.List;

import com.crm.entity.Fenye;
import com.crm.entity.Yonghu;

public interface YonghuMapper {
	/**
	 * 按条件分页查询用户数据信息
	 */
	List<Yonghu> selectYonghuAll(Fenye<Yonghu> fenye);
	/**
	 * 查询用户数据信息总条数
	 */
	Integer selectYonghuCount();
	
	/**
	 * 删除用户数据信息
	 */
	Integer deleteYonghu(Yonghu yonghu);
	/**
	 * 新增用户信息
	 */
	Integer insertYonghu(Yonghu yonghu);
	
	/**
	 * 修改用户信息
	 */
	Integer updateYonghu(Yonghu yonghu);
	/**
	 * 解锁，鎖定用户信息
	 */
	Integer updateYonghujiesoByisLockout(Yonghu yonghu);
	  
}
