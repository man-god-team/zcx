package com.crm.entity;

import java.util.List;

public class Models {
	private Integer id;
	private String text;
	private String path;
	private String weight;
	private Boolean checked;
	private List<Models> children;
 
	
	 
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	public Boolean getChecked() {
		return checked;
	}
	public void setChecked(Boolean checked) {
		this.checked = checked;
	}
	public List<Models> getChildren() {
		return children;
	}
	public void setChildren(List<Models> children) {
		this.children = children;
	}
	@Override
	public String toString() {
		return "Models [id=" + id + ", text=" + text + ", path=" + path + ", weight=" + weight + ", checked=" + checked
				+ ", children=" + children + "]";
	}
	

}
