package com.wxd.equipment.dao;

import javax.annotation.Resource;

import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;


/**
 * @类功能说明：学院持久层
 * @作者：温晓东
 * @创建时间：2017年4月27日 上午10:00:43
 */
@Repository(value = "academyDao")
public class AcademyDao {
	@Resource(name = "hibernateTemplate")
	private HibernateTemplate hibernateTemplate;

	/*public Academy findBySid(Student student) {
		String hql = "select a from Academy a join ";
		return null;
	}*/
}
