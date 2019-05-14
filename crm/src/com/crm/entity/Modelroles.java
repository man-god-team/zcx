package com.crm.entity;

import org.springframework.stereotype.Component;

@Component
public class Modelroles {
	private Integer mr_id;
	private Integer r_id;
	private Integer m_id;
	public Integer getMr_id() {
		return mr_id;
	}
	public void setMr_id(Integer mr_id) {
		this.mr_id = mr_id;
	}
	public Integer getR_id() {
		return r_id;
	}
	public void setR_id(Integer r_id) {
		this.r_id = r_id;
	}
	public Integer getM_id() {
		return m_id;
	}
	public void setM_id(Integer m_id) {
		this.m_id = m_id;
	}
	@Override
	public String toString() {
		return "Modelroles [mr_id=" + mr_id + ", r_id=" + r_id + ", m_id=" + m_id + "]";
	}


}
