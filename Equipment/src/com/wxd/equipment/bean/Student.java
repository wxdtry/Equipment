package com.wxd.equipment.bean;

import java.util.HashSet;
import java.util.Set;

/**
 * @类功能说明：学生实体类
 * @作者：温晓东
 * @创建时间：2017年4月24日 下午1:34:05
 */
public class Student {

	private String sid;// 学号
	private String name;// 姓名
	private String password;// 密码
	private ClassInfo classInfo;// 班级
	private Set<UseRecord> uset = new HashSet<UseRecord>();

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public ClassInfo getClassInfo() {
		return classInfo;
	}

	public void setClassInfo(ClassInfo classInfo) {
		this.classInfo = classInfo;
	}

	public Set<UseRecord> getUset() {
		return uset;
	}

	public void setUset(Set<UseRecord> uset) {
		this.uset = uset;
	}

}
