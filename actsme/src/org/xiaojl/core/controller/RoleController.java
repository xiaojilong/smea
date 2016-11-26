package org.xiaojl.core.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xiaojl.commons.utils.StringUtils;
import org.xiaojl.core.model.Role;
import org.xiaojl.core.model.result.PageInfo;
import org.xiaojl.core.service.RoleService;

@Controller
@RequestMapping("/role")
public class RoleController extends BaseController {
	private Log log = LogFactory.getLog(getClass());
	
	@Autowired
	private RoleService roleService;
	
	@RequestMapping("/tree")
	@ResponseBody
	public Object tree(){
		return roleService.selectTree();
	}
	
	@RequestMapping("/manager")
	public String manager(){
		this.request.setAttribute("user", this.getCurrentUser());
		return "admin/role/role";
	}
	
	@RequestMapping("/dataGrid")
	@ResponseBody
	public Object dataGrid(Integer page, Integer rows, String sort, String order){
		PageInfo pageInfo = new PageInfo(page,rows,sort,order);
		log.debug(pageInfo);
		
		Map<String, Object> condition = new HashMap<String, Object>();
        pageInfo.setCondition(condition);
        
        roleService.selectDataGrid(pageInfo);
        
		return pageInfo;
	}
	
	@RequestMapping("/addPage")
	public String addPage(){
		return "admin/role/roleAdd";
	}
	
	@RequestMapping("/add")
	@ResponseBody
	public Object add(Role role){
		roleService.insertRole(role);
		return renderSuccess("添加成功！");
	}
	
	@RequestMapping("/editPage")
	public String editPage(Long id){
		
		Role role = roleService.selectRoleById(id);
		this.request.setAttribute("role", role);
		
		return "admin/role/roleEdit";
	}
	
	@RequestMapping("/edit")
	@ResponseBody
	public Object edit(Role role){
		roleService.updateRoleById(role);
		return renderSuccess("修改成功！");
	}
	
	@RequestMapping("/grantPage")
	public String grantPage(Long id){
		this.request.setAttribute("id", id);
		return "admin/role/roleGrant";
	}
	
	@RequestMapping("/findResourceIdListByRoleId")
	@ResponseBody
	public Object findResourceIdListByRoleId(Long id){
		List<Long> lists = roleService.selectResourceIdListByRoleId(id);
		return renderSuccess(lists);
	}
	
	@RequestMapping("/grant")
	@ResponseBody
	public Object grant(Long id,String resourceIds){
		if(StringUtils.isBlank(id+"")){
			return renderError("数据异常,请联系管理员！");
		}
		
		roleService.updateRoleResource(id,resourceIds);
		
		return renderSuccess("授权成功！");
	}
}
