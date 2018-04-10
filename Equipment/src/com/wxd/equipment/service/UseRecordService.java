package com.wxd.equipment.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wxd.equipment.bean.UseRecord;
import com.wxd.equipment.dao.UseRecordDao;
import com.wxd.equipment.utils.PageBean;

/**
 * @类功能说明：使用记录service
 * @作者：温晓东
 * @创建时间：2017年5月5日 上午9:17:08
 */
@Transactional
@Service(value = "useRecordService")
public class UseRecordService {
	@Resource(name = "useRecordDao")
	private UseRecordDao useRecordDao;

	public void addRecord(UseRecord useRecord) {
		useRecordDao.add(useRecord);
	}

	public PageBean<UseRecord> getMyRecord(String sid, int page) {
		// 获取总记录数
		int totalCount = useRecordDao.countMyRecord(sid);
		// 创建分页对象
		PageBean<UseRecord> pageBean = new PageBean<UseRecord>(page, totalCount, 8);

		List<UseRecord> list = useRecordDao.getMyRecord(sid, pageBean.getBegin(), pageBean.getLimit());
		pageBean.setList(list);
		return pageBean;
	}

}
