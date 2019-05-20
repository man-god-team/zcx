package com.crm.service;

import java.util.List;

import com.crm.entity.Fenye;
import com.crm.entity.Model;
import com.crm.entity.Modelroles;
import com.crm.entity.Models;
import com.crm.entity.Roles;
import com.crm.entity.Yonghu;

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
	/**
	 * ���ݽ�ɫid��ѯģ����Ϣ
	 */
	List<Models> selectModelByR_id(Integer r_id);
	/**
	 * ����������ɫģ����Ϣ
	 */
	Integer InsertRolem(String m_id,Integer r_id);
	/**
	 * ��ѯ��¼�ɹ�ʱ �ĵ�¼�˽�ɫ
	 */
	Roles selectRolesByY_id(Yonghu yonghu);
}
