package com.wxd.equipment.action;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.wxd.equipment.bean.Student;
import com.wxd.equipment.service.StudentService;
import com.wxd.equipment.service.UseRecordService;

/**
 * @类功能说明：学生的Action类
 * @作者：温晓东
 * @创建时间：2017年4月25日 上午9:45:20
 */
@Component(value = "studentAction")
@Scope(value = "prototype")
public class StudentAction extends ActionSupport implements ModelDriven<Student> {
	private Student student = new Student();
	private String captcha;
	private String newpwd;

	public void setCaptcha(String captcha) {
		this.captcha = captcha;
	}

	@Resource(name = "studentService")
	private StudentService studentService;

	@Override
	public Student getModel() {
		return student;
	}

	public String loginPage() {
		return LOGIN;
	}

	public String login() {
		Student existStudent = studentService.login(student);
		String checkcode = (String) ServletActionContext.getRequest().getSession().getAttribute("checkcode");
		if (captcha != null && !captcha.equalsIgnoreCase(checkcode)) {
			this.addActionError("验证码输入错误!");
			return LOGIN;
		}
		if (existStudent != null) {
			ServletActionContext.getRequest().getSession().setAttribute("student", existStudent);
			return "loginSuccess";
		}
		this.addActionError("登录失败：用户名或密码错误！");
		return LOGIN;
	}

	public String exit() {
		ServletActionContext.getRequest().getSession().invalidate();
		return "exit";
	}

	public void setNewpwd(String newpwd) {
		this.newpwd = newpwd;
	}
	
	public String changePwd(){
		Student nowstudent = (Student)ServletActionContext.getRequest().getSession().getAttribute("student");
		nowstudent.setPassword(newpwd);
		studentService.changePwd(nowstudent);
		ServletActionContext.getRequest().getSession().invalidate();
		return "exit";
	}

}
