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
	 * ��ҳ��������ѯ��ʾ
	 * @param fenye
	 * @return
	 */
	Integer selectCount(Fenye<Student> fenye);
	/**
	 * ��ҳ��������ѯ��ʾ
	 * @return
	 */
	List<Student> selectAllStudent(Fenye<Student> fenye);
	/**
	 * ����ID�޸�ѧ����Ϣ
	 * @param student
	 * @return
	 */
	Integer updataStudentByid(Student student);
	/**
	 * ����IDɾ��ѧ����Ϣ
	 * @param id
	 * @return
	 */
	Integer deleteStudent(Integer stu_id);
	 
	
}
