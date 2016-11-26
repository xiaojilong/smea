package org.xiaojl.workflow.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Comment;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.xiaojl.core.controller.BaseController;
import org.xiaojl.core.model.result.PageInfo;
import org.xiaojl.core.model.result.SessionUser;
import org.xiaojl.workflow.service.WorkflowService;

@Controller
@RequestMapping("/workflow")
public class WorkflowController extends BaseController {
	private Log log = LogFactory.getLog(getClass());	
	
	@Autowired
	private WorkflowService workflowService;
	
	/**
	 * 流程定义列表页面
	 */
	@RequestMapping("/processDefinitionList")
	public String processDefinitionList(String deploymentId){
		this.setRequestAttribute("deploymentId", deploymentId);
		return "admin/workflow/processDefinitionList";
	}
	
	/**
	 * 流程定义列表页面
	 */
	@RequestMapping("/processDefinitionDataGrid")
	@ResponseBody
	public Object processDefinitionDataGrid(String deploymentId,Integer page,Integer rows,String sort,String order){
		PageInfo pageInfo = new PageInfo(page,rows,sort,order);
		
		//deploymentId不为空，则查询
		if(StringUtils.isNoneBlank(deploymentId)){
			Map<String,Object> params = new HashMap<String,Object>();
			params.put("deploymentId", deploymentId);
			pageInfo.setCondition(params);
			
			workflowService.selectProcessDefinitionList(pageInfo);
			
		}else{//deploymentId为空,则返回空
			pageInfo.setRows(new ArrayList());
			pageInfo.setTotal(0);
		}
		
		return pageInfo;
	}
	
	/**
	 * 流程部署管理列表页面
	 */
	@RequestMapping("/deploymentList")
	public String deploymentList(){
		return "admin/workflow/deploymentList";
	}
	
	/**
	 * 流程部署列表数据  
	 */
	@RequestMapping("/deploymentDataGrid")
	@ResponseBody
	public Object deploymentDataGrid(Integer page,Integer rows,String sort,String order){
		PageInfo pageInfo = new PageInfo(page,rows,sort,order);
		
		Map<String,Object> params = new HashMap<String,Object>();
		pageInfo.setCondition(params);
		
		workflowService.selectDeploymentList(pageInfo);
		
		return pageInfo;
	}
	
	@RequestMapping("/deployPage")
	public String deployPage(){
		return "admin/workflow/deploy";
	}
	
	@RequestMapping("/addDeployment")
	@ResponseBody
	public Object addDeployment(@RequestParam(value="file",required=false)MultipartFile file,String name){
		try {
			//获取并保存文件
			String path = request.getSession().getServletContext().getRealPath("upload/bpmn");
			String fileName = file.getOriginalFilename();
			if(StringUtils.isBlank(fileName)){
				return renderError("流程定义文件为空，流程部署失败！");
	 		}
			fileName = System.currentTimeMillis() + "_"+fileName;
			File targetFile = new File(path,fileName);
			if(!targetFile.exists()){
				targetFile.mkdirs();
			}
			file.transferTo(targetFile);
			//部署流程
			workflowService.insertDeployment(targetFile,name);
		} catch (Exception e) {
			e.printStackTrace();
			return renderError("未知错误，流程部署失败！");
		}
		
		return renderSuccess("流程部署成功！");
	}
	
	/**
	 * 删除流程定义
	 */
	@RequestMapping("/deleteDeployment")
	@ResponseBody
	public Object deleteDeployment(String deploymentId){
		if(StringUtils.isBlank(deploymentId)){
			return renderError("删除失败，部署Id不能为空！");
		}
		try {
			workflowService.deleteProcessDefinitionByDeploymentId(deploymentId);
		} catch (Exception e) {
			e.printStackTrace();
			return renderError("未知错误，删除失败！");
		}
		return renderSuccess("删除成功！");
	}
	
