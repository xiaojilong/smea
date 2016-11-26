package org.xiaojl.workflow.dao;

import java.util.List;
import java.util.Map;

import org.xiaojl.workflow.model.ProcessType;

import com.baomidou.mybatisplus.mapper.AutoMapper;
import com.baomidou.mybatisplus.plugins.Page;

public interface ProcessTypeDao extends AutoMapper<ProcessType> {

	List<ProcessType> selectProcessTypeList(Page<ProcessType> page,
			Map<String, Object> condition);

	List<ProcessType> selectComboboxData();

}
