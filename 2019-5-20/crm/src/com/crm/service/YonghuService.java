package com.crm.service;

import java.util.List;

import com.crm.entity.Fenye;
import com.crm.entity.Roles;
import com.crm.entity.Student;
import com.crm.entity.Yonghu;
import com.crm.entity.Yonghujuese;

public interface YonghuService {
	/**
	 * 分量设置
	 * 查询出未进行分配的学生
	 * @param fenye
	 * @return
	 */ 
	List<Student> selectAllByfenpei(Fenye<Student> fenye);
	Integer selectStudentCount(Fenye<Student> fenye);
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
	 * 鎖鎖定用户信息
	 */
	Integer updateYonghujiesoByisLockout(Yonghu yonghu);
	/**
	 *  用户信息重置密碼
	 */
	  Integer updateYonghuReset(Yonghu yonghu);
	  /**
		 * 查询角色数据信息
		 */
		List<Roles> selectRolesNofenye(Roles roles);
		  /**
		   * 根據id查詢用戶相關的角色信息
		   */
		  List<Roles> selectRolesById(Yonghu yonghu);
		  /**
		   * 增加用戶角色信息
		   */
		Integer  insertYonghuJuese(Yonghujuese yonghujuese);
		/**
		   * 判定增加用戶角色信息（已存在的不能新增）
		   */
		Integer  selecttYonghuJueseByR_idAndY_id(Yonghujuese yonghujuese);
		/**
		   * 刪除用戶角色信息 
		   */
		Integer  deleteYonghuJueseByR_idAndY_id(Yonghujuese yonghujuese);
		/**
		 * 签到，退用户信息
		 */
		Integer updateYonghuqiandaoByisLockout(Yonghu yonghu);
		/**
		 * 修改密码
		 * @param yonghu
		 * @return
		 */
		Integer updateYonghuPassword(Yonghu yonghu);
		/**
		 * 根据用户名和用户密码查询用户数据
		 */
		Yonghu selectYonghuByY_name(Yonghu yonghu);
		/**
		 * 查询用户所有的咨询师
		 */
		List<Yonghu> selectYonghuByR_id(Yonghu yonghu);	 
		/**
		 * 查询所有用户
		 */
		List<Yonghu> selectYonghuAllBynone(Yonghu yonghu);
		
}
