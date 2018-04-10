package com.wxd.equipment.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wxd.equipment.bean.EquipmentInfo;
import com.wxd.equipment.dao.EquipmentInfoDao;

@Transactional
@Service(value = "equipmentInfoService")
public class EquipmentInfoService {
	@Resource(name = "equipmentInfoDao")
	private EquipmentInfoDao equipmentInfoDao;

	public void setEquipmentInfoDao(EquipmentInfoDao equipmentInfoDao) {
		this.equipmentInfoDao = equipmentInfoDao;
	}

	public EquipmentInfo getEname(int eid) {
		return equipmentInfoDao.getEname(eid);
	}
	
	

}
