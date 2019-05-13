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
