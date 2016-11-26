package org.xiaojl.core.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xiaojl.commons.utils.StringUtils;
import org.xiaojl.core.model.Organization;
import org.xiaojl.core.service.OrganizationService;


@Controller
@RequestMapping("/organization")
public class OrganizationController extends BaseController {
	private Log log = LogFactory.getLog(this.getClass());
	
	@Autowired
	private OrganizationService organizationService;
	
	@RequestMapping("/tree")
	@ResponseBody
	public Object tree(){
		return organizationService.selectAllTree();
	}
	
	@RequestMapping("/manager")
	public String manager(){
		return "admin/organization/organization";
	}
	
	@RequestMapping("/treeGrid")
	@ResponseBody
	public Object treeGrid(){
		return organizationService.selectAll();
	}
	
	@RequestMapping("/editPage")
	public String editPage(Long id){
		Organization o = organizationService.selectById(id);
		this.request.setAttribute("organization", o);
		return "admin/organization/organizationEdit";
	}
	
	@RequestMapping("/edit")
	@ResponseBody
	public Object edit(Organization o){
		if(StringUtils.isNotBlank(o.getName())){
			Organization or = organizationService.selectByName(o.getName());
			if(or!=null && !or.getId().equals(o.getId()) ){
				return renderError("该部门名称已存在！");
			}
		}
		
		if(StringUtils.isNotBlank(o.getCode())){
			Organization or = organizationService.selectByCode(o.getCode());
			if(or!=null && !or.getId().equals(o.getId()) ){
				return renderError("该部门编号已存在！");
			}
		}
		
		try {
			organizationService.updateById(o);
		} catch (Exception e) {
			e.printStackTrace();
			return renderError("未知异常，请联系管理员！");
		}
		return renderSuccess("修改成功！");	
	}
	
	@RequestMapping("/addPage")
	public String addPage(){
		return "admin/organization/organizationAdd";
	}
	
	@RequestMapping("/add")
	@ResponseBody
	public Object add(Organization o){
		if(StringUtils.isNotBlank(o.getName())){
			Organization or = organizationService.selectByName(o.getName());
			if(or!=null && !or.getId().equals(o.getId()) ){
				return renderError("该部门名称已存在！");
			}
		}
		
		if(StringUtils.isNotBlank(o.getCode())){
			Organization or = organizationService.selectByCode(o.getCode());
			if(or!=null && !or.getId().equals(o.getId()) ){
				return renderError("该部门编号已存在！");
			}
		}
		
		try {
			organizationService.insertOrganization(o);
		} catch (Exception e) {
			e.printStackTrace();
			return renderError("未知异常，请联系管理员！");
		}
		
		return renderSuccess("添加成功！");
	}
}
