package com.crm.entity;

import java.util.List;

public class Fenye<T> {
	private Integer page;
	private Integer pageSize;
	private Integer total;
	private List<T> rows; 
	private String 	y_name;
	private String 	y_createStartTime;
	private String 	y_createEndTime;
	private Integer y_isLockout;
	private String r_name;
	private Integer yq_state;
	private String  minTime;
	private String maxTime;
	private String y_lastLoginTime;
	private String y_createTime;
	private Integer orderByTime;
	private Student student;
	 
	
	
	private T t;
	
	//网络跟踪-多查条件
	private String stu_name;			//学生姓名
	/* private String y_name; */			//用户姓名
	private String t_visitTime;			//回访时间
	private String t_nextTraceTime;		//下次跟踪时间
	private String t_Revisit;			//回访情况
	private String t_method;			//跟踪方式
	
	
	
	private String listA;
	private String timeMix;
	private String timeMax;
	
	
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	public T getT() {
		return t;
	}
	public void setT(T t) {
		this.t = t;
	}
	public String getStu_name() {
		return stu_name;
	}
	public void setStu_name(String stu_name) {
		this.stu_name = stu_name;
	}
	public String getT_visitTime() {
		return t_visitTime;
	}
	public void setT_visitTime(String t_visitTime) {
		this.t_visitTime = t_visitTime;
	}
	public String getT_nextTraceTime() {
		return t_nextTraceTime;
	}
	public void setT_nextTraceTime(String t_nextTraceTime) {
		this.t_nextTraceTime = t_nextTraceTime;
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
	public String getListA() {
		return listA;
	}
	public void setListA(String listA) {
		this.listA = listA;
	}
	public String getTimeMix() {
		return timeMix;
	}
	public void setTimeMix(String timeMix) {
		this.timeMix = timeMix;
	}
	public String getTimeMax() {
		return timeMax;
	}
	public void setTimeMax(String timeMax) {
		this.timeMax = timeMax;
	}
	public Integer getOrderByTime() {
		return orderByTime;
	}
	public void setOrderByTime(Integer orderByTime) {
		this.orderByTime = orderByTime;
	}
	public String getY_lastLoginTime() {
		return y_lastLoginTime;
	}
	public void setY_lastLoginTime(String y_lastLoginTime) {
		this.y_lastLoginTime = y_lastLoginTime;
	}
	public String getY_createTime() {
		return y_createTime;
	}
	public void setY_createTime(String y_createTime) {
		this.y_createTime = y_createTime;
	}
	public Integer getYq_state() {
		return yq_state;
	}
	public void setYq_state(Integer yq_state) {
		this.yq_state = yq_state;
	}
	public String getMinTime() {
		return minTime;
	}
	public void setMinTime(String minTime) {
		this.minTime = minTime;
	}
	public String getMaxTime() {
		return maxTime;
	}
	public void setMaxTime(String maxTime) {
		this.maxTime = maxTime;
	}
	public String getR_name() {
		return r_name;
	}
	public void setR_name(String r_name) {
		this.r_name = r_name;
	}
	public String getY_name() {
		return y_name;
	}
	public void setY_name(String y_name) {
		this.y_name = y_name;
	}
	public String getY_createStartTime() {
		return y_createStartTime;
	}
	public void setY_createStartTime(String y_createStartTime) {
		this.y_createStartTime = y_createStartTime;
	}
	public String getY_createEndTime() {
		return y_createEndTime;
	}
	public void setY_createEndTime(String y_createEndTime) {
		this.y_createEndTime = y_createEndTime;
	}
	public Integer getY_isLockout() {
		return y_isLockout;
	}
	public void setY_isLockout(Integer y_isLockout) {
		this.y_isLockout = y_isLockout;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
	public List<T> getRows() {
		return rows;
	}
	public void setRows(List<T> rows) {
		this.rows = rows;
	}
	@Override
	public String toString() {
		return "Fenye [page=" + page + ", pageSize=" + pageSize + ", total=" + total + ", rows=" + rows + ", y_name="
				+ y_name + ", y_createStartTime=" + y_createStartTime + ", y_createEndTime=" + y_createEndTime
				+ ", y_isLockout=" + y_isLockout + "]";
	}
	
}
