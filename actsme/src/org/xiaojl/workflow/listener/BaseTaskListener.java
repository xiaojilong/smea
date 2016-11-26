package org.xiaojl.workflow.listener;

import javax.annotation.Resource;

import org.activiti.engine.FormService;
import org.activiti.engine.HistoryService;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.delegate.DelegateTask;
import org.activiti.engine.delegate.TaskListener;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public abstract class BaseTaskListener implements TaskListener {
	private Log log = LogFactory.getLog(this.getClass());
	private static final long serialVersionUID = 1L;
	
	@Resource(name="repositoryService")
	protected RepositoryService repositoryService;
	@Resource(name="runtimeService")
	protected RuntimeService runtimeService;
	@Resource(name="taskService")
	protected TaskService taskService;
	@Resource(name="historyService")
	protected HistoryService historyService;
	@Resource(name="formService")
	protected FormService formService;
	
	public void notify(DelegateTask arg0){
		log.debug("----BaseTaskListener notify method !----");
	}


}
