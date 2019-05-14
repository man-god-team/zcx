package com.crm.dao;

import java.util.List;
 
import com.crm.entity.Model;

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
}
