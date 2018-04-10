package com.wxd.equipment.utils;

import java.util.List;

/**
 * @类功能说明：分页类的封装
 * @作者：温晓东
 * @创建时间：2017年5月7日 上午10:11:09
 */
public class PageBean<T> {
	private int page; // 当前页数
	private int totalCount; // 总记录数
	private int totalPage; // 总页数
	private int limit; // 每页显示的记录数
	private int begin;// 从哪条记录开始查询
	private List<T> list; // 每页显示数据的集合.

	public PageBean(int page, int totalCount, int limit) {
		super();
		this.page = page;
		this.totalCount = totalCount;
		if (totalCount % limit == 0) {
			this.totalPage = totalCount / limit;
		} else {
			this.totalPage = totalCount / limit + 1;
		}
		this.limit = limit;
		this.setBegin((page - 1) * limit);
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}

	public int getBegin() {
		return begin;
	}

	public void setBegin(int begin) {
		this.begin = begin;
	}

}
