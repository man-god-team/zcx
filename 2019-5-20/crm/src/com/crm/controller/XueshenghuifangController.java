package com.crm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.entity.Fenye;
import com.crm.entity.Xueshenghuifang;
import com.crm.service.XueshenghuifangService;

@Controller
public class XueshenghuifangController {
	 
	@Autowired
	private XueshenghuifangService xueshenghuifangService;

	@RequestMapping(value = "/getXueshenghuifang", method = RequestMethod.POST)
	@ResponseBody
	public Fenye<Xueshenghuifang> getXueshenghuifang(Integer page,
			Integer rows, String stu_name, String y_name, String t_visitTime,
			String t_nextTraceTime, String t_Revisit, String t_method) {
		 Fenye<Xueshenghuifang> fenye=new Fenye<Xueshenghuifang>();
		fenye.setPage((page - 1) * rows);
		fenye.setPageSize(rows);
		fenye.setStu_name(stu_name);
		fenye.setY_name(y_name);
		fenye.setT_visitTime(t_visitTime);
		fenye.setT_Revisit(t_Revisit);
		fenye.setT_nextTraceTime(t_nextTraceTime);
		fenye.setT_method(t_method);
		fenye.setT_visitTime(t_visitTime);
		Integer selectCount = xueshenghuifangService.selectCount(fenye);
		List<Xueshenghuifang> selectAll = xueshenghuifangService
				.selectAllXueshenghuifang(fenye);
		fenye.setTotal(selectCount);
		fenye.setRows(selectAll);
		return fenye;

	}
	@RequestMapping(value = "/insertHuifang", method = RequestMethod.POST)
	@ResponseBody
		public Integer insertHuifang(Xueshenghuifang xueshenghuifang ){
			Integer insertXueshenghuifang = xueshenghuifangService.insertXueshenghuifang(xueshenghuifang);
			return insertXueshenghuifang;			
		}
}
