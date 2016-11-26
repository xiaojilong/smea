package org.xiaojl.oa.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.activiti.engine.task.Comment;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xiaojl.commons.utils.StringUtils;
import org.xiaojl.core.controller.BaseController;
import org.xiaojl.core.model.result.PageInfo;
import org.xiaojl.core.model.result.SessionUser;
import org.xiaojl.oa.model.LeaveBill;
import org.xiaojl.oa.service.LeaveService;
import org.xiaojl.workflow.service.WorkflowService;

/**
 * 请假管理
 */
@Controller
@RequestMapping("/leave")
public class LeaveController extends BaseController {
	private Log log = LogFactory.getLog(getClass());
	
	@Autowired
	private LeaveService leaveService;
	@Autowired
	private WorkflowService workflowService;
	
	@RequestMapping("/manager")
	public String manager(){
		return "oa/leave/leave";
	}
	
	@RequestMapping("/dataGrid")
	@ResponseBody
	public Object dataGrid(Integer page,Integer rows,String sort,String order){
		PageInfo pi = new PageInfo(page,rows,sort,order);
		
		Map<String,Object> params = new HashMap<String,Object>();
		params.put("order", order);
		params.put("sort", sort);
		pi.setCondition(params);
		
		leaveService.selectDataGrid(pi);
		
		return pi;
	}
	
	@RequestMapping("/addPage")
	public String addPage(){
		return "oa/leave/leaveAdd";
	}
	
	@RequestMapping("/add")
	@ResponseBody
	public Object add(LeaveBill leaveBill){
		SessionUser suser = this.getCurrentUser();
		leaveBill.setLeavePeople(suser.getLoginName());
		
		try {
			leaveService.insertLeaveBill(leaveBill);
		} catch (Exception e) {
			e.printStackTrace();
			return renderError("未知错误，请联系管理员！");
		}
		
		return renderSuccess("添加成功！");
	}
	
	@RequestMapping("/editPage")
	public String editPage(Long id){
		LeaveBill lb = leaveService.selectLeaveBillById(id);
		// 0.保存,1.开始审批,2为审批通过，3审批不通过
		if(lb!=null && lb.getStatus()!=0){
			this.setRequestAttribute("msg", "当前单据不可被修改！");
		}else{
			this.setRequestAttribute("leaveBill", lb);
		}
		return "oa/leave/leaveEdit";
	}
	
	@RequestMapping("/startWorkflowPage")
	public String startWorkflowPage(Long id){
		LeaveBill lb = leaveService.selectLeaveBillById(id);
		this.setRequestAttribute("leaveBill", lb);
		return "oa/leave/startWorkflow";
	}
	
	/**
	 * 启动流程审批
	 */
	@RequestMapping("/startWorkflow")
	@ResponseBody
	public Object startWorkflow(Long leaveBillId){
		if(StringUtils.isBlank(leaveBillId+"")){
			return renderError("参数错误，请联系管理员！");
		}
		SessionUser suser = this.getCurrentUser();
		
		try {
			leaveService.insertStartWorkflow(leaveBillId,suser);
		} catch (Exception e) {
			e.printStackTrace();
			return renderError("未知错误，启动失败！");
		}
		
		return renderSuccess("启动成功！");
	}
	
	/**
	 * 个人任务列表界面
	 */
	@RequestMapping("/personTaskList")
	public String personTaskList(){
		return "oa/leave/workflow/personTaskList";
	}
	
	@RequestMapping("/personTaskListDataGrid")
	@ResponseBody
	public Object personTaskListDataGrid(Integer page,Integer rows,String sort,String order){
		PageInfo pi = new PageInfo(page,rows,sort,order);
		SessionUser suser = this.getCurrentUser();
		Map<String,Object> params = new HashMap<String,Object>();
		params.put("order", order);
		params.put("sort", sort);
		params.put("assignee", suser.getLoginName());
		pi.setCondition(params);
		
		leaveService.selectProcessTaskDataGrid(pi);
		
		return pi;
	}
	
	/**
	 * 流程办理界面
	 */
	@RequestMapping("/presonTaskPage")
	public String presonTaskPage(Long id,String taskId){
		LeaveBill leaveBill = leaveService.selectLeaveBillById(id);
		this.setRequestAttribute("leaveBill", leaveBill);
		
		//获取可选出口
		List<String> outComeList = workflowService.selectOutComeListByTaskId(taskId);
		log.debug("outComeList="+outComeList);
		this.setRequestAttribute("outComeList", outComeList);
		
		//获取审批日志
		List<Comment> commentList = workflowService.selectCommentByTaskId(taskId);
		this.setRequestAttribute("commentList", commentList);
		
		this.setRequestAttribute("taskId", taskId);
		
		return "oa/leave/workflow/presonTask";
	}
}
