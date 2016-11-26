package org.xiaojl.core.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.xiaojl.commons.utils.FrameConstants;
import org.xiaojl.commons.utils.IpUtil;
import org.xiaojl.commons.utils.StringEscapeEditor;
import org.xiaojl.core.model.Resource;
import org.xiaojl.core.model.Role;
import org.xiaojl.core.model.User;
import org.xiaojl.core.model.result.Result;
import org.xiaojl.core.model.result.SessionUser;

/**
 * 基础controller
 */
public abstract class BaseController {
//	@Autowired
//	private IUserService userService;
	
	protected HttpServletRequest request;
	protected HttpServletResponse response;
	protected HttpSession session;
	
	@InitBinder
    public void initBinder(ServletRequestDataBinder binder) {
        /**
         * 自动转换日期类型的字段格式
         */
        binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"), true));

        /**
         * 防止XSS攻击
         */
        binder.registerCustomEditor(String.class, new StringEscapeEditor(true, false));
    }
	
	@ModelAttribute
	public void setHttpServletParam(HttpServletRequest request,HttpServletResponse response){
		this.request = request;
		this.response = response;
		this.session = request.getSession();
	}
	
	/**
	 * 通用工具：
	 * 		往request对象中设置值
	 */
	protected void setRequestAttribute(String key,Object value){
		this.request.setAttribute(key, value);
	}
	
	/**
	 * 通用工具：
	 * 		将当前用户转化为SessionUser，
	 * 		并保存当前用户到session中
	 * @param user
	 */
	protected void setCurrentUser2SessionUser(User user,List<Role> roles,List<Resource> resources){
		SessionUser sessionUser = new SessionUser();
		String ip = IpUtil.getIpAddr(this.request);
		sessionUser.setUserId(user.getId());
		sessionUser.setLoginName(user.getLoginName());
		sessionUser.setName(user.getName());
		sessionUser.setPassword(user.getPassword());
		sessionUser.setRoles(roles);
		sessionUser.setResources(resources);
		sessionUser.setIp(ip);
		sessionUser.setLoginTime(new Date());
		
		this.session.setAttribute(FrameConstants.SESSION_USER, sessionUser);
	}
	
	/**
     * 获取当前登录用户对象
     * @return
     */
    public SessionUser getCurrentUser() {
    	SessionUser sessionUser = (SessionUser) this.session.getAttribute(FrameConstants.SESSION_USER);
        return sessionUser;
    }

    /**
     * ajax失败
     * @param msg 失败的消息
     * @return {Object}
     */
    public Object renderError(String msg) {
        Result result = new Result();
        result.setMsg(msg);
        return result;
    }

    /**
     * ajax成功
     * @return {Object}
     */
    public Object renderSuccess() {
        Result result = new Result();
        result.setSuccess(true);
        return result;
    }

    /**
     * ajax成功
     * @param msg 消息
     * @return {Object}
     */
    public Object renderSuccess(String msg) {
        Result result = new Result();
        result.setSuccess(true);
        result.setMsg(msg);
        return result;
    }

    /**
     * ajax成功
     * @param obj 成功时的对象
     * @return {Object}
     */
    public Object renderSuccess(Object obj) {
        Result result = new Result();
        result.setSuccess(true);
        result.setObj(obj);
        return result;
    }

}
