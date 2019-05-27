package com.crm.service;

import java.util.List;

import com.crm.entity.Fenye;
import com.crm.entity.Student;


public interface StudentService {
	Student selectOneByOrderBy();
	 
 
	Fenye<Student> selectStudent(Fenye<Student> fenye);
	
	Integer addStudent(Student student);
	
	Integer updateStudent(Student student);
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
