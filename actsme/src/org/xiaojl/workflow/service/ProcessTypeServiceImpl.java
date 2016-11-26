package org.xiaojl.workflow.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.xiaojl.core.model.result.PageInfo;
import org.xiaojl.workflow.dao.ProcessTypeDao;
import org.xiaojl.workflow.model.ProcessType;

import com.baomidou.mybatisplus.plugins.Page;

@Service
public class ProcessTypeServiceImpl implements ProcessTypeService {
	
	@Autowired
	private ProcessTypeDao processTypeDao;

	@Override
	public void selectDataGrid(PageInfo pi) {
		Page<ProcessType> page = new Page<ProcessType>(pi.getFrom(),pi.getSize(),pi.getSort());
		
		List<ProcessType> list = processTypeDao.selectProcessTypeList(page,pi.getCondition());
		
		pi.setRows(list);
		pi.setTotal(page.getTotal());
	}

	@Override
	public void insertProcessType(ProcessType pt) {
		processTypeDao.insert(pt);
	}

	@Override
	public void updateProcessType(ProcessType pt) {
		processTypeDao.updateById(pt);
	}

	@Override
	public void deleteByIds(String ids) {
		List<Long> idList = new ArrayList<Long>();
		if(ids.indexOf(",")>-1){
			String [] idarr = ids.split(",");
			for(int i=0;idarr!=null && i<idarr.length;i++){
				idList.add(Long.valueOf(idarr[i]));
			}
		}else{
			idList.add(Long.valueOf(ids));
		}
		
		processTypeDao.deleteBatchIds(idList);
	}

	@Override
	public List<ProcessType> selectComboboxData() {
		return processTypeDao.selectComboboxData();
	}

}
