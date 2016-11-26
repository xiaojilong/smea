package org.xiaojl.workflow.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipInputStream;

import javax.annotation.Resource;

import org.activiti.engine.FormService;
import org.activiti.engine.HistoryService;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.history.HistoricTaskInstance;
import org.activiti.engine.impl.persistence.entity.ProcessDefinitionEntity;
import org.activiti.engine.impl.pvm.PvmTransition;
import org.activiti.engine.impl.pvm.process.ActivityImpl;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Comment;
import org.activiti.engine.task.Task;
import org.activiti.engine.task.TaskQuery;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.xiaojl.core.model.result.PageInfo;
import org.xiaojl.core.model.result.SessionUser;
import org.xiaojl.workflow.model.DeploymentVo;
import org.xiaojl.workflow.model.ProcessDefinitionVo;
import org.xiaojl.workflow.model.TaskVo;


@Service
public class WorkflowServiceImpl implements WorkflowService {
	private Log log = LogFactory.getLog(getClass());	
	
	@Resource(name="repositoryService")
	private RepositoryService repositoryService;
	@Resource(name="runtimeService")
	private RuntimeService runtimeService;
	@Resource(name="taskService")
	private TaskService taskService;
	@Resource(name="historyService")
	private HistoryService historyService;
	@Resource(name="formService")
	private FormService formService;

	
	/**
	 * 查询流程部署列表
	 */
	public void selectDeploymentList(PageInfo pageInfo) {
		int firstResult = pageInfo.getFrom();
		int maxResults = pageInfo.getSize() ;
		log.debug("firstResult="+firstResult+"  - maxResults"+maxResults);
		
		Long total = repositoryService.createDeploymentQuery().count();
		
		List<Deployment> list = repositoryService.createDeploymentQuery()//创建部署对象查询
								.orderByDeploymenTime().asc()//deploymentTime排序
								.listPage(firstResult, maxResults);
		
		List<DeploymentVo> lists = new ArrayList<DeploymentVo>(); 
		if(list!=null){
			for(Deployment d:list){
				DeploymentVo v = new DeploymentVo();
				v.setId(d.getId());
				v.setName(d.getName());
				v.setDeploymentTime(d.getDeploymentTime());
				v.setCategory(d.getCategory());
				v.setTenantId(d.getTenantId());
				lists.add(v);
			}
		}
		pageInfo.setRows(lists);
		pageInfo.setTotal(total.intValue());
	}

	/**
	 * 查询流程定义列表
	 */
	public void selectProcessDefinitionList(PageInfo pageInfo) {
		Long total = 0L;
		List<ProcessDefinition> list = null;
		Map<String,Object> params = pageInfo.getCondition();
		if(params!=null && !params.isEmpty()){
			String deploymentId = params.get("deploymentId")+"";
			int firstResult = pageInfo.getFrom();
			int maxResults = pageInfo.getSize() ;
			log.debug("firstResult="+firstResult+"  - maxResults="+maxResults);
			
			total = repositoryService.createProcessDefinitionQuery()
										  .deploymentId(deploymentId)
										  .count();
			
			list = repositoryService.createProcessDefinitionQuery()//创建流程定义对象查询
											.deploymentId(deploymentId)
											.orderByDeploymentId().asc()
											.listPage(firstResult, maxResults);
		}else{
			int firstResult = pageInfo.getFrom();
			int maxResults = pageInfo.getSize() ;
			log.debug("firstResult="+firstResult+"  - maxResults="+maxResults);
			
			total = repositoryService.createProcessDefinitionQuery().count();
			
			list = repositoryService.createProcessDefinitionQuery()//创建流程定义对象查询
											.orderByDeploymentId().asc()
											.listPage(firstResult, maxResults);
			
		}
		
		List<ProcessDefinitionVo> lists = new ArrayList<ProcessDefinitionVo>(); 
		if(list!=null){
			for(ProcessDefinition d:list){
				ProcessDefinitionVo v = new ProcessDefinitionVo();
				v.setId(d.getId());
				v.setName(d.getName());
				v.setKey(d.getKey());
				v.setVersion(d.getVersion());
				v.setResourceName(d.getResourceName());
				v.setDiagramResourceName(d.getDiagramResourceName());
				v.setDeploymentId(d.getDeploymentId());
				
				lists.add(v);
			}
		}
		
		pageInfo.setRows(lists);
		pageInfo.setTotal(total.intValue());
	}
	
	/**
	 * 部署流程
	 */
	public void insertDeployment(File file, String name) throws Exception {
		//2：将File类型的文件转化成ZipInputStream流
		ZipInputStream zipInputStream = new ZipInputStream(new FileInputStream(file));
		repositoryService.createDeployment()//创建部署对象
						.name(name)//添加部署名称
						.addZipInputStream(zipInputStream)//
						.deploy();//完成部署
	}
	
	/**
	 * 获取流程图的流
	 */
	public InputStream selectImageInputStream(String deploymentId,String diagramResourceName) {
		return repositoryService.getResourceAsStream(deploymentId, diagramResourceName);
	}
	
