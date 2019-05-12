package com.crm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.dao.ModelMapper;
import com.crm.entity.Fenye;
import com.crm.entity.Model;
@Service
public class ModelServiceImp  implements ModelService{
	@Autowired
private ModelMapper modelMapper;
	@Override
	public List<Model> selectModelAll(Fenye<Model> fenye) {
		// TODO Auto-generated method stub
		return modelMapper.selectModelAll(fenye);
	}

	@Override
	public Integer selectModelCount() {
		// TODO Auto-generated method stub
		return modelMapper.selectModelCount();
	}

	@Override
	public Integer updateModelAll(Model Model) {
		// TODO Auto-generated method stub
		return modelMapper.updateModelAll(Model);
	}

	@Override
	public Integer deleteModel(Model Model) {
		// TODO Auto-generated method stub
		return modelMapper.deleteModel(Model);
	}

	@Override
	public Integer insertModel(Model Model) {
		// TODO Auto-generated method stub
		return modelMapper.insertModel(Model);
	}

}
