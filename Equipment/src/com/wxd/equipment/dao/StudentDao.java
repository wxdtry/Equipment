package com.wxd.equipment.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.wxd.equipment.bean.Student;

/**
 * @类功能说明：学生Dao类
 * @作者：温晓东
 * @创建时间：2017年4月25日 上午9:44:12
 */
@Repository(value = "studentDao")
public class StudentDao {

	@Resource(name = "hibernateTemplate")
	private HibernateTemplate hibernateTemplate;

	public Student login(Student student) {
		String hql = "from Student where sid = ? and password = ?";
		List<Student> list = (List<Student>) hibernateTemplate.find(hql, student.getSid(), student.getPassword());
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	public void changePwd(Student student) {
		hibernateTemplate.update(student);
	}

}
