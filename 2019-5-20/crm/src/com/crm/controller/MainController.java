package com.crm.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.entity.Models;
import com.crm.entity.Yonghu;
import com.crm.service.ModelService;
 

@Controller
public class MainController {
	@Autowired
	private  ModelService modelService;
//	查詢模块數據顯示
	@RequestMapping(value=("/showmain"),method=RequestMethod.POST)
	@ResponseBody 
	public List<Models> showmain(HttpSession session){ 
		   /*Yonghu yonghu=new Yonghu();*/
		   /*yonghu.setY_name("用户老孙");*/
		  Object attribute = session.getAttribute("yonghu");
		  Yonghu yh=(Yonghu)attribute ;
		  System.out.println(1);
		  System.out.println(yh);
		 //  System.out.println(modelService.selectModelByY_name(yonghu));
		return modelService.selectModelByY_name(yh);
	}
	
	@RequestMapping(value="/tuichu",method = RequestMethod.POST)
	@ResponseBody
	public Integer tuichu(HttpSession session) {
		Yonghu yonghu=(Yonghu)session.getAttribute("yonghu");
		  session.invalidate();
		/* session.removeAttribute("user"); */
		 return 1;
	 
	}

	

}
