package org.xiaojl.core.controller;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xiaojl.commons.utils.DigestUtils;
import org.xiaojl.commons.utils.StringUtils;
import org.xiaojl.core.model.Resource;
import org.xiaojl.core.model.Role;
import org.xiaojl.core.model.User;
import org.xiaojl.core.model.result.SessionUser;
import org.xiaojl.core.service.ResourceService;
import org.xiaojl.core.service.UserService;

@Controller
@RequestMapping("/framework")
public class FrameworkController extends BaseController {
	private Log log = LogFactory.getLog(getClass());
	
	@Autowired
	private UserService userService;
	@Autowired
	private ResourceService resourceService;
	/**
     * 首页
     *
     * @return
     */
    @RequestMapping(value = "/")
    public String index() {
        return "redirect:framework/index";
    }

    /**
     * 首页
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/index")
    public String index(Model model) {
    	SessionUser user = getCurrentUser();
    	model.addAttribute("user", user);
        return "framework/easyuiHome";
    }
    
	/**
     *登录页面
     */
    @RequestMapping(value = "/loginPage")
    public String indexPage() {
        return "login";
    }

    /**
     * POST 登录 shiro 写法
     *
     * @param username 用户名
     * @param password 密码
     * @return
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public Object loginPost(String username, String password) {
        log.debug("POST请求登录,执行登录验证!");
        if (StringUtils.isBlank(username)) {
            return renderError("用户名不能为空");
        }
        if (StringUtils.isBlank(password)) {
            return renderError("密码不能为空");
        }
        
		try {
			password = DigestUtils.md5Hex(password);
			User user = userService.selectUserByloginNameAndPassword(username,password);
			if(user==null){
	        	return renderError("用户名或密码错误");
	        }else{
	        	//获取用户角色信息
	        	List<Role> roles = userService.selectRolesByUserId(user.getId());
	        	//获取用户资源权限信息
	        	List<Resource> resources = resourceService.selectResourcesByRoles(roles);
	        	//保存到sessionUser中
	        	setCurrentUser2SessionUser(user,roles,resources);
	        }
		} catch (Exception e) {
			log.error("未知错误!",e);
			return renderError("未知错误,请联系管理员!");
		}
        
        return renderSuccess();
    }

    /**
     * 退出
     * @return {Result}
     */
    @RequestMapping(value = "/logout")
    @ResponseBody
    public Object logout() {
        log.debug("登出");
        SessionUser user = getCurrentUser();
        //入库
        
        //session失效
        if(this.session!=null){
        	this.session.invalidate();
        }
        return renderSuccess();
    }
    
    @RequestMapping("/right")
    public String right(){
    	return "framework/easyuiRight";
    }
    
    @RequestMapping(value = "/top")
    public String top(Model model) {
    	SessionUser user = getCurrentUser();
    	model.addAttribute("user", user);
        return "framework/easyuiTop";
    }
    
    @RequestMapping(value = "/main")
    public String main(Model model) {
    	SessionUser user = getCurrentUser();
    	model.addAttribute("user", user);
        return "framework/easyuiMain";
    }
    
    @RequestMapping(value = "/portalAbout")
    public String portalAbout(Model model) {
    	SessionUser user = getCurrentUser();
    	model.addAttribute("user", user);
        return "framework/portal/about";
    }
    
    @RequestMapping(value = "/portalLink")
    public String portalLink(Model model) {
    	SessionUser user = getCurrentUser();
    	model.addAttribute("user", user);
        return "framework/portal/link";
    }
    
    @RequestMapping(value = "/portalLuffy")
    public String portalLuffy(Model model) {
    	SessionUser user = getCurrentUser();
    	model.addAttribute("user", user);
        return "framework/portal/luffy";
    }
    
    @RequestMapping(value = "/portalSeq")
    public String portalSeq(Model model) {
    	SessionUser user = getCurrentUser();
    	model.addAttribute("user", user);
        return "framework/portal/seq";
    }
    
    @RequestMapping(value = "/unauth")
    public String unauth(Model model) {
    	SessionUser user = getCurrentUser();
    	model.addAttribute("user", user);
        return "unAuth";
    }
}
