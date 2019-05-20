package com.crm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.entity.Model;
import com.crm.entity.Models;
import com.crm.service.ModelService; 

@Controller
public class ModelController {
	@Autowired
	private ModelService modelService;
//	查詢模块數據顯示
	@RequestMapping(value=("/showmodel"),method=RequestMethod.POST)
	@ResponseBody 
	public List<Models> showmodel() { 
		 Model model=new Model();
		 
		 System.out.println(model); 
		return modelService.selectModelAll(model);
	}
//新增模块 
	@RequestMapping(value=("/insertModules"),method=RequestMethod.POST)
	@ResponseBody 
	public Integer insertModules(Model model) { 
		  
		 
		 System.out.println(model); 
		return modelService.insertModel(model);
	}
//	删除模块 
	@RequestMapping(value=("/deleteModules"),method=RequestMethod.POST)
	@ResponseBody 
	public Integer deleteModules(Model model) { 
		  
		 
		 System.out.println(model); 
		return modelService.deleteModel(model);
	}
//	根据id查询模块数据 
	@RequestMapping(value=("/selectModuleById"),method=RequestMethod.POST)
	@ResponseBody 
	public Model selectModuleById(Model model) {  
		 System.out.println(modelService.selectModuleById(model)); 
		return modelService.selectModuleById(model);
	}
//	修改模塊數據   
	@RequestMapping(value=("/updateModules"),method=RequestMethod.POST)
	@ResponseBody 
	public Integer updateModules(Model model) {  
		return modelService.updateModelAll(model);
	}
}
