package com.crm.entity;

public class Roles {
	private Integer r_id;
	private String r_name;
	private Integer exitInt;
	private String exitString;
	public Integer getR_id() {
		return r_id;
	}
	public void setR_id(Integer r_id) {
		this.r_id = r_id;
	}
	public String getR_name() {
		return r_name;
	}
	public void setR_name(String r_name) {
		this.r_name = r_name;
	}
	public Integer getExitInt() {
		return exitInt;
	}
	public void setExitInt(Integer exitInt) {
		this.exitInt = exitInt;
	}
	public String getExitString() {
		return exitString;
	}
	public void setExitString(String exitString) {
		this.exitString = exitString;
	}
	@Override
	public String toString() {
		return "Roles [r_id=" + r_id + ", r_name=" + r_name + ", exitInt=" + exitInt + ", exitString=" + exitString
				+ "]";
	}


}
