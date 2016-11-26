package org.xiaojl.workflow.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xiaojl.core.controller.BaseController;
import org.xiaojl.core.model.result.PageInfo;
import org.xiaojl.workflow.model.ProcessType;
import org.xiaojl.workflow.service.ProcessTypeService;


@RequestMapping("/processType")
@Controller
public class ProcessTypeController extends BaseController {
	
	@Autowired
	ProcessTypeService processTypeService;
	
	@RequestMapping("/comboboxData")
	@ResponseBody
	public Object comboboxData(){
		List<ProcessType> list = processTypeService.selectComboboxData();
		return list;
	}
	
	/**
	 * 流程类型管理
	 */
	@RequestMapping("/manager")
	public String manager(){
		return "admin/workflow/processType/processType";
	}
	
	@RequestMapping("/dataGrid")
	@ResponseBody
	public Object dataGrid(Integer page,Integer rows,String sort,String order){
		PageInfo pi = new PageInfo(page,rows,sort,order);
		
		Map<String,Object> params = new HashMap<String,Object>();
		params.put("sort", sort);
		params.put("order", order);
		pi.setCondition(params);
		
		processTypeService.selectDataGrid(pi);
		
		return pi;
	}
	
	@RequestMapping("/add")
	@ResponseBody
	public Object add(ProcessType pt){
		try {
			processTypeService.insertProcessType(pt);
		} catch (Exception e) {
			e.printStackTrace();
			return renderError("未知错误，添加失败！");
		}
		return renderSuccess("添加成功！");
	}
	
	@RequestMapping("/edit")
	@ResponseBody
	public Object edit(ProcessType pt){
		if(pt==null || StringUtils.isBlank(pt.getId()+"")){
			return renderError("参数错误，编辑失败！");
		}
		try {
			processTypeService.updateProcessType(pt);
		} catch (Exception e) {
			e.printStackTrace();
			return renderError("未知错误，编辑失败！");
		}
		return renderSuccess("编辑成功！");
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public Object delete(String ids){
		if(StringUtils.isBlank(ids)){
			return renderError("请选择要删除的数据！");
		}
		try {
			processTypeService.deleteByIds(ids);
		} catch (Exception e) {
			e.printStackTrace();
			return renderError("未知错误，删除失败！");
		}
		
		return renderSuccess("删除成功！");
			
	}
}
