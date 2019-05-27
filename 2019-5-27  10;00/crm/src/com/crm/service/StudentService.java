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
