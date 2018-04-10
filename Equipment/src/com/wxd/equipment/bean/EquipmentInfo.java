package com.wxd.equipment.bean;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * @类功能说明：实验仪器信息实体类
 * @作者：温晓东
 * @创建时间：2017年4月24日 下午1:44:26
 */
public class EquipmentInfo {

	private int eid;// 实验仪器ID
	private String ename;// 实验仪器名称
	private Date buydate;// 买入时间
	private String site;// 仪器所在地点
	private int status; // 仪器状态 0表示停用 1表示正常
	private Academy academy; // 所在学院
	private Set<UseRecord> uset = new HashSet<UseRecord>();// 使用记录
	private Set<RepairRecord> rset = new HashSet<RepairRecord>();// 维修记录
	public int getEid() {
		return eid;
	}
	public void setEid(int eid) {
		this.eid = eid;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public Date getBuydate() {
		return buydate;
	}
	public void setBuydate(Date buydate) {
		this.buydate = buydate;
	}
	public String getSite() {
		return site;
	}
	public void setSite(String site) {
		this.site = site;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Academy getAcademy() {
		return academy;
	}
	public void setAcademy(Academy academy) {
		this.academy = academy;
	}
	public Set<UseRecord> getUset() {
		return uset;
	}
	public void setUset(Set<UseRecord> uset) {
		this.uset = uset;
	}
	public Set<RepairRecord> getRset() {
		return rset;
	}
	public void setRset(Set<RepairRecord> rset) {
		this.rset = rset;
	}

	
}
