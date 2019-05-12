package com.crm.entity;

public class Yonghu {
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
		this.y_password = y_password;
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
				+ ", y_yanzhengma=" + y_yanzhengma + ", y_resetPassword=" + y_resetPassword + "]";
	}


}
