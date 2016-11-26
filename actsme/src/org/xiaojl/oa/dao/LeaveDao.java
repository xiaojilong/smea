package org.xiaojl.oa.dao;

import java.util.List;
import java.util.Map;

import org.xiaojl.oa.model.LeaveBill;
import org.xiaojl.oa.model.LeaveBillTaskVO;

import com.baomidou.mybatisplus.mapper.AutoMapper;
import com.baomidou.mybatisplus.plugins.Page;

public interface LeaveDao extends AutoMapper<LeaveBill> {

	List<LeaveBill> selectLeaveList(Page<LeaveBill> page,Map<String, Object> condition);

	List<LeaveBillTaskVO> selectPersionTaskList(Page<LeaveBillTaskVO> page,Map<String, Object> condition);

}
