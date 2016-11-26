package org.xiaojl.core.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.xiaojl.core.dao.SysLogDao;
import org.xiaojl.core.model.SysLog;
import org.xiaojl.core.model.result.PageInfo;

import com.baomidou.mybatisplus.plugins.Page;

@Service
public class SysLogServiceImpl implements SysLogService {
	
	@Autowired
	private SysLogDao sysLogDao;
	
	public void selectAll(PageInfo pi) {
		Page<SysLog> page = new Page<SysLog>(pi.getNowpage(),pi.getSize(),pi.getOrder());
		List<SysLog> lists = sysLogDao.selectSysLogList(page,pi.getCondition());
		
		pi.setRows(lists);
		pi.setTotal(page.getTotal());
	}

	public void insert(SysLog sysLog) {
		sysLogDao.insert(sysLog);
	}

}
