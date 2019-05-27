package com.crm.service;

import java.util.List;

import com.crm.entity.Fenye;
import com.crm.entity.Model;
import com.crm.entity.Models;
import com.crm.entity.Roles;
import com.crm.entity.Yonghu;
import com.crm.entity.Model;

public interface ModelService {
	/**
	 * ����id��ѯģ����Ϣ
	 */
	Model selectModuleById(Model model);
	/**
	 *  ��ѯģ��������Ϣ
	 */
	 List<Models> selectModelAll(Model model);
	/**
	 * �޸��û�ģ����Ϣ
	 */
	Integer updateModelAll(Model model);
	/**
	 * ɾ��ģ��������Ϣ
	 */
	Integer deleteModel(Model model);
	/**
	 * ����ģ����Ϣ
	 */
	Integer insertModel(Model model);
	/**
	 * �����û����Ʋ�ѯģ����Ϣ
	 */
	List<Models> selectModelByY_name(Yonghu yonghu);
	/**
	 * �ж�������ӹ���ģ�����ֲ��ܽ������
	 */
	Integer selectModelByM_name(Model model);
	/**
	 * �ж�ɾ������ ���ڽ�ɫģ���ϵ�Ĳ���ɾ��
	 */
	Integer selectRolesModelByM_idCount(Model model);
	
}
