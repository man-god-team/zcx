package com.crm.service;

import java.util.List;

import com.crm.entity.Fenye;
import com.crm.entity.Xueshenghuifang;

public interface XueshenghuifangService {
	/**
	 * ��������ѯ���������� ������٣���������ѯ���鿴������Ϣ����
	 * 
	 * @param fenye
	 * @return
	 */
	Integer selectCount(Fenye fenye);

	/**
	 * ��������ѯ������� ������٣���������ѯ���鿴������Ϣ
	 * 
	 * @param fenye
	 * @return
	 */
	List<Xueshenghuifang> selectAllXueshenghuifang(Fenye fenye);
	
	

	/**
	 * ���
	 * @param xueshenghuifang
	 * @return
	 */
	Integer insertXueshenghuifang(Xueshenghuifang xueshenghuifang);
	
}
