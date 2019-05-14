package com.crm.controller;
 
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.entity.Fenye;
import com.crm.entity.Roles;
import com.crm.entity.Yonghu;
import com.crm.entity.Yonghujuese;
import com.crm.service.RolesService;
import com.crm.service.YonghuService;
import com.crm.service.YonghuServiceImp;
import com.crm.util.MD5Util;

@Controller
public class YonghuController {
//	测试运行
	/*
	 * @RequestMapping(value=("/a"),method=RequestMethod.GET)
	 * 
	 * @ResponseBody public void a() { System.out.println("sadf"); }
	 */
	
	 

	@Autowired
	private YonghuService YonghuServiceImp;
//	查詢用戶數據顯示
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
//	查詢用戶數據顯示
	@RequestMapping(value=("/showRoles1"),method=RequestMethod.POST)
	@ResponseBody 
	public List<Roles> showRoles1(Roles roles) { 
			 
		  
		return YonghuServiceImp.selectRolesNofenye(roles);
	}
	
//	删除用户 
	@RequestMapping(value=("/deleteYonghu"),method=RequestMethod.POST)
	@ResponseBody
	public Integer deleteYonghu(Yonghu yonghu) {
		 
		return YonghuServiceImp.deleteYonghu(yonghu);
	}
 
//	解锁，锁定用户信息 
	@RequestMapping(value=("/jiesuoYonghu"),method=RequestMethod.POST)
	@ResponseBody
	public Integer jiesuoYonghu(Yonghu yonghu) {
		 System.out.println(yonghu);
		return YonghuServiceImp.updateYonghujiesoByisLockout(yonghu);
	}
//	新增用户信息 
	@RequestMapping(value=("/addYonghu"),method=RequestMethod.POST)
	@ResponseBody
	public Integer addYonghu(Yonghu yonghu) {
		
		Date myDate = new Date(); 
		System.out.println(myDate.toLocaleString());
		yonghu.setY_createTime(myDate.toLocaleString());
		yonghu.setY_lastLoginTime(myDate.toLocaleString());
		yonghu.setY_resetPassword("ysd123");
		yonghu.setY_pasdWrongShu(0); 
		yonghu.setY_weight(1);
		/* String md5 = MD5Util.string2MD5(yonghu.getY_password()); */
		 
		 System.out.println(yonghu);
		return YonghuServiceImp.insertYonghu(yonghu);
	}
//	修改用户信息 
	@RequestMapping(value=("/updateYonghu"),method=RequestMethod.POST)
	@ResponseBody
	public Integer updateYonghu(Yonghu yonghu) {
		Date myDate = new Date(); 
		System.out.println(myDate.toLocaleString());
		yonghu.setY_lastLoginTime(myDate.toLocaleString());
		 System.out.println(yonghu);
	 
		return YonghuServiceImp.updateYonghu(yonghu);
	}
//	重置密碼 
	@RequestMapping(value=("/ResetYonghu"),method=RequestMethod.POST)
	@ResponseBody
	public Integer ResetYonghu(Yonghu yonghu) { 
		return YonghuServiceImp.updateYonghuReset(yonghu);
	}
//	根據id查詢用戶角色信息
	@RequestMapping(value=("/showRolesByY_Id"),method=RequestMethod.POST)
	@ResponseBody
	public List<Roles> showRolesByY_Id(Yonghu yonghu) { 
		return YonghuServiceImp.selectRolesById(yonghu);
	}
//	新增用戶角色 
	@RequestMapping(value=("/addYonghuJuese"),method=RequestMethod.POST)
	@ResponseBody
	public Integer addYonghuJuese(Yonghujuese yonghujuese) { 
		Integer selecttYonghuJueseByR_idAndY_id = YonghuServiceImp.selecttYonghuJueseByR_idAndY_id(yonghujuese);
		if(selecttYonghuJueseByR_idAndY_id>0) {
			return 0;
		}else {
			return YonghuServiceImp.insertYonghuJuese(yonghujuese);
		}
		
	}

//	刪除用戶角色 
	@RequestMapping(value=("/deleteYonghuJuese"),method=RequestMethod.POST)
	@ResponseBody
	public Integer deleteYonghuJuese(Yonghujuese yonghujuese) { 
		 
			return YonghuServiceImp.deleteYonghuJueseByR_idAndY_id(yonghujuese);
		 
	}
}
