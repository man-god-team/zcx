package com.crm.dao;

import java.util.List;
 
import com.crm.entity.Model;
import com.crm.entity.Yonghu;

public interface ModelMapper {
	/**
	 *  ��ѯģ��������Ϣ
	 */
	List<Model> selectModelAll(Model model);
	 
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
	 * ����id��ѯģ����Ϣ
	 */
	Model selectModuleById(Model model);
	/**
	 * �����û����� ��ѯ���ģ����Ϣ
	 */
	List<Model> selectModelByY_name(Yonghu yonghu);
}
