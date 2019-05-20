package com.crm.dao;

import java.util.List; 

import com.crm.entity.Fenye;
import com.crm.entity.Student;


public interface StudentMapper {

	
	List<Student> selectAll(Fenye<Student> fenye);
	
	Integer selectStudentCount(Fenye<Student> fenye);
	
	Integer add(Student student);
	
	
	
	Integer update(Student student);
	/*
	 * Integer del(Integer stu_id);
	 */
	
	/**
	 * 分页多条件查询显示
	 * @param fenye
	 * @return
	 */
	Integer selectCount(Fenye<Student> fenye);
	/**
	 * 分页多条件查询显示
	 * @return
	 */
	List<Student> selectAllStudent(Fenye<Student> fenye);
	/**
	 * 根据ID修改学生信息
	 * @param student
	 * @return
	 */
	Integer updataStudentByid(Student student);
	/**
	 * 根据ID删除学生信息
	 * @param id
	 * @return
	 */
	Integer deleteStudent(Integer stu_id);
	 
	
}
