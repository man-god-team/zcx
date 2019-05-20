package com.crm.entity;

import com.crm.util.MD5Util;
  
public class Yonghu{
	private Integer y_id;
	private String y_name;
	private String y_password;
	private String y_email;
	private String y_lastLoginTime;
	private String y_tel;
	private String y_createTime;
	private Integer y_pasdWrongShu;
	private Integer y_isLockout;
	private Integer y_weight;
	private String y_yanzhengma;
	private String y_resetPassword; 
	
	private Integer yq_state;
	private String yq_startTime;
	private String yq_endTime;
	private Integer orderByTime; 
	private String  y_newpassword;

	 private String r_name;
	 
	 
	public String getR_name() {
		return r_name;
	}
	public void setR_name(String r_name) {
		this.r_name = r_name;
	}
	public String getY_newpassword() {
		return y_newpassword;
	}
	public void setY_newpassword(String y_newpassword) {
		this.y_newpassword = y_newpassword;
	}
	public Integer getOrderByTime() {
		return orderByTime;
	}
	public void setOrderByTime(Integer orderByTime) {
		this.orderByTime = orderByTime;
	}
	public Integer getYq_state() {
		return yq_state;
	}
	public void setYq_state(Integer yq_state) {
		this.yq_state = yq_state;
	}
	public String getYq_startTime() {
		return yq_startTime;
	}
	public void setYq_startTime(String yq_startTime) {
		this.yq_startTime = yq_startTime;
	}
	public String getYq_endTime() {
		return yq_endTime;
	}
	public void setYq_endTime(String yq_endTime) {
		this.yq_endTime = yq_endTime;
	}
	public String getY_resetPassword() {
		return y_resetPassword;
	}
	public void setY_resetPassword(String y_resetPassword) {
		this.y_resetPassword = y_resetPassword;
	}
	public Integer getY_id() {
		return y_id;
	}
	public void setY_id(Integer y_id) {
		this.y_id = y_id;
	}
	public String getY_name() {
		return y_name;
	}
	public void setY_name(String y_name) {
		this.y_name = y_name;
	}
	public String getY_password() {
		return y_password;
	}
	public void setY_password(String y_password) {
		this.y_password =y_password;
	}
	public String getY_email() {
		return y_email;
	}
	public void setY_email(String y_email) {
		this.y_email = y_email;
	}
	public String getY_lastLoginTime() {
		return y_lastLoginTime;
	}
	public void setY_lastLoginTime(String y_lastLoginTime) {
		this.y_lastLoginTime = y_lastLoginTime;
	}
	public String getY_tel() {
		return y_tel;
	}
	public void setY_tel(String y_tel) {
		this.y_tel = y_tel;
	}
	public String getY_createTime() {
		return y_createTime;
	}
	public void setY_createTime(String y_createTime) {
		this.y_createTime = y_createTime;
	}
	public Integer getY_pasdWrongShu() {
		return y_pasdWrongShu;
	}
	public void setY_pasdWrongShu(Integer y_pasdWrongShu) {
		this.y_pasdWrongShu = y_pasdWrongShu;
	}
	public Integer getY_isLockout() {
		return y_isLockout;
	}
	public void setY_isLockout(Integer y_isLockout) {
		this.y_isLockout = y_isLockout;
	}
	public Integer getY_weight() {
		return y_weight;
	}
	public void setY_weight(Integer y_weight) {
		this.y_weight = y_weight;
	}
	public String getY_yanzhengma() {
		return y_yanzhengma;
	}
	public void setY_yanzhengma(String y_yanzhengma) {
		this.y_yanzhengma = y_yanzhengma;
	}
	@Override
	public String toString() {
		return "Yonghu [y_id=" + y_id + ", y_name=" + y_name + ", y_password=" + y_password + ", y_email=" + y_email
				+ ", y_lastLoginTime=" + y_lastLoginTime + ", y_tel=" + y_tel + ", y_createTime=" + y_createTime
				+ ", y_pasdWrongShu=" + y_pasdWrongShu + ", y_isLockout=" + y_isLockout + ", y_weight=" + y_weight
				+ ", y_yanzhengma=" + y_yanzhengma + ", y_resetPassword=" + y_resetPassword + ", yq_state=" + yq_state
				+ ", yq_startTime=" + yq_startTime + ", yq_endTime=" + yq_endTime + ", orderByTime=" + orderByTime
				+ "]";
	}
	


}
