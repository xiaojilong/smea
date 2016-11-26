package org.xiaojl.core.service;

import org.xiaojl.core.model.SysLog;
import org.xiaojl.core.model.result.PageInfo;

public interface SysLogService {

	void selectAll(PageInfo pi);

	void insert(SysLog sysLog);

}
