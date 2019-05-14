package com.crm.dao;

import java.util.List;

import com.crm.entity.Fenye;
import com.crm.entity.Roles;
import com.crm.entity.Yonghu;
import com.crm.entity.Yonghujuese;

public interface YonghuMapper {
	/**
	 * ��ѯ��ɫ������Ϣ
	 */
	List<Roles> selectRolesNofenye(Roles roles);
	/**
	 * ��������ҳ��ѯ�û�������Ϣ
	 */
	List<Yonghu> selectYonghuAll(Fenye<Yonghu> fenye);
	/**
	 * ��ѯ�û�������Ϣ������
	 */
	Integer selectYonghuCount();
	
	/**
	 * ɾ���û�������Ϣ
	 */
	Integer deleteYonghu(Yonghu yonghu);
	/**
	 * �����û���Ϣ
	 */
	Integer insertYonghu(Yonghu yonghu);
	
	/**
	 * �޸��û���Ϣ
	 */
	Integer updateYonghu(Yonghu yonghu);
	/**
	 * �������i���û���Ϣ
	 */
	Integer updateYonghujiesoByisLockout(Yonghu yonghu);
	/**
	 *  �û���Ϣ�����ܴa
	 */
	  Integer updateYonghuReset(Yonghu yonghu);
	  /**
	   * ����id��ԃ�Ñ����P�Ľ�ɫ��Ϣ
	   */
	  List<Roles> selectRolesById(Yonghu yonghu);
	  /**
	   * �����Ñ���ɫ��Ϣ
	   */
	Integer  insertYonghuJuese(Yonghujuese yonghujuese);
	/**
	   * �ж������Ñ���ɫ��Ϣ���Ѵ��ڵĲ���������
	   */
	Integer  selecttYonghuJueseByR_idAndY_id(Yonghujuese yonghujuese);
	/**
	   * �h���Ñ���ɫ��Ϣ 
	   */
	Integer  deleteYonghuJueseByR_idAndY_id(Yonghujuese yonghujuese);
}
