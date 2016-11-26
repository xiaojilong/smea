package org.xiaojl.core.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xiaojl.commons.utils.DigestUtils;
import org.xiaojl.commons.utils.StringUtils;
import org.xiaojl.core.model.Role;
import org.xiaojl.core.model.User;
import org.xiaojl.core.model.result.PageInfo;
import org.xiaojl.core.model.result.SessionUser;
import org.xiaojl.core.model.vo.UserVO;
import org.xiaojl.core.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController extends BaseController {
	private Log log = LogFactory.getLog(this.getClass());
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/manager")
	public String manager(){
		return "admin/user/user";
	}
	
	@RequestMapping("/dataGrid")
	@ResponseBody
	public Object dataGrid(UserVO userVo,Integer page,Integer rows,String sort,String order){
		PageInfo pi = new PageInfo(page,rows,sort,order);
		
		Map<String,Object> condition = new HashMap<String,Object>();
		if(StringUtils.isNotBlank(userVo.getName())){
			condition.put("name", userVo.getName());
		}
		if (userVo.getOrganizationId() != null) {
            condition.put("organizationId", userVo.getOrganizationId());
        }
        if (userVo.getCreatedateStart() != null) {
            condition.put("startTime", userVo.getCreatedateStart());
        }
        if (userVo.getCreatedateEnd() != null) {
            condition.put("endTime", userVo.getCreatedateEnd());
        }
        
        //将排序信息放入map中
        if("createTime".equals(sort)){
        	sort = "create_time";
        }
        if("userType".equals(sort)){
        	sort = "user_type";
        }
        if("loginName".equals(sort)){
        	sort = "login_name";
        }
        condition.put("sort", sort);
        condition.put("order", order);
        
		pi.setCondition(condition);
		
		userService.selectDataGrid(pi);
		
		return pi;
	}
	
	@RequestMapping("/editPage")
	public String editPage(Long id){
		UserVO userVo = userService.selectUserVoById(id);
		List<Role> rolesList = userVo.getRolesList();
        List<Long> ids = new ArrayList<Long>();
        for (Role role : rolesList) {
            ids.add(role.getId());
        }
        this.request.setAttribute("roleIds", ids);
		this.request.setAttribute("user", userVo);
		
		return "admin/user/userEdit";
	}
	
	@RequestMapping("/edit")
	@ResponseBody
	public Object edit(UserVO userVo){
		//查询该用户信息
		User user = userService.selectUserById(userVo.getId());
		if(user==null){
			return renderError("被修改的用户对象不存在，请联系管理员！");
		}
		if(StringUtils.isNotBlank(userVo.getLoginName()) && !user.getLoginName().equals(userVo.getLoginName())){
			User user2 = userService.selectUserByLoginName(userVo.getLoginName());
			if(user2!=null && user2.getId()!=userVo.getId()){
				return renderError("该登录名已经存在，请修改您的登录名！");
			}
		}
		if(StringUtils.isNotBlank(userVo.getPassword())){
			userVo.setPassword(DigestUtils.md5Hex(userVo.getPassword()));
		}else{
			userVo.setPassword(user.getPassword());
		}
		
		try {
			userService.updateByVO(userVo);
		} catch (Exception e) {
			e.printStackTrace();
			return renderError("未知错误，请联系管理员！");
		}
		return renderSuccess("修改成功！");
	}
	
	@RequestMapping("/addPage")
	public String addPage(){
		return "admin/user/userAdd";
	}
	
	@RequestMapping("/add")
	@ResponseBody
	public Object add(UserVO userVo){
		if(StringUtils.isNotBlank(userVo.getLoginName())){
			User user = userService.selectUserByLoginName(userVo.getLoginName());
			if(user!=null){
				return renderError("该登录名已经存在，请修改您的登录名！");
			}
		}else{
			return renderError("登录名不能为空！");
		}
		if(StringUtils.isNotBlank(userVo.getPassword())){
			userVo.setPassword(DigestUtils.md5Hex(userVo.getPassword()));
		}else{
			return renderError("登录密码不能为空！");
		}
		
		try {
			userService.insertByVO(userVo);
		} catch (Exception e) {
			e.printStackTrace();
			return renderError("未知错误，请联系管理员！");
		}
		
		return renderSuccess("添加成功！");
	}
	
	@RequestMapping("/editCurrentUserPwdPage")
	public String editCurrentUserPwdPage(){
		this.request.setAttribute("sessionUser", this.getCurrentUser());
		return "admin/user/userEditPwd";
	}
	
	@RequestMapping("/editUserPwd")
	@ResponseBody
	public Object editUserPwd(String oldPwd,String pwd,String rePwd){
		SessionUser sUser = this.getCurrentUser();
		if(StringUtils.isNotBlank(pwd)){
			if(!pwd.equals(rePwd)){
				return renderError("两次输入的密码不一致！");
			}
		}else{
			return renderError("新密码不能为空！");
		}
		if(StringUtils.isNotBlank(oldPwd)){
			if(!DigestUtils.md5Hex(oldPwd).equals(sUser.getPassword())){
				return renderError("原密码不正确！");
			}
		}else{
			return renderError("原密码不正确！");
		}
		
		try {
			pwd = DigestUtils.md5Hex(pwd);
			userService.updateUserPwdById(sUser.getUserId(),pwd);
		} catch (Exception e) {
			e.printStackTrace();
			return renderError("未知错误，请联系管理员！");
		}
		
		return renderSuccess("密码修改成功！");
	}
	
}
