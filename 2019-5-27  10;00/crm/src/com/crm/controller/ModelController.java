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
//	��ԃģ�锵���@ʾ
	@RequestMapping(value=("/showmodel"),method=RequestMethod.POST)
	@ResponseBody 
	public List<Models> showmodel() { 
		 Model model=new Model();
		 
		return modelService.selectModelAll(model);
	}
//����ģ�� 
	@RequestMapping(value=("/insertModules"),method=RequestMethod.POST)
	@ResponseBody 
	public Integer insertModules(Model model) { 
		
		Integer i = modelService.selectModelByM_name(model);
		if(i>0) {
			return 0;
		}else {
			return modelService.insertModel(model);
		} 
	}
//	ɾ��ģ�� 
	@RequestMapping(value=("/deleteModules"),method=RequestMethod.POST)
	@ResponseBody 
	public Integer deleteModules(Model model) { 
		Integer i = modelService.selectRolesModelByM_idCount(model);
		 if(i>0) {
			 return 0;
		 }else {
			 return modelService.deleteModel(model);
		 }
		
	}
//	����id��ѯģ������ 
	@RequestMapping(value=("/selectModuleById"),method=RequestMethod.POST)
	@ResponseBody 
	public Model selectModuleById(Model model) {   
		return modelService.selectModuleById(model);
	}
//	�޸�ģ�K����   
	@RequestMapping(value=("/updateModules"),method=RequestMethod.POST)
	@ResponseBody 
	public Integer updateModules(Model model) {  
		return modelService.updateModelAll(model);
	}
}
