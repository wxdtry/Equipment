package com.wxd.equipment.bean;

import java.util.Date;

/**
 * @类功能说明：维修记录实体类
 * @作者：温晓东
 * @创建时间：2017年4月24日 下午2:21:40
 */
public class RepairRecord {

	private int rid;// 维修记录ID
	private String reason;// 维修原因
	private Date rdate;// 维修时间
	private String person; // 维修人
	private EquipmentInfo equipmentInfo;// 实验仪器

	public int getRid() {
		return rid;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public Date getRdate() {
		return rdate;
	}

	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}

	public String getPerson() {
		return person;
	}

	public void setPerson(String person) {
		this.person = person;
	}

	public EquipmentInfo getEquipmentInfo() {
		return equipmentInfo;
	}

	public void setEquipmentInfo(EquipmentInfo equipmentInfo) {
		this.equipmentInfo = equipmentInfo;
	}

}
