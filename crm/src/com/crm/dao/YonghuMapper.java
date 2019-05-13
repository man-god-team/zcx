package com.crm.dao;

import java.util.List;

import com.crm.entity.Fenye;
import com.crm.entity.Yonghu;

public interface YonghuMapper {
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
	  
}
