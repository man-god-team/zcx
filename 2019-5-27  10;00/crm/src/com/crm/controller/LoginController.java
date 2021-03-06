package com.crm.controller;

import java.awt.image.RenderedImage;
import java.io.IOException;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.entity.Roles;
import com.crm.entity.Yonghu;
import com.crm.service.RolesService;
import com.crm.service.YonghuService;
import com.crm.util.CodeUtil;
import com.crm.util.MD5Util;

@Controller
public class LoginController {
	@RequestMapping(value=("/YonghuFile"))
	public String Yonghu() {
		return "YonghuFile";
	}
	@RequestMapping(value=("/RolesFile"))
	public String RolesFile() {
		return "RolesFile";
	} 
	@RequestMapping(value=("/ModelFile"))
	public String ModelFile() {
		return "ModelFile";
	}
	@RequestMapping(value=("/StudentFile"))
	public String StudentFile() {
		return "StudentFile";
	}
	@RequestMapping(value=("/YuanGQFile"))
	public String YuanGQFile() {
		return "YuanGQFile";
	}
	@RequestMapping(value=("/getXueshenghuifang"))
	public String getXueshenghuifang() {
		return "getXueshenghuifang";
	}
	@RequestMapping(value=("/getStudent"))
	public String getStudent() {
		return "getStudent";
	}
	@RequestMapping(value=("/LoginFile"))
	public String LoginFile() {
		return "LoginFile";
	}
	@RequestMapping(value=("/Mian"))
	public String Mian() {
		return "Mian";
	}
	@RequestMapping(value=("/FenliangFile"))
	public String FenliangFile() {
		return "FenliangFile";
	}
	
	
	
	@Autowired
	private YonghuService yonghuService;
	@Autowired
	private RolesService rolesService;
	
	
	@RequestMapping(value=("/login"),method = RequestMethod.POST)
	@ResponseBody
	public String login(HttpServletRequest request, HttpServletResponse response,String  code,
			 String password ,String name) { 

	  
        String sessionCode = request.getSession().getAttribute("code").toString();
        
        if (code != null && !"".equals(code) && sessionCode != null && !"".equals(sessionCode)) {
            if (code.equalsIgnoreCase(sessionCode)) {
            	if(name !=null && !"".equals(name)) {
            		Yonghu yonghu=new Yonghu();
            		yonghu.setY_name(name);
            		Yonghu yh = yonghuService.selectYonghuByY_name(yonghu);
            		 
            		if(yh.getY_password().equals(MD5Util.string2MD5(password))) {
            			if(yh.getY_isLockout()==2) {
            				HttpSession session = request.getSession(true);
            				
//            				查询该用户是否为管理员或者，咨询师经理职位
						  Integer roles = rolesService.selectRolesByY_id(yh);
							  session.setAttribute("rolesInt", roles);
							 
            				session.setAttribute("yonghu", yh);
            				
            				return "登录成功";
            			}else {
            				 return "亲，你的账号被锁定了！";
            			}
            			
            		}else {
            			int i=0;
            			 i=yh.getY_pasdWrongShu()+1;
            			 yh.setY_pasdWrongShu(i);
            			 yonghuService.updateYonghujiesoByisLockout(yh);
            			  
            			if(i>3) {
            				yh.setY_pasdWrongShu(i);
            				yh.setY_isLockout(1);
            			yonghuService.updateYonghujiesoByisLockout(yh);
            				return "密码错误三次，账户锁定";
            			}
            			 return "密码错误！";
            		}
            		
            	}else {
            		return "用户名不存在";
            	}
               
            } else {
            	return "验证码错误！";
            }
        } else {
            return "请输入验证码！";
        }
	}
	
	
	@RequestMapping(value=("/getCode"),method = RequestMethod.GET)
	@ResponseBody
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 调用工具类生成的验证码和验证码图片
        Map<String, Object> codeMap = CodeUtil.generateCodeAndPic();

        // 将四位数字的验证码保存到Session中。
        HttpSession session = req.getSession();
        session.setAttribute("code", codeMap.get("code").toString());

        // 禁止图像缓存。
        resp.setHeader("Pragma", "no-cache");
        resp.setHeader("Cache-Control", "no-cache");
        resp.setDateHeader("Expires", -1);

        resp.setContentType("image/jpeg");

        // 将图像输出到Servlet输出流中。
        ServletOutputStream sos;
        try {
            sos = resp.getOutputStream();
            ImageIO.write((RenderedImage) codeMap.get("codePic"), "jpeg", sos);
            sos.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }
	

}
