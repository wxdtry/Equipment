package com.wxd.equipment.bean;

import java.util.HashSet;
import java.util.Set;

/**
 * @类功能说明：班级实体类
 * @作者：温晓东
 * @创建时间：2017年4月24日 下午1:33:42
 */
public class ClassInfo {

	private int cid;// 班级ID
	private String cname;// 班级名称
	private Academy academy;// 学院
	private Set<Student> sset = new HashSet<Student>();// 学生

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public Academy getAcademy() {
		return academy;
	}

	public void setAcademy(Academy academy) {
		this.academy = academy;
	}

	public Set<Student> getSset() {
		return sset;
	}

	public void setSset(Set<Student> sset) {
		this.sset = sset;
	}

}
