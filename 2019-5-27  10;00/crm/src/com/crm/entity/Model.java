package com.crm.entity;

import org.springframework.stereotype.Component;

@Component
public class Model {
	private Integer m_id;
	private String m_name;
	private Integer m_parentId;
	private String m_path;
	private Integer m_weight;
	private String m_weitghtDescribe;
	private Integer m_ops;
	private String m_exitInt;
	private Integer 	m_exitString;
	public Integer getM_id() {
		return m_id;
	}
	public void setM_id(Integer m_id) {
		this.m_id = m_id;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public Integer getM_parentId() {
		return m_parentId;
	}
	public void setM_parentId(Integer m_parentId) {
		this.m_parentId = m_parentId;
	}
	public String getM_path() {
		return m_path;
	}
	public void setM_path(String m_path) {
		this.m_path = m_path;
	}
	public Integer getM_weight() {
		return m_weight;
	}
	public void setM_weight(Integer m_weight) {
		this.m_weight = m_weight;
	}
	public String getM_weitghtDescribe() {
		return m_weitghtDescribe;
	}
	public void setM_weitghtDescribe(String m_weitghtDescribe) {
		this.m_weitghtDescribe = m_weitghtDescribe;
	}
	public Integer getM_ops() {
		return m_ops;
	}
	public void setM_ops(Integer m_ops) {
		this.m_ops = m_ops;
	}
	public String getM_exitInt() {
		return m_exitInt;
	}
	public void setM_exitInt(String m_exitInt) {
		this.m_exitInt = m_exitInt;
	}
	public Integer getM_exitString() {
		return m_exitString;
	}
	public void setM_exitString(Integer m_exitString) {
		this.m_exitString = m_exitString;
	}
	
	public Model() {
		super();
	}
	@Override
	public String toString() {
		return "Model [m_id=" + m_id + ", m_name=" + m_name + ", m_parentId=" + m_parentId + ", m_path=" + m_path
				+ ", m_weight=" + m_weight + ", m_weitghtDescribe=" + m_weitghtDescribe + ", m_ops=" + m_ops
				+ ", m_exitInt=" + m_exitInt + ", m_exitString=" + m_exitString + "]";
	}

}
