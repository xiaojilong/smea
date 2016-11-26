package org.xiaojl.core.model.vo;

import java.util.Date;
import java.util.List;

import org.xiaojl.core.model.Role;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

public class UserVO {
	private Long id;
	private String loginName;
	private String name;
	@JsonIgnore
	private String password;
	private Integer sex;
	private Integer age;
	private String phone;
	private Integer userType;
	private Integer status;
	private Integer organizationId;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date createTime;
	
	private List<Role> rolesList;
    private String organizationName;
    private String roleIds;
    private Date createdateStart;
    private Date createdateEnd;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName == null?"":loginName.trim();
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name == null?"":name.trim();
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password == null?"":password.trim();
	}
	public Integer getSex() {
		return sex;
	}
	public void setSex(Integer sex) {
		this.sex = sex;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone == null?"":phone.trim();
	}
	public Integer getUserType() {
		return userType;
	}
	public void setUserType(Integer userType) {
		this.userType = userType;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getOrganizationId() {
		return organizationId;
	}
	public void setOrganizationId(Integer organizationId) {
		this.organizationId = organizationId;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public List<Role> getRolesList() {
		return rolesList;
	}
	public void setRolesList(List<Role> rolesList) {
		this.rolesList = rolesList;
	}
	public String getOrganizationName() {
		return organizationName;
	}
	public void setOrganizationName(String organizationName) {
		this.organizationName = organizationName ;
	}
	public String getRoleIds() {
		return roleIds;
	}
	public void setRoleIds(String roleIds) {
		this.roleIds = roleIds;
	}
	public Date getCreatedateStart() {
		return createdateStart;
	}
	public void setCreatedateStart(Date createdateStart) {
		this.createdateStart = createdateStart;
	}
	public Date getCreatedateEnd() {
		return createdateEnd;
	}
	public void setCreatedateEnd(Date createdateEnd) {
		this.createdateEnd = createdateEnd;
	}
	@Override
	public String toString() {
		return "UserVO [id=" + id + ", loginName=" + loginName + ", name="
				+ name + ", age=" + age + ", createTime=" + createTime
				+ ", createdateEnd=" + createdateEnd + ", createdateStart="
				+ createdateStart + ", organizationId=" + organizationId
				+ ", organizationName=" + organizationName + ", password="
				+ password + ", phone=" + phone + ", roleIds=" + roleIds
				+ ", rolesList=" + rolesList + ", sex=" + sex + ", status="
				+ status + ", userType=" + userType + "]";
	}
    
}
