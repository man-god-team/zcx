package com.crm.entity;

import org.springframework.stereotype.Component;

@Component
public class Zidongfenpei {
	private Integer f_id;
	private String fenpeizhuangtai;
	public Integer getF_id() {
		return f_id;
	}
	public void setF_id(Integer f_id) {
		this.f_id = f_id;
	}
	public String getFenpeizhuangtai() {
		return fenpeizhuangtai;
	}
	public void setFenpeizhuangtai(String fenpeizhuangtai) {
		this.fenpeizhuangtai = fenpeizhuangtai;
	}
	

}
