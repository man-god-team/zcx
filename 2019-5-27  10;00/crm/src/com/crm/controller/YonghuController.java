package com.crm.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession; 

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
	@RequestMapping(value = ("/showYonghu"), method = RequestMethod.POST)
	@ResponseBody
	public Fenye<Yonghu> showYonghu(Integer page, Integer rows, String y_name, String y_createStartTime,
			String y_createEndTime, Integer y_isLockout, Integer yq_state, String minTime, String maxTime,Integer orderByTime) {
		Fenye<Yonghu> fenye = new Fenye<Yonghu>();
	 
		fenye.setOrderByTime(orderByTime);
		fenye.setMaxTime(maxTime);
		fenye.setMinTime(minTime);
		fenye.setYq_state(yq_state);
		fenye.setY_name(y_name);
		fenye.setY_createEndTime(y_createEndTime);
		fenye.setY_createStartTime(y_createStartTime);
		fenye.setY_isLockout(y_isLockout);
		fenye.setPage((page - 1) * rows);
		fenye.setPageSize(rows);

		List<Yonghu> selectYonghuAll = YonghuServiceImp.selectYonghuAll(fenye);

		Integer selectYonghuCount = YonghuServiceImp.selectYonghuCount();
		fenye.setRows(selectYonghuAll);
		fenye.setTotal(selectYonghuCount);
		
		return fenye;
	}

//	查詢用戶數據顯示
	@RequestMapping(value = ("/showRoles1"), method = RequestMethod.POST)
	@ResponseBody
	public List<Roles> showRoles1(Roles roles) {

		return YonghuServiceImp.selectRolesNofenye(roles);
	}

//	删除用户 
	@RequestMapping(value = ("/deleteYonghu"), method = RequestMethod.POST)
	@ResponseBody
	public Integer deleteYonghu(Yonghu yonghu) {

		Integer i = YonghuServiceImp.selectYonghurolesByY_idCount(yonghu);
		if(i>0) {
			return 0;
		}else {
		return YonghuServiceImp.deleteYonghu(yonghu);
		}
	}

//	解锁，锁定用户信息 
	@RequestMapping(value = ("/jiesuoYonghu"), method = RequestMethod.POST)
	@ResponseBody
	public Integer jiesuoYonghu(Yonghu yonghu) {

		return YonghuServiceImp.updateYonghujiesoByisLockout(yonghu);
	}

//	签到签退用户信息 
	@RequestMapping(value = ("/qiandao"), method = RequestMethod.POST)
	@ResponseBody
	public Integer qiandao(Yonghu yonghu) {

		Date myDate = new Date();

		if (yonghu.getYq_state()==1) {
			yonghu.setYq_startTime(myDate.toLocaleString());
		}

		if (yonghu.getYq_state()==2) {
			yonghu.setYq_endTime(myDate.toLocaleString());
		}

		return YonghuServiceImp.updateYonghuqiandaoByisLockout(yonghu);
	}
	
//	一键签退 
	@RequestMapping(value = ("/yijianqiantui"), method = RequestMethod.POST)
	@ResponseBody
	public Integer yijianqiantui(Yonghu yonghu) {
		 
		return YonghuServiceImp.updateYonghuqiandaoByyijianqiantui(yonghu);
	}

//	新增用户信息 
	@RequestMapping(value = ("/addYonghuAll"), method = RequestMethod.POST)
	@ResponseBody
	public Integer addYonghuAll(Yonghu yonghu) {

		yonghu.setY_isLockout(2);
		yonghu.setYq_state(2);
		Date myDate = new Date(); 
		yonghu.setY_createTime(myDate.toLocaleString());
		yonghu.setY_lastLoginTime(myDate.toLocaleString()); 
		yonghu.setY_resetPassword(MD5Util.string2MD5("ysd123"));
		yonghu.setY_password(MD5Util.string2MD5(yonghu.getY_password()));
		yonghu.setY_pasdWrongShu(0);
		yonghu.setY_weight(1);

		Integer i = YonghuServiceImp.selectYonghuByY_nameCount(yonghu);
		if(i>0) {
			return 0;
		}else {
		return YonghuServiceImp.insertYonghu(yonghu);
		}
	}

//	修改用户信息 
	@RequestMapping(value = ("/updateYonghu"), method = RequestMethod.POST)
	@ResponseBody
	public Integer updateYonghu(Yonghu yonghu) {
		Date myDate = new Date(); 
		yonghu.setY_lastLoginTime(myDate.toLocaleString()); 

		return YonghuServiceImp.updateYonghu(yonghu);
	}

//	重置密碼 
	@RequestMapping(value = ("/ResetYonghu"), method = RequestMethod.POST)
	@ResponseBody
	public Integer ResetYonghu(Yonghu yonghu) { 
		
		return YonghuServiceImp.updateYonghuReset(yonghu);
	}
//	修改密碼 updateYonghuPassword
	@RequestMapping(value = ("/updateYonghuPassword"), method = RequestMethod.POST)
	@ResponseBody
	public Integer updateYonghuPassword(HttpSession session,Yonghu yonghu,String y_newpassword) { 
		
		yonghu.setY_newpassword(y_newpassword);
		  Object ses = session.getAttribute("yonghu");
		  Yonghu a=(Yonghu)ses;


		if(a.getY_password().equals(MD5Util.string2MD5(yonghu.getY_password()))) {
			yonghu.setY_newpassword(MD5Util.string2MD5(y_newpassword));
			session.invalidate();
		return YonghuServiceImp.updateYonghuPassword(yonghu);
		} 
		return 0;
	}
//	根據id查詢用戶角色信息
	@RequestMapping(value = ("/showRolesByY_Id"), method = RequestMethod.POST)
	@ResponseBody
	public List<Roles> showRolesByY_Id(Yonghu yonghu) {
		return YonghuServiceImp.selectRolesById(yonghu);
	}

//	新增用戶角色 
	@RequestMapping(value = ("/addYonghuJuese"), method = RequestMethod.POST)
	@ResponseBody
	public Integer addYonghuJuese(Yonghujuese yonghujuese) {
		Integer selecttYonghuJueseByR_idAndY_id = YonghuServiceImp.selecttYonghuJueseByR_idAndY_id(yonghujuese);
		if (selecttYonghuJueseByR_idAndY_id > 0) {
			return 0;
		} else {
			
			return YonghuServiceImp.insertYonghuJuese(yonghujuese);
		}

	}

//	刪除用戶角色 
	@RequestMapping(value = ("/deleteYonghuJuese"), method = RequestMethod.POST)
	@ResponseBody
	public Integer deleteYonghuJuese(Yonghujuese yonghujuese) {
		return YonghuServiceImp.deleteYonghuJueseByR_idAndY_id(yonghujuese);

	}

}
