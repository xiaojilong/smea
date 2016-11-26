package org.xiaojl.core.model.result;

import java.util.Date;
import java.util.List;

import org.xiaojl.core.model.Resource;
import org.xiaojl.core.model.Role;

public class SessionUser {
	
	private Long userId;
	private String loginName;
	private String name;
	private String password;
	private String ip;//主机地址
	private Date loginTime;//登录时间
	private Date logoutTime;//退出时间
	
	private List<Role> roles;
	private List<Resource> resources;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getLoginTime() {
		return loginTime;
	}
	public void setLoginTime(Date loginTime) {
		this.loginTime = loginTime;
	}
	public Date getLogoutTime() {
		return logoutTime;
	}
	public void setLogoutTime(Date logoutTime) {
		this.logoutTime = logoutTime;
	}
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public List<Role> getRoles() {
		return roles;
	}
	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}
	public List<Resource> getResources() {
		return resources;
	}
	public void setResources(List<Resource> resources) {
		this.resources = resources;
	}
	@Override
	public String toString() {
		return "SessionUser [userId=" + userId + ", loginName=" + loginName
				+ ", name=" + name + ", ip=" + ip + ", loginTime=" + loginTime
				+ ", logoutTime=" + logoutTime + ", password=" + password
				+ ", resources=" + resources + ", roles=" + roles + "]";
	}
	
}
