package com.crm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.dao.StudentMapper;
import com.crm.entity.Fenye;
import com.crm.entity.Student;
@Service
public class StudentServiceImp implements StudentService {
 
	@Autowired
	private StudentMapper studentMapper;
	@Override
	public Fenye<Student> selectStudent(Fenye<Student> fenye) {
		// TODO Auto-generated method stub
		List<Student> selectAll = studentMapper.selectAll(fenye);
		Integer selectStudentCount = studentMapper.selectStudentCount(fenye);
		fenye.setTotal(selectStudentCount);
		fenye.setRows(selectAll);
		return fenye;
	}
	@Override
	public Integer addStudent(Student student) {
		// TODO Auto-generated method stub
		return studentMapper.add(student);
	}
	public Integer updateStudent(Student student) {
		// TODO Auto-generated method stub
		return studentMapper.update(student);
	}
	
	@Override
	public Integer selectCount(Fenye<Student> fenye) {
		// TODO Auto-generated method stub
		return studentMapper.selectCount(fenye);
	}

	@Override
	public List<Student> selectAllStudent(Fenye<Student> fenye) {
		// TODO Auto-generated method stub
		System.out.println(fenye);
		return studentMapper.selectAllStudent(fenye);
	}

	@Override
	public Integer updataStudentByid(Student student) {
		// TODO Auto-generated method stub
		return studentMapper.updataStudentByid(student);
	}

	@Override
	public Integer deleteStudent(Integer stu_id) {
		// TODO Auto-generated method stub
		return studentMapper.deleteStudent(stu_id);
	}
	 


}