	/**
	 * 获取流程图的流
	 */
	@Override
	public InputStream selectImageInputStream(String deploymentId) {
		String diagramResourceName = "";
		List<String> list = repositoryService.getDeploymentResourceNames(deploymentId);
		if(list!=null && list.size()>0){
			for(String str:list){
				if(str.indexOf(".png")>-1){
					diagramResourceName = str;
				}
			}
		}
		
		return repositoryService.getResourceAsStream(deploymentId, diagramResourceName);
	}

	/**
	 * 删除流程定义
	 */
	public void deleteProcessDefinitionByDeploymentId(String deploymentId) {
		repositoryService.deleteDeployment(deploymentId);
	}
	
	/**
	 * 查询当前的个人任务 
	 */
	public void selectPersonTaskList(PageInfo pi) {
		Long total = 0L;
		List<Task> list = null;
		Map<String,Object> params = pi.getCondition();
		if(params!=null){
			int firstResult = pi.getFrom();
			int maxResults = pi.getSize() ;
			String assignee = params.get("assignee")+"";
			String order = pi.getOrder();
			String sort = pi.getSort();
			if("asc".equalsIgnoreCase(sort)){
				total = taskService.createTaskQuery()// 创建任务查询对象  
								.taskAssignee(assignee)//指定个人任务查询，指定办理人 
								.count();
				list = taskService.createTaskQuery()// 创建任务查询对象  
									.taskAssignee(assignee)//指定个人任务查询，指定办理人 
									.orderByTaskCreateTime().asc()// 使用创建时间的升序排列  
									.listPage(firstResult, maxResults);
			}else{
				total = taskService.createTaskQuery()// 创建任务查询对象  
									.taskAssignee(assignee)//指定个人任务查询，指定办理人 
									.count();
				list = taskService.createTaskQuery()// 创建任务查询对象  
									.taskAssignee(assignee)//指定个人任务查询，指定办理人 
									.orderByTaskCreateTime().desc()// 使用创建时间的升序排列  
									.listPage(firstResult, maxResults);
			}
		}else{
			log.info("任务查询参数异常！");
		}
		List<TaskVo> lists = new ArrayList<TaskVo>(); 
		if(list!=null){
			for(Task t:list){
				TaskVo tv = new TaskVo();
				tv.setId(t.getId());
				tv.setName(t.getName());
				tv.setCreateTime(t.getCreateTime());
				tv.setAssignee(t.getAssignee());
				tv.setExecutionId(t.getExecutionId());
				tv.setProcessDefinitionId(t.getProcessDefinitionId());
				tv.setProcessInstanceId(t.getProcessInstanceId());
				
				lists.add(tv);
			}
		}
		pi.setRows(lists);
		pi.setTotal(total.intValue());
		
	}

	@Override
	public List<Comment> selectCommentByTaskId(String taskId) {
		String processInstanceId = taskService.createTaskQuery()
											  .taskId(taskId)
											  .singleResult()
											  .getProcessInstanceId();
		
		List<Comment> list = taskService.getProcessInstanceComments(processInstanceId);
		//查询指定流程的任务流转路径 （流程历史 任务 流转 路经）
		List<HistoricTaskInstance> hisList = historyService.createHistoricTaskInstanceQuery()
														.processInstanceId(processInstanceId)
														.orderByHistoricTaskInstanceEndTime().asc().list();
		if(hisList!=null){
			for(HistoricTaskInstance hti:hisList){
				log.info("id:"+hti.getId());
				log.info("任务开始时间："+hti.getStartTime());
				log.info("任务结束时间："+hti.getEndTime());
				log.info("持续耗时(结束时间 -开始时间)："+hti.getDurationInMillis());
				log.info("任务认领时间："+hti.getClaimTime());
				log.info("执行耗时(结束时间-认领时间)："+hti.getWorkTimeInMillis());
				log.info("DeleteReason:"+hti.getDeleteReason());
			}
		}
		
		return list;
	}
	
	
	@Override
	public List<Comment> selectCommentByProcessInstanceId(String processInstanceId) {
		
		List<Comment> list = taskService.getProcessInstanceComments(processInstanceId);
		
		
		//查询指定流程的任务流转路径 （流程历史 任务 流转 路经）
		List<HistoricTaskInstance> hisList = historyService.createHistoricTaskInstanceQuery()
														.processInstanceId(processInstanceId)
														.orderByHistoricTaskInstanceEndTime().asc().list();
		if(hisList!=null){
			for(HistoricTaskInstance hti:hisList){
				log.info("id:"+hti.getId());
				log.info("任务开始时间："+hti.getStartTime());
				log.info("任务结束时间："+hti.getEndTime());
				log.info("持续耗时(结束时间 -开始时间)："+hti.getDurationInMillis());
				log.info("任务认领时间："+hti.getClaimTime());
				log.info("执行耗时(结束时间-认领时间)："+hti.getWorkTimeInMillis());
				log.info("DeleteReason:"+hti.getDeleteReason());
			}
		}
		
		return list;
	}
	
