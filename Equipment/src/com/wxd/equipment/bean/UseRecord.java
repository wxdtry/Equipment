package com.wxd.equipment.bean;

import java.util.Date;

/**
 * @类功能说明：实验仪器使用记录实体类
 * @作者：温晓东
 * @创建时间：2017年4月24日 下午2:03:18
 */
public class UseRecord {

	private int uid;// 记录ID
	private Date start;// 开始时间
	private Date end;// 结束时间
	private int status;// 仪器运行情况  1表示正常  0表示不正常
	private String description;// 如果不正常具体描述
	private EquipmentInfo equipmentInfo;// 仪器
	private Student student;// 使用人

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public Date getStart() {
		return start;
	}

	public void setStart(Date start) {
		this.start = start;
	}

	public Date getEnd() {
		return end;
	}

	public void setEnd(Date end) {
		this.end = end;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public EquipmentInfo getEquipmentInfo() {
		return equipmentInfo;
	}

	public void setEquipmentInfo(EquipmentInfo equipmentInfo) {
		this.equipmentInfo = equipmentInfo;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

}
