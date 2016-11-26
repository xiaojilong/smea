package org.xiaojl.workflow.model;

import java.util.Date;

public class TaskVo {
//	System.out.println("任务ID：" + task.getId());  
//    System.out.println("任务名称:" + task.getName());  
//    System.out.println("任务的创建时间:" + task.getCreateTime());  
//    System.out.println("任务的办理人:" + task.getAssignee());  
//    System.out.println("流程实例ID:" + task.getProcessInstanceId());  
//    System.out.println("执行对象ID:" + task.getExecutionId());  
//    System.out.println("流程定义ID:" + task.getProcessDefinitionId());
	private String id;
	private String name;
	private Date createTime;
	private String assignee;
	private String processInstanceId;
	private String executionId;
	private String processDefinitionId;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getAssignee() {
		return assignee;
	}
	public void setAssignee(String assignee) {
		this.assignee = assignee;
	}
	public String getProcessInstanceId() {
		return processInstanceId;
	}
	public void setProcessInstanceId(String processInstanceId) {
		this.processInstanceId = processInstanceId;
	}
	public String getExecutionId() {
		return executionId;
	}
	public void setExecutionId(String executionId) {
		this.executionId = executionId;
	}
	public String getProcessDefinitionId() {
		return processDefinitionId;
	}
	public void setProcessDefinitionId(String processDefinitionId) {
		this.processDefinitionId = processDefinitionId;
	}
	@Override
	public String toString() {
		return "TaskVo [id=" + id + ", name=" + name + ", assignee=" + assignee
				+ ", createTime=" + createTime + ", executionId=" + executionId
				+ ", processDefinitionId=" + processDefinitionId
				+ ", processInstanceId=" + processInstanceId + "]";
	}
}
