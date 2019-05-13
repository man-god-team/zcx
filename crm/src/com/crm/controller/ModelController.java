package com.crm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.entity.Fenye;
import com.crm.entity.Model;
import com.crm.service.ModelService;

@Controller
public class ModelController {
	@Autowired
	private ModelService modelService;
//	²éÔƒÄ£¿é”µ“þï@Ê¾
	@RequestMapping(value=("/showmodel"),method=RequestMethod.POST)
	@ResponseBody 
	public Fenye<Model> showmodel() {
		Fenye<Model> fenye=new Fenye<Model>();
		 
		List<Model> selectModelAll = modelService.selectModelAll(fenye);
		Integer selectModelCount = modelService.selectModelCount();
		fenye.setRows(selectModelAll);
		fenye.setTotal(selectModelCount);
		 System.out.println(fenye); 
		return fenye;
	}

	
}
