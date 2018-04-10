package com.wxd.equipment.bean;

/**
 * @类功能说明：管理员实体类
 * @作者：温晓东
 * @创建时间：2017年4月24日 下午2:22:04
 */
public class Admin {
	private int aid;// 管理员ID
	private String aname;// 管理员用户名
	private String name;// 管理员姓名
	private String password;// 密码
	private String email;// 邮箱

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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
