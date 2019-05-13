package com.crm.service;

import java.util.List;

import com.crm.entity.Fenye;
import com.crm.entity.Roles;

public interface RolesService {
	/**
	 * ��������ҳ��ѯ��ɫ������Ϣ
	 */
	List<Roles> selectRolesAll(Fenye<Roles> fenye);
	/**
	 * ��ѯ��ɫ������Ϣ������
	 */
	Integer selectRolesCount();
	
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
	/**
	 * ��ѯ�û���ɫ��Ϣ���Ƽ���
	 */
	Integer selectRolesAllByName(Roles roles);

}