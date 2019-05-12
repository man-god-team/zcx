package com.crm.controller;
 
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.entity.Fenye;
import com.crm.entity.Yonghu;
import com.crm.service.YonghuService;
import com.crm.service.YonghuServiceImp;

@Controller
public class YonghuController {
//	��������
	/*
	 * @RequestMapping(value=("/a"),method=RequestMethod.GET)
	 * 
	 * @ResponseBody public void a() { System.out.println("sadf"); }
	 */
	
	@Autowired
	private YonghuService YonghuServiceImp;
//	��ԃ�Ñ������@ʾ
	@RequestMapping(value=("/showYonghu"),method=RequestMethod.POST)
	@ResponseBody 
	public Fenye<Yonghu> showYonghu(Integer page,Integer rows,String 	y_name,String 	y_createStartTime,String 	y_createEndTime,Integer y_isLockout) {
			Fenye<Yonghu> fenye=new Fenye<Yonghu>();
		fenye.setY_name(y_name);
		fenye.setY_createEndTime(y_createEndTime);
		fenye.setY_createStartTime(y_createStartTime);
		fenye.setY_isLockout(y_isLockout);
		fenye.setPage((page-1)*rows);
		fenye.setPageSize(rows);
		List<Yonghu> selectYonghuAll = YonghuServiceImp.selectYonghuAll(fenye);
		Integer selectYonghuCount = YonghuServiceImp.selectYonghuCount();
		fenye.setRows(selectYonghuAll);
		fenye.setTotal(selectYonghuCount);
		 System.out.println(fenye); 
		return fenye;
	}
//	ɾ���û� 
	@RequestMapping(value=("/deleteYonghu"),method=RequestMethod.POST)
	@ResponseBody
	public Integer deleteYonghu(Yonghu yonghu) {
		 
		return YonghuServiceImp.deleteYonghu(yonghu);
	}
 
//	�����������û���Ϣ 
	@RequestMapping(value=("/jiesuoYonghu"),method=RequestMethod.POST)
	@ResponseBody
	public Integer jiesuoYonghu(Yonghu yonghu) {
		 System.out.println(yonghu);
		return YonghuServiceImp.updateYonghujiesoByisLockout(yonghu);
	}
//	�����û���Ϣ 
	@RequestMapping(value=("/addYonghu"),method=RequestMethod.POST)
	@ResponseBody
	public Integer addYonghu(Yonghu yonghu) {
		 System.out.println(yonghu);
		return YonghuServiceImp.insertYonghu(yonghu);
	}
//	�޸��û���Ϣ 
	@RequestMapping(value=("/updateYonghu"),method=RequestMethod.POST)
	@ResponseBody
	public Integer updateYonghu(Yonghu yonghu) {
		 System.out.println(yonghu);
		return YonghuServiceImp.updateYonghu(yonghu);
	}

}
