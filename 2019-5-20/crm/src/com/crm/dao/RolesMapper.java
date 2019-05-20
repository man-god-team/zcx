package com.crm.dao;

import java.util.List;

import com.crm.entity.Fenye;
import com.crm.entity.Model;
import com.crm.entity.Modelroles;
import com.crm.entity.Roles;
import com.crm.entity.Yonghu;

public interface RolesMapper {
	/**
	 * ��ѯ��ɫ������Ϣ
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
	/**
	 * ��ѯģ����Ϣ
	 */
	List<Model> selectModel();
	/**
	 * ����������ɫģ����Ϣ
	 */
	Integer insertRoleModule(List<Modelroles> list_mr);
	/**
	 * ɾ����ɫģ����Ϣ
	 */
	Integer deleteRoleModule(Integer r_id);
	/**
	 * ���ݽ�ɫid��ģ��id��ѯ����������
	 */
	Integer selectRoleModulByR_idAndM_id(Modelroles modelroles);
	/**
	 * ���ݸ��ڵ��ѯģ��������
	 */
	Integer selectModulByM_parentId(Integer m_parentId);
	
	/**
	 * ��ѯ��¼�ɹ�ʱ �ĵ�¼�˽�ɫ
	 */
	Roles selectRolesByY_id(Yonghu yonghu);
}
