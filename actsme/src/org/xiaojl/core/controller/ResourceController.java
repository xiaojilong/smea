package org.xiaojl.core.controller;

import java.util.Date;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xiaojl.commons.utils.StringUtils;
import org.xiaojl.core.model.Resource;
import org.xiaojl.core.model.result.SessionUser;
import org.xiaojl.core.model.result.Tree;
import org.xiaojl.core.service.ResourceService;

@Controller
@RequestMapping("/resource")
public class ResourceController extends BaseController {
	private Log log = LogFactory.getLog(this.getClass());
	
	@Autowired
	private ResourceService resourceService;
	
	@RequestMapping("tree")
	@ResponseBody
	public List<Tree> tree(){
		SessionUser currentUser = getCurrentUser();
		List<Tree> list = resourceService.selectMenuTree(currentUser);
		return list;
	}
	
	/**
	 * 授权的菜单和按钮
	 */
	@RequestMapping("allTrees")
	@ResponseBody
	public List<Tree> allTrees(){
		SessionUser currentUser = getCurrentUser();
		List<Tree> list = resourceService.selectResourcesTree(currentUser);
		return list;
	}
	
	@RequestMapping("/manager")
	public String manager(){
		this.request.setAttribute("user", this.getCurrentUser());
		return "admin/resource/resource";
	}
	
	@RequestMapping("/treeGrid")
	@ResponseBody
	public Object treeGrid(){
		return resourceService.selectAllResources();
	}
	
	@RequestMapping("/editPage")
	public String editPage(Long id){
		Resource r = resourceService.selectOneById(id);
		this.request.setAttribute("resource", r);
		return "admin/resource/resourceEdit";
	}
	
	@RequestMapping("/edit")
	@ResponseBody
	public Object edit(Resource resource){
		resourceService.updateResourceById(resource);
        return renderSuccess("编辑成功！");
	}
	
	@RequestMapping("/addPage")
	public String addPage(){
		return "admin/resource/resourceAdd";
	}
	
	@RequestMapping("/add")
	@ResponseBody
	public Object add(Resource resource){
		try {
			resource.setCreateTime(new Date());
			resourceService.insertResource(resource);
		} catch (Exception e) {
			e.printStackTrace();
			return renderError("未知错误，请联系管理员！");
		}
		return renderSuccess("添加成功！");
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public Object delete(Resource resource){
		Long id = resource.getId();
		if(StringUtils.isBlank(id+"")){
			log.info("删除对象ID不能为空,id="+id);
			return renderError("删除对象ID不能为空!");
		}
		resourceService.deleteResourceById(id);
		
		return renderSuccess("删除成功！");
	}
	
}
