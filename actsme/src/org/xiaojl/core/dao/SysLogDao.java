package org.xiaojl.core.dao;

import java.util.List;
import java.util.Map;

import org.xiaojl.core.model.SysLog;

import com.baomidou.mybatisplus.mapper.AutoMapper;
import com.baomidou.mybatisplus.plugins.Page;

public interface SysLogDao extends AutoMapper<SysLog> {

	List<SysLog> selectSysLogList(Page<SysLog> page, Map<String, Object> condition);

}
