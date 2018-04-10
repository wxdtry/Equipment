package com.wxd.equipment.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.wxd.equipment.bean.Student;
import com.wxd.equipment.bean.UseRecord;
import com.wxd.equipment.service.UseRecordService;
import com.wxd.equipment.utils.PageBean;

/**
 * @类功能说明：使用记录action
 * @作者：温晓东
 * @创建时间：2017年5月5日 上午9:16:43
 */
@Component(value = "useRecordAction")
@Scope(value = "prototype")
public class UseRecordAction extends ActionSupport implements ModelDriven<UseRecord> {
	// 接收当前页数:
	private int page;

	public void setPage(int page) {
		this.page = page;
	}

	@Resource(name = "useRecordService")
	private UseRecordService useRecordService;

	private UseRecord useRecord = new UseRecord();

	@Override
	public UseRecord getModel() {
		return useRecord;
	}

	// 添加使用记录
	public String addRecord() {
		System.out.println(useRecord.getStart() + "-----------" + useRecord.getEnd());
		useRecordService.addRecord(useRecord);
		return "addRecord";
	}

	// 查询我的记录
	public String getMyRecord() {
		Student student = (Student) ServletActionContext.getRequest().getSession().getAttribute("student");
		PageBean<UseRecord> pageBean = useRecordService.getMyRecord(student.getSid(), page);
		// 将结果存入值栈中
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "getMyRecord";
	}

	// 跳转到添加记录页
	public String addRecordPage() {
		return "addRecordPage";
	}

}
