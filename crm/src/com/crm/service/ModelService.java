package com.crm.service;

import java.util.List;

import com.crm.entity.Fenye;
import com.crm.entity.Model;

public interface ModelService {
	/**
	 * ��������ҳ��ѯģ��������Ϣ
	 */
	List<Model> selectModelAll(Fenye<Model> fenye);
	/**
	 * ��ѯģ��������Ϣ������
	 */
	Integer selectModelCount();
	/**
	 * �޸��û�ģ����Ϣ
	 */
	Integer updateModelAll(Model Model);
	/**
	 * ɾ��ģ��������Ϣ
	 */
	Integer deleteModel(Model Model);
	/**
	 * ����ģ����Ϣ
	 */
	Integer insertModel(Model Model);

}
