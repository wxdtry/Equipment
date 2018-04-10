package com.wxd.equipment.action;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.wxd.equipment.bean.EquipmentInfo;
import com.wxd.equipment.service.EquipmentInfoService;

/**
 * @类功能说明：实验仪器信息Action
 * @作者：温晓东
 * @创建时间：2017年5月7日 下午8:23:36
 */
@Component(value = "equipmentInfoAction")
@Scope(value = "prototype")
public class EquipmentInfoAction extends ActionSupport implements ModelDriven<EquipmentInfo> {

	private EquipmentInfo equipmentInfo = new EquipmentInfo();
	@Resource(name = "equipmentInfoService")
	private EquipmentInfoService equipmentInfoService;

	public void setEquipmentInfoService(EquipmentInfoService equipmentInfoService) {
		this.equipmentInfoService = equipmentInfoService;
	}

	public String getEname() throws IOException {
		EquipmentInfo getInfo = equipmentInfoService.getEname(equipmentInfo.getEid());
		// 获得response对象,项页面输出:
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		if (getInfo != null) {
			response.getWriter().println(getInfo.getEname());
		}
		return NONE;
	}

	@Override
	public EquipmentInfo getModel() {
		return equipmentInfo;
	}

}
