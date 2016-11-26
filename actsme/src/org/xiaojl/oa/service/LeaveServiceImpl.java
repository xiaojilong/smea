package org.xiaojl.oa.service;

import java.util.List;

import org.activiti.engine.TaskService;
import org.activiti.engine.runtime.ProcessInstance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.xiaojl.core.model.result.PageInfo;
import org.xiaojl.core.model.result.SessionUser;
import org.xiaojl.oa.dao.LeaveDao;
import org.xiaojl.oa.model.LeaveBill;
import org.xiaojl.oa.model.LeaveBillTaskVO;
import org.xiaojl.workflow.service.WorkflowService;

import com.baomidou.mybatisplus.plugins.Page;

@Service
public class LeaveServiceImpl implements LeaveService {

	@Autowired
	private LeaveDao leaveDao;
	@Autowired
	private WorkflowService workflowService;
	@Autowired
	private TaskService taskService;
	
	public void selectDataGrid(PageInfo pi) {
		Page<LeaveBill> page = new Page<LeaveBill>(pi.getNowpage(),pi.getSize());
		
		List<LeaveBill> list = leaveDao.selectLeaveList(page,pi.getCondition());
		
		pi.setRows(list);
		pi.setTotal(page.getTotal());
	}

	public void insertLeaveBill(LeaveBill leaveBill) {
		leaveDao.insert(leaveBill);
	}
	
	/**
	 * 启动流程审批
	 */
	public void insertStartWorkflow(Long leaveBillId, SessionUser suser) {
		//查询请假单
		LeaveBill leaveBill = leaveDao.selectById(leaveBillId);
		//使用当前对象获取到流程定义的key（对象的名称就是流程定义的key）
		String key = leaveBill.getClass().getSimpleName();
		//格式：LeaveBill.id的形式（使用流程变量）
		String businessKey = key+"."+leaveBillId ;
		
		ProcessInstance pi = workflowService.insertStartWorkflowByKey(key,businessKey,suser);
		
		// 请假单状态 0.保存,1.开始审批,2为审批通过，3审批不通过
		leaveBill.setStatus(1);
		leaveBill.setProcessInstanceId(pi.getId());
		leaveDao.updateById(leaveBill);
	}

	@Override
	public LeaveBill selectLeaveBillById(Long id) {
		return leaveDao.selectById(id);
	}

	@Override
	public void selectProcessTaskDataGrid(PageInfo pi) {
		Page<LeaveBillTaskVO> page = new Page<LeaveBillTaskVO>(pi.getFrom(),pi.getSize(),pi.getSort());
		List<LeaveBillTaskVO> list = leaveDao.selectPersionTaskList(page,pi.getCondition());
		
		pi.setRows(list);
		pi.setTotal(page.getTotal());
//		String processDefKey = "LeaveBill";
//		List<Task> list = taskService.createTaskQuery().processDefinitionKey(processDefKey)
//										.taskAssignee(assignee)
//										.list();
//		for(int i=0;list!=null && i<list.size();i++){
//			Task t = list.get(i);
//			String proceseInstanceId = t.getProcessInstanceId();
//			
//		}
		//workflowService.selectPersonTaskListByProcessDefKey(processDefKey);
	}


}