	@Override
	public String selectProcessInstanceIdByBusinessKey(String businessKey) {
		/**1:使用历史的流程实例查询，返回历史的流程实例对象，获取流程实例ID*/
		HistoricProcessInstance hpi = historyService.createHistoricProcessInstanceQuery()//对应历史的流程实例表
						.processInstanceBusinessKey(businessKey)//使用BusinessKey字段查询
						.singleResult();
		//流程实例ID
		String processInstanceId = hpi.getId();
		return processInstanceId;
	}
	
	/**
	 * 启动流程
	 */
	@Override
	public ProcessInstance insertStartWorkflowByKey(String key, String businessKey, SessionUser suser) {
		/**
		 * 4：从Session中获取当前任务的办理人，使用流程变量设置当前任务的办理人，从而获取下一步任务的办理人
			    * submitUser是流程变量的名称，
			    * 当前用户是流程变量的值
		 */
		Map<String, Object> variables = new HashMap<String,Object>();
		variables.put("inputUser", suser.getLoginName());//表示惟一用户
		/**
		 * 5：	(1)使用流程变量设置字符串（格式：LeaveBill.id的形式），通过设置，让启动的流程（流程实例）关联业务
   				(2)使用正在执行对象表中的一个字段BUSINESS_KEY（Activiti提供的一个字段），让启动的流程（流程实例）关联业务
		 */
		variables.put("businessKey", businessKey);
		//6：使用流程定义的key，(最新版本的流程定义)启动流程实例，同时设置流程变量，同时向正在执行的执行对象表中的字段BUSINESS_KEY添加业务数据，同时让流程关联业务
		ProcessInstance processInstance = runtimeService.startProcessInstanceByKey(key, businessKey, variables);
		
		return processInstance;
	}

	/**
	 * 通过任务Id查询部署Id
	 * @throws Exception 
	 */
	@Override
	public String selectDeloymentIdByTaskId(String taskId) throws Exception {
		Task task = taskService.createTaskQuery().taskId(taskId).singleResult();
		String processInstanceId = task.getProcessInstanceId();
		ProcessInstance pi = runtimeService.createProcessInstanceQuery()
							.processInstanceId(processInstanceId)
							.singleResult();
		if (pi == null) {  
            throw new Exception("流程实例未找到!");  
        } 
		return pi.getDeploymentId();
	}

	/**
	 * 根据任务Id查询流程实例对象
	 */
	@Override
	public ProcessInstance selectProcessInstanceByTaskId(String taskId) {
		Task task = taskService.createTaskQuery().taskId(taskId).singleResult();
		String processInstanceId = task.getProcessInstanceId();
		ProcessInstance pi = runtimeService.createProcessInstanceQuery()
											.processInstanceId(processInstanceId)
											.singleResult();
		return pi;
	}

	@Override
	public Map<String, Object> findCoordingByTask(String taskId) {
		Map<String, Object> map = new HashMap<String,Object>();
		Task task = taskService.createTaskQuery().taskId(taskId).singleResult();
		String processDefinitionId = task.getProcessDefinitionId();
		String processInstanceId = task.getProcessInstanceId();
		//获取流程定义的实体对象（对应.bpmn文件中的数据）
		ProcessDefinitionEntity pde = (ProcessDefinitionEntity) repositoryService.getProcessDefinition(processDefinitionId);
		
		ProcessInstance pi = runtimeService.createProcessInstanceQuery().processInstanceId(processInstanceId).singleResult();
		String activityId = pi.getActivityId();
		//获取当前活动对象
		ActivityImpl ai = pde.findActivity(activityId);
		//获取坐标
		map.put("x", ai.getX());
		map.put("y", ai.getY());
		map.put("width", ai.getWidth());
		map.put("height", ai.getHeight());
		return map;
	}

	@Override
	public List<String> selectOutComeListByTaskId(String taskId) {
		List<String> list = new ArrayList<String>();
		Task task = taskService.createTaskQuery().taskId(taskId).singleResult();
		
		String activityId = runtimeService.createProcessInstanceQuery()
										  .processInstanceId(task.getProcessInstanceId())
										  .singleResult()
										  .getActivityId();
		ProcessDefinitionEntity pde = (ProcessDefinitionEntity)repositoryService.getProcessDefinition(task.getProcessDefinitionId());
		ActivityImpl ai = pde.findActivity(activityId);
		List<PvmTransition> pvmList = ai.getOutgoingTransitions();
		if(pvmList!=null){
			for(PvmTransition pvm: pvmList){
				String name = (String) pvm.getProperty("name");
				if(StringUtils.isNoneBlank(name)){
					list.add(name);
				}else{
					list.add("提交");
				}
			}
		}
		return list;
	}
	
	
	
	
	
	
	
	
	/**
	 * 获取未签收的任务查询对象
	 * @param userId    用户ID
	 */
	public TaskQuery createUnsignedTaskQuery(String userId,String processDefKey) {
	    TaskQuery taskCandidateUserQuery = taskService.createTaskQuery()
	    												.processDefinitionKey(processDefKey)
	    												.taskCandidateUser(userId);
	    return taskCandidateUserQuery;
	}

	


}
