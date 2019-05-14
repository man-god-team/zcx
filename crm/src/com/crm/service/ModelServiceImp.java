package com.crm.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.dao.ModelMapper;
import com.crm.entity.Model;
import com.crm.entity.Models;
   
@Service
public class ModelServiceImp  implements ModelService{

	@Autowired 
	private ModelMapper modelMapper;

	@Override
	public Integer updateModelAll(Model model) {
		// TODO Auto-generated method stub
		return modelMapper.updateModelAll(model);
	}

	@Override
	public Integer deleteModel(Model model) {
		// TODO Auto-generated method stub
		return modelMapper.deleteModel(model);
	}

	@Override
	public Integer insertModel(Model model) {
		// TODO Auto-generated method stub
		return modelMapper.insertModel(model);
	}

	 

//
	@Override
	public List<Models> selectModelAll(Model model) {
		// TODO Auto-generated method stub
		List<Models> Modelslist=new ArrayList<Models>();
		List<Model> Model = modelMapper.selectModelAll(model);
		for (int i = 0; i < Model.size(); i++) {
			if (Model.get(i).getM_parentId() == 0) {
				addtree(Modelslist, Model, i);
			}
		}
		return Modelslist;
	}

	private void addtree(List<Models> Modelslist, List<Model> Model, int i) {
		Models mk = new Models();
		mk.setId(Model.get(i).getM_id());
		mk.setText(Model.get(i).getM_name());
		mk.setChecked(Model.get(i).getM_parentId() == 1);
		Models fortree = fortree(Model, i,mk);
		if(fortree!=null) {
			Modelslist.add(fortree);
		}
	}

	private Models fortree(List<Model> Model, int i,Models models) {
		List<Models> treelist = new ArrayList<Models>();
		for (int j = 0; j < Model.size(); j++) {
			if (Model.get(j).getM_parentId() == Model.get(i).getM_id()) {
				addtree(treelist, Model, j);
			}
		}
		models.setChildren(treelist);
		return models;
	}

	@Override
	public Model selectModuleById(Model model) {
		// TODO Auto-generated method stub
		return modelMapper.selectModuleById(model);
	}

	 
	
 

}
