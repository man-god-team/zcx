package com.crm.entity;

import org.springframework.stereotype.Component;

@Component
public class Xueshenghuifang {
	private Integer t_id;				//����id
	private Integer stu_id;				//ѧ��id
	private Integer y_id;				//�û�id
	private String t_visitTime;			//�ط�ʱ��
	private String t_Revisit;			//�ط����
	private String t_method;			//���ٷ�ʽ
	private String t_nextTraceTime;		//�´θ���ʱ��
	private String t_note;				//��ע
	
	private Student student;			//ά�� ѧ��
	private Yonghu yonghu;				//ά�� �û�
	public Integer getT_id() {
		return t_id;
	}
	public void setT_id(Integer t_id) {
		this.t_id = t_id;
	}
	public Integer getStu_id() {
		return stu_id;
	}
	public void setStu_id(Integer stu_id) {
		this.stu_id = stu_id;
	}
	public Integer getY_id() {
		return y_id;
	}
	public void setY_id(Integer y_id) {
		this.y_id = y_id;
	}
	public String getT_visitTime() {
		return t_visitTime;
	}
	public void setT_visitTime(String t_visitTime) {
		this.t_visitTime = t_visitTime;
	}
	public String getT_Revisit() {
		return t_Revisit;
	}
	public void setT_Revisit(String t_Revisit) {
		this.t_Revisit = t_Revisit;
	}
	public String getT_method() {
		return t_method;
	}
	public void setT_method(String t_method) {
		this.t_method = t_method;
	}
	public String getT_nextTraceTime() {
		return t_nextTraceTime;
	}
	public void setT_nextTraceTime(String t_nextTraceTime) {
		this.t_nextTraceTime = t_nextTraceTime;
	}
	public String getT_note() {
		return t_note;
	}
	public void setT_note(String t_note) {
		this.t_note = t_note;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	public Yonghu getYonghu() {
		return yonghu;
	}
	public void setYonghu(Yonghu yonghu) {
		this.yonghu = yonghu;
	}
	@Override
	public String toString() {
		return "Xueshenghuifang [t_id=" + t_id + ", stu_id=" + stu_id
				+ ", y_id=" + y_id + ", t_visitTime=" + t_visitTime
				+ ", t_Revisit=" + t_Revisit + ", t_method=" + t_method
				+ ", t_nextTraceTime=" + t_nextTraceTime + ", t_note=" + t_note
				+ ", student=" + student + ", yonghu=" + yonghu + "]";
	}
	
	
	
}
