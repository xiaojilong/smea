package org.xiaojl.oa.listener;

import org.activiti.engine.delegate.DelegateTask;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.xiaojl.workflow.listener.BaseTaskListener;

/**
 * 请假流程人员选择处理类
 */
public class LeaveTaskListener extends BaseTaskListener {
	private Log log = LogFactory.getLog(this.getClass());
	private static final long serialVersionUID = 7727136742087256682L;

	@Override
	public void notify(DelegateTask delegateTask) {
		log.debug("----LeaveBillTaskListener notify method !----");
		
		String assigneeUser = (String) delegateTask.getVariable("nextAssignee");
		String spzt = (String) delegateTask.getVariable("spzt");
		
		log.debug("==="+assigneeUser+","+spzt);
		
		delegateTask.setAssignee(assigneeUser);
	}
	
}
