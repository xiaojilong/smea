package org.xiaojl.workflow.service;

import java.io.File;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Comment;
import org.xiaojl.core.model.result.PageInfo;
import org.xiaojl.core.model.result.SessionUser;


public interface WorkflowService {

	void selectDeploymentList(PageInfo pageInfo);

	void selectProcessDefinitionList(PageInfo pageInfo);

	void insertDeployment(File targetFile, String name)throws Exception;

	InputStream selectImageInputStream(String deploymentId,
			String diagramResourceName);

	void deleteProcessDefinitionByDeploymentId(String deploymentId);

	void selectPersonTaskList(PageInfo pi);

	InputStream selectImageInputStream(String deploymentId);

	ProcessInstance insertStartWorkflowByKey(String key, String businessKey,SessionUser suser);

	String selectDeloymentIdByTaskId(String taskId) throws Exception;

	ProcessInstance selectProcessInstanceByTaskId(String taskId);

	Map<String, Object> findCoordingByTask(String taskId);

	List<String> selectOutComeListByTaskId(String taskId);

	List<Comment> selectCommentByTaskId(String taskId);

	List<Comment> selectCommentByProcessInstanceId(String processInstanceId);

	String selectProcessInstanceIdByBusinessKey(String businessKey);

}
