package com.wxd.equipment.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wxd.equipment.bean.Student;
import com.wxd.equipment.dao.StudentDao;

/**
 * @类功能说明：学生的Service类
 * @作者：温晓东
 * @创建时间：2017年4月25日 上午9:44:52
 */
@Transactional
@Service(value = "studentService")
public class StudentService {
	@Resource(name = "studentDao")
	private StudentDao studentDao;

	public Student login(Student student) {
		return studentDao.login(student);
	}

	public void changePwd(Student student) {
		studentDao.changePwd(student);
	}

}
