package com.crm.entity;

import org.springframework.stereotype.Component;

@Component
public class Student {
	/*
	 * private Integer stu_id; private String stu_name; private String stu_sex;
	 * private Integer stu_age; private String stu_tel; private String stu_xueli;
	 * private Integer stu_State; private String stu_sourcer; private String
	 * stu_site; private String stu_qq; private String stu_weiXin; private Integer
	 * stu_reported; private String stu_note; private String stu_Address; private
	 * Integer r_id; private String p_class; private Integer p_validity; private
	 * String p_whyValidity; private Integer p_score; private Integer p_isReturn;
	 * private String p_firstReturnTime; private String p_isTheDoor; private String
	 * p_timeTheDoor; private String p_isPay; private String p_payTime; private
	 * Double p_price; private String p_isRefund; private String p_isClass; private
	 * String p_classTime; private String p_classNote; private String p_whyRefund;
	 * private Double p_deposit; private String p_depositTime; private String
	 * rouleNote;
	 */
	private Integer stu_id;				//学生id	
	private String stu_name;			//学生姓名
	private String stu_sex;				//性别
	private Integer stu_age;			//年龄
	private String stu_tel;				//电话
	private String stu_xueli;			//学历
	private Integer stu_State;			//状态
	private String stu_sourcer;			//来源渠道
	private String stu_site;			//来源网站
	private String stu_qq;				//学员QQ
	private String stu_weiXin;			//微信号
	private Integer stu_reported;		//是否报备
	private String stu_note;			//在线备注
	private String stu_Address;			//所在区域
	private String stu_loadTime;		//创建时间
	private Integer y_id;				//角色编号id
	private String p_class;				//课程方向
	private Integer p_validity;			//课程方向
	private String p_whyValidity;		//是否有效
	private Integer p_score;			//打分
	private Integer p_isReturn;			//是否回访
	private String p_firstReturnTime;	//首次回访时间
	private String p_isTheDoor;			//是否上门
	private String p_timeTheDoor;		//上门时间
	private String p_isPay;				//是否缴费
	private String p_payTime;			//缴费时间
	private Double p_price;				//金额
	private String p_isRefund;			//是否退费
	private String p_isClass;			//是否进班
	private String p_classTime;			//进班时间
	private String p_classNote;			//进班备注
	private String p_whyRefund;			//退费原因
	private Double p_deposit;			//定金金额
	private String p_depositTime;		//定金时间	
	private String rouleNote;			//咨询师备注
	private Student student;				//关系维护
	private Xueshenghuifang xueshenghuifang;//关系维护
	private Yonghu yonghu;					//关系维护
	private String y_name;
	private Integer w_id;
	
	
	public Integer getW_id() {
		return w_id;
	}
	public void setW_id(Integer w_id) {
		this.w_id = w_id;
	}
	public String getStu_loadTime() {
		return stu_loadTime;
	}
	public void setStu_loadTime(String stu_loadTime) {
		this.stu_loadTime = stu_loadTime;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	public Xueshenghuifang getXueshenghuifang() {
		return xueshenghuifang;
	}
	public void setXueshenghuifang(Xueshenghuifang xueshenghuifang) {
		this.xueshenghuifang = xueshenghuifang;
	}
	public Yonghu getYonghu() {
		return yonghu;
	}
	public void setYonghu(Yonghu yonghu) {
		this.yonghu = yonghu;
	}
	public String getY_name() {
		return y_name;
	}
	public void setY_name(String y_name) {
		this.y_name = y_name;
	}
	public Integer getStu_id() {
		return stu_id;
	}
	public void setStu_id(Integer stu_id) {
		this.stu_id = stu_id;
	}
	public String getStu_name() {
		return stu_name;
	}
	public void setStu_name(String stu_name) {
		this.stu_name = stu_name;
	}
	public String getStu_sex() {
		return stu_sex;
	}
	public void setStu_sex(String stu_sex) {
		this.stu_sex = stu_sex;
	}
	public Integer getStu_age() {
		return stu_age;
	}
	public void setStu_age(Integer stu_age) {
		this.stu_age = stu_age;
	}
	public String getStu_tel() {
		return stu_tel;
	}
	public void setStu_tel(String stu_tel) {
		this.stu_tel = stu_tel;
	}
	public String getStu_xueli() {
		return stu_xueli;
	}
	public void setStu_xueli(String stu_xueli) {
		this.stu_xueli = stu_xueli;
	}
	public Integer getStu_State() {
		return stu_State;
	}
	public void setStu_State(Integer stu_State) {
		this.stu_State = stu_State;
	}
	public String getStu_sourcer() {
		return stu_sourcer;
	}
	public void setStu_sourcer(String stu_sourcer) {
		this.stu_sourcer = stu_sourcer;
	}
	public String getStu_site() {
		return stu_site;
	}
	public void setStu_site(String stu_site) {
		this.stu_site = stu_site;
	}
	public String getStu_qq() {
		return stu_qq;
	}
	public void setStu_qq(String stu_qq) {
		this.stu_qq = stu_qq;
	}
	public String getStu_weiXin() {
		return stu_weiXin;
	}
	public void setStu_weiXin(String stu_weiXin) {
		this.stu_weiXin = stu_weiXin;
	}
	public Integer getStu_reported() {
		return stu_reported;
	}
	public void setStu_reported(Integer stu_reported) {
		this.stu_reported = stu_reported;
	}
	public String getStu_note() {
		return stu_note;
	}
	public void setStu_note(String stu_note) {
		this.stu_note = stu_note;
	}
	public String getStu_Address() {
		return stu_Address;
	}
	public void setStu_Address(String stu_Address) {
		this.stu_Address = stu_Address;
	}
	 
	public Integer getY_id() {
		return y_id;
	}
	public void setY_id(Integer y_id) {
		this.y_id = y_id;
	}
	 
	public String getP_class() {
		return p_class;
	}
	public void setP_class(String p_class) {
		this.p_class = p_class;
	}
	public Integer getP_validity() {
		return p_validity;
	}
	public void setP_validity(Integer p_validity) {
		this.p_validity = p_validity;
	}
	public String getP_whyValidity() {
		return p_whyValidity;
	}
	public void setP_whyValidity(String p_whyValidity) {
		this.p_whyValidity = p_whyValidity;
	}
	public Integer getP_score() {
		return p_score;
	}
	public void setP_score(Integer p_score) {
		this.p_score = p_score;
	}
	public Integer getP_isReturn() {
		return p_isReturn;
	}
	public void setP_isReturn(Integer p_isReturn) {
		this.p_isReturn = p_isReturn;
	}
	public String getP_firstReturnTime() {
		return p_firstReturnTime;
	}
	public void setP_firstReturnTime(String p_firstReturnTime) {
		this.p_firstReturnTime = p_firstReturnTime;
	}
	public String getP_isTheDoor() {
		return p_isTheDoor;
	}
	public void setP_isTheDoor(String p_isTheDoor) {
		this.p_isTheDoor = p_isTheDoor;
	}
	public String getP_timeTheDoor() {
		return p_timeTheDoor;
	}
	public void setP_timeTheDoor(String p_timeTheDoor) {
		this.p_timeTheDoor = p_timeTheDoor;
	}
	public String getP_isPay() {
		return p_isPay;
	}
	public void setP_isPay(String p_isPay) {
		this.p_isPay = p_isPay;
	}
	public String getP_payTime() {
		return p_payTime;
	}
	public void setP_payTime(String p_payTime) {
		this.p_payTime = p_payTime;
	}
	public Double getP_price() {
		return p_price;
	}
	public void setP_price(Double p_price) {
		this.p_price = p_price;
	}
	public String getP_isRefund() {
		return p_isRefund;
	}
	public void setP_isRefund(String p_isRefund) {
		this.p_isRefund = p_isRefund;
	}
	public String getP_isClass() {
		return p_isClass;
	}
	public void setP_isClass(String p_isClass) {
		this.p_isClass = p_isClass;
	}
	public String getP_classTime() {
		return p_classTime;
	}
	public void setP_classTime(String p_classTime) {
		this.p_classTime = p_classTime;
	}
	public String getP_classNote() {
		return p_classNote;
	}
	public void setP_classNote(String p_classNote) {
		this.p_classNote = p_classNote;
	}
	public String getP_whyRefund() {
		return p_whyRefund;
	}
	public void setP_whyRefund(String p_whyRefund) {
		this.p_whyRefund = p_whyRefund;
	}
	public Double getP_deposit() {
		return p_deposit;
	}
	public void setP_deposit(Double p_deposit) {
		this.p_deposit = p_deposit;
	}
	public String getP_depositTime() {
		return p_depositTime;
	}
	public void setP_depositTime(String p_depositTime) {
		this.p_depositTime = p_depositTime;
	}
	public String getRouleNote() {
		return rouleNote;
	}
	public void setRouleNote(String rouleNote) {
		this.rouleNote = rouleNote;
	}
	@Override
	public String toString() {
		return "Student [stu_id=" + stu_id + ", stu_name=" + stu_name + ", stu_sex=" + stu_sex + ", stu_age=" + stu_age
				+ ", stu_tel=" + stu_tel + ", stu_xueli=" + stu_xueli + ", stu_State=" + stu_State + ", stu_sourcer="
				+ stu_sourcer + ", stu_site=" + stu_site + ", stu_qq=" + stu_qq + ", stu_weiXin=" + stu_weiXin
				+ ", stu_reported=" + stu_reported + ", stu_note=" + stu_note + ", stu_Address=" + stu_Address
				+ ", stu_loadTime=" + stu_loadTime + ", y_id=" + y_id + ", p_class=" + p_class + ", p_validity="
				+ p_validity + ", p_whyValidity=" + p_whyValidity + ", p_score=" + p_score + ", p_isReturn="
				+ p_isReturn + ", p_firstReturnTime=" + p_firstReturnTime + ", p_isTheDoor=" + p_isTheDoor
				+ ", p_timeTheDoor=" + p_timeTheDoor + ", p_isPay=" + p_isPay + ", p_payTime=" + p_payTime
				+ ", p_price=" + p_price + ", p_isRefund=" + p_isRefund + ", p_isClass=" + p_isClass + ", p_classTime="
				+ p_classTime + ", p_classNote=" + p_classNote + ", p_whyRefund=" + p_whyRefund + ", p_deposit="
				+ p_deposit + ", p_depositTime=" + p_depositTime + ", rouleNote=" + rouleNote + ", student=" + student
				+ ", xueshenghuifang=" + xueshenghuifang + ", yonghu=" + yonghu + ", y_name=" + y_name + "]";
	}
	
	

}
