package com.crm.service;

import java.util.List;

import com.crm.entity.Fenye;
import com.crm.entity.Xueshenghuifang;

public interface XueshenghuifangService {
	/**
	 * 多条件查询数据总条数 网络跟踪；按条件查询，查看跟踪信息条数
	 * 
	 * @param fenye
	 * @return
	 */
	Integer selectCount(Fenye fenye);

	/**
	 * 多条件查询跟踪情况 网络跟踪；按条件查询，查看跟踪信息
	 * 
	 * @param fenye
	 * @return
	 */
	List<Xueshenghuifang> selectAllXueshenghuifang(Fenye fenye);
	
	

	/**
	 * 添加
	 * @param xueshenghuifang
	 * @return
	 */
	Integer insertXueshenghuifang(Xueshenghuifang xueshenghuifang);
	
}
