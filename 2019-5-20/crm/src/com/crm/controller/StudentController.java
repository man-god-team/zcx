package com.crm.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.entity.Fenye;
import com.crm.entity.Roles;
import com.crm.entity.Student;
import com.crm.entity.Yonghu;
import com.crm.entity.Zidongfenpei;
import com.crm.service.StudentService;
import com.crm.service.YonghuService;
import com.crm.service.ZidongfenpeiService;
import com.crm.util.QuanZhongFenPei;

@Controller
public class StudentController {
  
	@Autowired
	private StudentService studentService;
	@Autowired
	private YonghuService yonghuService;
	@Autowired
	private ZidongfenpeiService zidongfenpeiServiceImp;
	
	
	@RequestMapping(value="/selectAllByZidongfenpei",method=RequestMethod.POST)
	@ResponseBody
	public String selectAllByZidongfenpei(){
		 
		Zidongfenpei selectAllByZidongfenpei2 = zidongfenpeiServiceImp.selectAllByZidongfenpei();
		return selectAllByZidongfenpei2.getFenpeizhuangtai();
	}
	
	
//	学生添加之后自动分配
	@RequestMapping(value="/updateStudentByzidongfenpei",method=RequestMethod.POST)
	@ResponseBody
	public Integer updateStudentByzidongfenpei(HttpSession session){
		Student student=new Student();
		Integer  stu_id=(Integer)session.getAttribute("addStu_id");
		Yonghu yonghu=new Yonghu();
		yonghu.setR_name("咨询师");
		List<Yonghu> selectYonghuAllBynone = yonghuService.selectYonghuAllBynone(yonghu);
		 
		
		System.out.println(selectYonghuAllBynone);
		
		QuanZhongFenPei quanZhongFenPei=new QuanZhongFenPei();
		Yonghu yonghu2 = quanZhongFenPei.fenpei(selectYonghuAllBynone);
		System.out.println("c");
		yonghu2.getY_id();
		student.setY_id(yonghu2.getY_id());
		student.setStu_id(stu_id);
		System.out.println(2);
		System.out.println(student);
		return studentService.updateStudent(student);
		
	}
//	学生自动分配
	@RequestMapping(value="/updateZidongfenpei1",method=RequestMethod.POST)
	@ResponseBody
	public Integer updateZidongfenpei1(Zidongfenpei zidongfenpei){
		System.out.println(1);
		return zidongfenpeiServiceImp.updateZidongfenpei(zidongfenpei);
		
	}
//	学生分配
	 @RequestMapping(value="/UpdateStudentByFP",method=RequestMethod.POST)
	    @ResponseBody
	    public Integer UpdateStudentByFP(Student student){
	    	System.out.println(student);
			return studentService.updateStudent(student);
	    	
	    }
	 
	@RequestMapping(value="/selectAllByfenpei",method=RequestMethod.POST)
	@ResponseBody
	public Fenye<Student> selectAllByfenpei(Integer page, Integer rows) {
	Fenye<Student> fenye=new Fenye<Student>(); 
		fenye.setPage((page-1)*rows);
		fenye.setPageSize(rows);
		List<Student> selectAllByfenpei = yonghuService.selectAllByfenpei(fenye);
		Integer selectStudentCount = yonghuService.selectStudentCount(fenye);
		fenye.setTotal(selectStudentCount);
		fenye.setRows(selectAllByfenpei);
		return fenye;
	}
	@RequestMapping(value="/selectYonghuByR_id",method=RequestMethod.POST)
	@ResponseBody
	public List<Yonghu> selectYonghuByR_id() {
		Yonghu yonghu =new Yonghu();
		return yonghuService.selectYonghuByR_id(yonghu);
	}
	
	@RequestMapping(value="/selectStudent",method=RequestMethod.POST)
	@ResponseBody
	public Fenye<Student> selectStudent(HttpSession session,Student student, Integer page, Integer rows) {
		Fenye<Student> fenye=new Fenye<Student>();
		
		Roles roles =(Roles) session.getAttribute("roles");
		Yonghu yonghu=(Yonghu)session.getAttribute("yonghu");
		if(roles !=null ) {
			fenye.setR_name(roles.getR_name());
		}
		if(yonghu !=null) {
			student.setY_id(yonghu.getY_id());
		}
		
//		System.out.println(roles.getR_name()+yonghu.getY_id()+"----123sadf");
		
		
		fenye.setStudent(student);
		fenye.setPage((page-1)*rows);
		fenye.setPageSize(rows);
		fenye=studentService.selectStudent(fenye);
		return fenye;
		
	}
	
	 @RequestMapping(value="/updateStudent",method=RequestMethod.POST)
	    @ResponseBody
	    public Integer updateStudent(Student student){
	    	
			return studentService.updateStudent(student);
	    	
	    }
	 @RequestMapping(value="/deleteStudent",method=RequestMethod.POST)
	    @ResponseBody
	    public Integer deleteStudent(Integer stu_id){
	    	
			return studentService.deleteStudent(stu_id);
	    	
	    }

	/*
	 * @RequestMapping(value="/selectStudent",method=RequestMethod.POST)
	 * 
	 * @ResponseBody public Fenye<Student> selectStudent(Integer page, Integer rows)
	 * { Fenye<Student> fenye=new Fenye<Student>(); fenye.setPage((page-1)*rows);
	 * fenye.setPageSize(rows); fenye=studentService.selectStudent(fenye); return
	 * fenye;
	 * 
	 * }
	 */
	 @RequestMapping(value="/addStudent",method=RequestMethod.POST)
	    @ResponseBody
	    public Integer addStudent(HttpSession seeSession,Student student){
	    	
	    	seeSession.setAttribute("addStu_id", student.getStu_id());
			return studentService.addStudent(student);
	    	
	    }
 
		
//		
		@RequestMapping(value = "/getALL", method = RequestMethod.POST)
		@ResponseBody
		public Fenye<Student> getALL(Integer page, Integer rows, Student student,
				String listA, String timeMax, String timeMix) {
			Fenye<Student> fenye=new Fenye<Student>();
			fenye.setPage((page - 1) * rows);
			fenye.setPageSize(rows);
			fenye.setT(student);
			fenye.setTimeMax(timeMax);
			fenye.setTimeMix(timeMix);
			fenye.setListA(listA);
			
			Integer selectCount = studentService.selectCount(fenye);
			List<Student> selectAllStudent = studentService.selectAllStudent(fenye);
			
			fenye.setTotal(selectCount);
			fenye.setRows(selectAllStudent);
			return fenye;
		}

		@RequestMapping(value = "/updateA", method = RequestMethod.POST)
		@ResponseBody
		public Integer updateA(Student student) {
			Fenye<Student> fenye=new Fenye<Student>();
			System.out.println(5566);
			fenye.setT(student);
			Integer updataStudentByid = studentService.updataStudentByid(student);
			System.out.println(updataStudentByid);
			return updataStudentByid;
		}

		@RequestMapping(value = "/detelteA", method = RequestMethod.POST)
		@ResponseBody
		public Integer detelteA(Integer stu_id) {
			
			Integer deleteStudent = studentService.deleteStudent(stu_id);

			return deleteStudent;
		}
}
