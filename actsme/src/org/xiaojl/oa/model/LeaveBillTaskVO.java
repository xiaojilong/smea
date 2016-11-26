package org.xiaojl.oa.model;

import java.util.Date;

public class LeaveBillTaskVO {
	private Long id;
	// 请假天数
	private Integer leaveDays;
	// 请假内容
	private String context;
	// 请假时间
	private Date leaveTime;
	//请假人
	private String leavePeople;
	// 备注
	private String remark;
	// 请假单状态 0.保存,1.开始审批,2为审批通过，3审批不通过
	private Integer status;
	//流程实例ID
	private String processInstanceId;
	private String taskId;
	private String executionId;
	private String taskPersion;
	private Date taskCreateTime;
	
	public String getTaskId() {
		return taskId;
	}
	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}
	public String getExecutionId() {
		return executionId;
	}
	public void setExecutionId(String executionId) {
		this.executionId = executionId;
	}
	public String getTaskPersion() {
		return taskPersion;
	}
	public void setTaskPersion(String taskPersion) {
		this.taskPersion = taskPersion;
	}
	public Date getTaskCreateTime() {
		return taskCreateTime;
	}
	public void setTaskCreateTime(Date taskCreateTime) {
		this.taskCreateTime = taskCreateTime;
	}
	public String getProcessInstanceId() {
		return processInstanceId;
	}
	public void setProcessInstanceId(String processInstanceId) {
		this.processInstanceId = processInstanceId;
	}
	public Integer getLeaveDays() {
		return leaveDays;
	}
	public void setLeaveDays(Integer leaveDays) {
		this.leaveDays = leaveDays;
	}
	public String getLeavePeople() {
		return leavePeople;
	}
	public void setLeavePeople(String leavePeople) {
		this.leavePeople = leavePeople;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public Date getLeaveTime() {
		return leaveTime;
	}
	public void setLeaveTime(Date leaveTime) {
		this.leaveTime = leaveTime;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	
}