	@RequestMapping ("viewImageUIByTaskId")
	public String viewImageUIByTaskId(String taskId){
		//通过任务Id查询部署Id
		ProcessInstance pi = workflowService.selectProcessInstanceByTaskId(taskId);
		if(pi!=null){
			String deploymentId = pi.getDeploymentId();
			this.setRequestAttribute("deploymentId", deploymentId);
			
			/**二：查看当前活动，获取当期活动对应的坐标x,y,width,height，将4个值存放到Map<String,Object>中*/
			Map<String, Object> map = workflowService.findCoordingByTask(taskId);
			this.setRequestAttribute("acs", map);
			
			return "/admin/workflow/image";
		}
		
		return "error/500";
	}
	
	@RequestMapping ("viewImageUI")
	public String viewImageUI(String deploymentId){
		this.setRequestAttribute("deploymentId", deploymentId);
		return "/admin/workflow/image";
	}
	
	@RequestMapping("/viewImage")
	public void viewImage(String deploymentId){
		log.debug("请求参数：deploymentId="+deploymentId);
		InputStream in = null;
		OutputStream out = null;
		try {
			//1：获取资源文件表（act_ge_bytearray）中资源图片输入流InputStream
			in = workflowService.selectImageInputStream(deploymentId);
			//2：从response对象获取输出流
			out = response.getOutputStream();
			//3：将输入流中的数据读取出来，写到输出流中
			for(int b=-1;(b=in.read())!=-1;){
				out.write(b);
			}
		} catch (IOException e) {
			log.error("读取图片数据出现异常.",e);
			e.printStackTrace();
		}finally{
			try {
				if(out!=null){
					out.close();
				}
				if(in!=null){
					in.close();
				}
			} catch (IOException e) {
				log.error("读取图片数据的输入输出流关闭异常.");
			}
		}
	}
	
	/**
	 * 流程办理界面
	 */
	@RequestMapping("/presonTaskPage")
	public String transactPage(String taskId){
		
		
		//获取可选出口
		List<String> outComeList = workflowService.selectOutComeListByTaskId(taskId);
		this.setRequestAttribute("outComeList", outComeList);
		
		//获取审批日志
		List<Comment> commentList = workflowService.selectCommentByTaskId(taskId);
		this.setRequestAttribute("commentList", commentList);
		
		this.setRequestAttribute("taskId", taskId);
		return "admin/workflow/presonTask";
	}
	
	/**
	 * 个人任务列表
	 */
	@RequestMapping("/personTaskManager")
	public String personTaskManager(){
		return "admin/workflow/personTaskList";
	}
	
	/**
	 * 个人任务列表
	 */
	@RequestMapping("/personTaskDataGrid")
	@ResponseBody
	public Object personTaskDataGrid(Integer page,Integer rows,String sort,String order){
		SessionUser sUser = this.getCurrentUser();
		String assignee = sUser.getLoginName();
		PageInfo pi = new PageInfo(page,rows,sort,order);
		
		Map<String,Object> params = new HashMap<String,Object>();
		params.put("assignee", assignee);
		pi.setCondition(params);
		
		workflowService.selectPersonTaskList(pi);
		
		return pi;
	}
	
	@RequestMapping("/commentListByTaskId")
	public String comentListByTaskId(String taskId){
		ProcessInstance processInstance = workflowService.selectProcessInstanceByTaskId(taskId);
		this.setRequestAttribute("processInstanceId", processInstance.getId());
		return "admin/workflow/commentList";
	}
	
	/**
	 * 查看审批日志页面
	 */
	@RequestMapping("/commentList")
	public String commentList(String businessId,String key){
		String businessKey = key+"."+businessId;
		String processInstanceId = workflowService.selectProcessInstanceIdByBusinessKey(businessKey);
		this.setRequestAttribute("processInstanceId", processInstanceId);
		return "admin/workflow/commentList";
	}
	
	/**
	 * 查看审批日志信息
	 */
	@RequestMapping("/commentListDataGrid")
	@ResponseBody
	public Object commentListDataGrid(String processInstanceId,Integer page,Integer rows,String sort,String order){
		PageInfo pi = new PageInfo(page,rows,sort,order);
		List<Comment> commentList = workflowService.selectCommentByProcessInstanceId(processInstanceId);
		pi.setRows(commentList);
		pi.setTotal(commentList.size());
		
		return pi;
	}
	
	
}
