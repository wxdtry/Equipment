package com.wxd.equipment.bean;

import java.util.HashSet;
import java.util.Set;

/**
 * @类功能说明：学院实体类
 * @作者：温晓东
 * @创建时间：2017年4月24日 下午1:37:01
 */
public class Academy {

	private int aid;// 学院ID
	private String aname;// 学院名称
	private Set<ClassInfo> cset = new HashSet<ClassInfo>();// 班级
	private Set<EquipmentInfo> eset = new HashSet<EquipmentInfo>();// 实验仪器

	public int getAid() {
		return aid;
	}

	public void setAid(int aid) {
		this.aid = aid;
	}

	public String getAname() {
		return aname;
	}

	public void setAname(String aname) {
		this.aname = aname;
	}

	public Set<ClassInfo> getCset() {
		return cset;
	}

	public void setCset(Set<ClassInfo> cset) {
		this.cset = cset;
	}

	public Set<EquipmentInfo> getEset() {
		return eset;
	}

	public void setEset(Set<EquipmentInfo> eset) {
		this.eset = eset;
	}

}
