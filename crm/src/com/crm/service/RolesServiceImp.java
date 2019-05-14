package com.crm.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.dao.RolesMapper;
import com.crm.entity.Fenye;
import com.crm.entity.Model;
import com.crm.entity.Modelroles;
import com.crm.entity.Models;
import com.crm.entity.Roles;
@Service
public class RolesServiceImp implements RolesService{

	@Autowired
	private RolesMapper rolesMapper;
	@Autowired
	private Modelroles modelroles;
	@Override
	public List<Roles> selectRolesAll(Fenye<Roles> fenye) {
		// TODO Auto-generated method stub
		return rolesMapper.selectRolesAll(fenye);
	}

	@Override
	public Integer selectRolesCount() {
		// TODO Auto-generated method stub
		return rolesMapper.selectRolesCount();
	}

	@Override
	public Integer deleteRoles(Roles roles) {
		// TODO Auto-generated method stub
		return rolesMapper.deleteRoles(roles);
	}

	@Override
	public Integer insertRoles(Roles roles) {
		// TODO Auto-generated method stub
		return rolesMapper.insertRoles(roles);
	}

	@Override
	public Integer updateRoles(Roles roles) {
		// TODO Auto-generated method stub
		return rolesMapper.updateRoles(roles);
	}

	@Override
	public Integer selectRolesAllByName(Roles roles) {
		// TODO Auto-generated method stub
		return rolesMapper.selectRolesAllByName(roles);
	}

	 
	@Override 
		public List<Models>  selectModelByR_id(Integer r_id) {
			
			List<Models> mokuaiTreelist=new ArrayList<Models>();
			
			List<Model> mokuailist = rolesMapper.selectModel();
			
			for (int i = 0; i < mokuailist.size(); i++) {
				
					if (mokuailist.get(i).getM_parentId() == 0) {	
					  addtree(mokuaiTreelist, mokuailist, i,r_id);				
				         }			
			}
		
			
			return mokuaiTreelist;
		}
		private void addtree(List<Models> mokuaiTreelist, List<Model> mokuailist, int i,Integer r_id) {
			Models mk = new Models();
			mk.setId(mokuailist.get(i).getM_id());
			mk.setText(mokuailist.get(i).getM_name());

			modelroles.setR_id(r_id);
			modelroles.setM_id(mokuailist.get(i).getM_id());
			Integer selectMokuai_js_id = rolesMapper.selectRoleModulByR_idAndM_id(modelroles);
			if (mokuailist.get(i).getM_parentId() == 0) {
				Integer selectMokuai_isyouzi = rolesMapper.selectModulByM_parentId(mokuailist.get(i).getM_id());//根据父节点查询总条数
				if (selectMokuai_isyouzi > 0) {
					mk.setChecked(false);
				} else {
					mk.setChecked(selectMokuai_js_id == 1);
				}
			} else {
				mk.setChecked(selectMokuai_js_id == 1);
			}
			Models fortree = fortree(mokuailist, i, mk, r_id);
			if (fortree != null) {
				mokuaiTreelist.add(fortree);
			}
		}

		private Models fortree(List<Model> mokuailist, int i,Models mk,Integer r_id) {
			List<Models> treelist = new ArrayList<Models>();
			for (int j = 0; j < mokuailist.size(); j++) {
				if (mokuailist.get(j).getM_parentId() == mokuailist.get(i).getM_id()) {
					addtree(treelist, mokuailist, j,r_id);
				}
			}
			mk.setChildren(treelist);
			return mk;
		}
		@Override 
		public Integer InsertRolem(String m_id,Integer r_id) {
			// TODO Auto-generated method stub
			if(m_id!=null && m_id!="") {
				String[] split = m_id.split(",");
				System.out.println(split.length);
				List<Modelroles> list = new ArrayList<Modelroles>();
				for (int i = 0; i < split.length; i++) {
					Modelroles jm = new Modelroles();
					jm.setM_id(Integer.parseInt(split[i]));
					jm.setR_id(r_id);
					list.add(jm);
				}

				Integer a = rolesMapper.deleteRoleModule(r_id);
				if (a >= 0) {
					rolesMapper.insertRoleModule(list);
				}
			}else {
				rolesMapper.deleteRoleModule(r_id);
			}
			
		return 1;
		}

		

}
