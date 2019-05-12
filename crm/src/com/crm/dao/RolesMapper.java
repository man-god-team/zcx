package com.crm.dao;

import java.util.List;

import com.crm.entity.Fenye;
import com.crm.entity.Roles;

public interface RolesMapper {
	/**
	 * ��������ҳ��ѯ��ɫ������Ϣ
	 */
	List<Roles> selectRolesAll(Fenye<Roles> fenye);
	/**
	 * ��ѯ��ɫ������Ϣ������
	 */
	Integer selectRolesCount();
	/**
	 * ��ѯ�û���ɫ��Ϣ���Ƹ���
	 */
	Integer selectRolesAllByName(Roles roles);
	/**
	 * ɾ����ɫ������Ϣ
	 */
	Integer deleteRoles(Roles roles);
	/**
	 * ������ɫ��Ϣ
	 */
	Integer insertRoles(Roles roles);
	
	/**
	 * �޸Ľ�ɫ��Ϣ
	 */
	Integer updateRoles(Roles roles);
	 

}
