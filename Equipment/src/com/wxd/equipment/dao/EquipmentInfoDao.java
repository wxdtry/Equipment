package com.wxd.equipment.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.wxd.equipment.bean.EquipmentInfo;

/**
 * @类功能说明：实验信息Dao类
 * @作者：温晓东
 * @创建时间：2017年5月7日 下午8:21:38
 */
@Repository(value = "equipmentInfoDao")
public class EquipmentInfoDao {

	@Resource(name = "hibernateTemplate")
	private HibernateTemplate hibernateTemplate;

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	public EquipmentInfo getEname(int eid) {
		String hql = "from EquipmentInfo where eid = ?";
		List<EquipmentInfo> list = (List<EquipmentInfo>) hibernateTemplate.find(hql, eid);
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

}
