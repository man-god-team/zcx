package com.crm.dao;

import java.util.List;

import com.crm.entity.*;

public interface XueshenghuifangMapper {
	/**
	 * ��������ѯ����������
	 * ������٣���������ѯ���鿴������Ϣ����
	 * @param fenye
	 * @return
	 */
	Integer selectCount(Fenye<Xueshenghuifang> fenye);
	/**
	 * ��������ѯ�������
	 * ������٣���������ѯ���鿴������Ϣ
	 * @param fenye
	 * @return
	 */
	List<Xueshenghuifang> selectAllXueshenghuifang(Fenye<Xueshenghuifang> fenye);
//	

	/**
	 * ���
	 * @param xueshenghuifang
	 * @return
	 */
	Integer insertXueshenghuifang(Xueshenghuifang xueshenghuifang);
}
