package com.wxd.equipment.interceptor;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;
import com.wxd.equipment.bean.Student;

/**
 * @类功能说明：权限拦截器:
 * @作者：温晓东
 * @创建时间：2017年5月7日 上午11:46:45
 */
public class PrivilegeInterceptor extends MethodFilterInterceptor {

	@Override
	protected String doIntercept(ActionInvocation actionInvocation) throws Exception {
		// 判断是否登录,如果登录,放行,没有登录,跳转到登录页面.
		Student student = (Student) ServletActionContext.getRequest().getSession().getAttribute("existAdminUser");
		if (student != null) {
			// 已经登录过
			return actionInvocation.invoke();
		} else {
			// 跳转到登录页面:
			ActionSupport support = (ActionSupport) actionInvocation.getAction();
			support.addActionError("您还没有登录!没有权限访问!");
			return ActionSupport.LOGIN;
		}
	}

}
