package org.xiaojl.workflow.service;

import java.util.List;

import org.xiaojl.core.model.result.PageInfo;
import org.xiaojl.workflow.model.ProcessType;

public interface ProcessTypeService {

	void selectDataGrid(PageInfo pi);

	void insertProcessType(ProcessType pt);

	void updateProcessType(ProcessType pt);

	void deleteByIds(String ids);

	List<ProcessType> selectComboboxData();

}
