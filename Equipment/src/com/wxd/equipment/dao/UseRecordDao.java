package com.wxd.equipment.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.wxd.equipment.bean.UseRecord;
import com.wxd.equipment.utils.PageHibernateCallback;

/**
 * @类功能说明：使用记录dao
 * @作者：温晓东
 * @创建时间：2017年5月5日 上午9:16:02
 */
@Repository(value = "useRecordDao")
public class UseRecordDao {

	@Resource(name = "hibernateTemplate")
	private HibernateTemplate hibernateTemplate;

	public void add(UseRecord useRecord) {
		hibernateTemplate.save(useRecord);
	}

	public int countMyRecord(String sid) {
		String hql = "select count(1) from UseRecord u where u.student.sid = ?";
		List<Long> list = (List<Long>) hibernateTemplate.find(hql, sid);
		if (list != null && list.size() > 0) {
			return list.get(0).intValue();
		}
		return 0;
	}

	// 分页获取使用记录List
	public List<UseRecord> getMyRecord(String sid, int begin, int limit) {
		String hql = "select u from UseRecord u join u.student s where s.sid = ?";
		List<UseRecord> list = (List<UseRecord>) hibernateTemplate
				.execute(new PageHibernateCallback<UseRecord>(hql, new Object[] { sid }, begin, limit));
		if (list != null && list.size() > 0) {
			return list;
		}
		return null;
	}

}
