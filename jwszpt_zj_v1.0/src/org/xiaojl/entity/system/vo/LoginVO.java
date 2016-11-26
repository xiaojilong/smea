package org.xiaojl.entity.system.vo;

public class LoginVO {
	private String loginname;
	private String password;
	private String code;
	public String getLoginname() {
		return loginname;
	}
	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	@Override
	public String toString() {
		return "LoginVO [loginname=" + loginname + ", password=" + password + ", code=" + code + "]";
	}
	
}
