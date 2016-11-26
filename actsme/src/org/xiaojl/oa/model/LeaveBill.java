package org.xiaojl.oa.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Table;

import com.baomidou.mybatisplus.annotations.IdType;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

@TableName(value="leavebill")
public class LeaveBill implements Serializable {
	@TableField(exist=false)
	private static final long serialVersionUID = -3542282324813530681L;
	@TableId(type=IdType.AUTO)
	private Long id;
	// 请假天数
	private Integer leaveDays;
	// 请假内容
	private String context;
	// 请假时间
	private Date leaveTime=new Date();
	//请假人
	private String leavePeople;
	// 备注
	private String remark;
	// 请假单状态 0.保存,1.开始审批,2为审批通过，3审批不通过
	private Integer status=0;
	//流程实例ID
	private String processInstanceId;
	
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
	@Override
	public String toString() {
		return "LeaveBill [id=" + id + ", leavePeople=" + leavePeople + ", leaveTime="
				+ leaveTime + ", leaveDays=" + leaveDays + ", status=" + status
				+ ", context=" + context + ", remark=" + remark + ",processInstanceId="+processInstanceId+"]";
	}
	
}
