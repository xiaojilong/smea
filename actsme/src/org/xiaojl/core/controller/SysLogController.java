package org.xiaojl.core.controller;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xiaojl.commons.utils.StringUtils;
import org.xiaojl.core.model.result.PageInfo;
import org.xiaojl.core.model.vo.SysLogVO;
import org.xiaojl.core.service.SysLogService;


@Controller
@RequestMapping("/sysLog")
public class SysLogController extends BaseController {
	private Log log = LogFactory.getLog(this.getClass());
	
	@Autowired
	private SysLogService sysLogService;
	
	@RequestMapping("/dataGrid")
	@ResponseBody
	public Object dataGrid(SysLogVO sysLogVo,Integer page, Integer rows){
		PageInfo pi = new PageInfo(page,rows);
		Map<String,Object> condition = new HashMap<String,Object>();
		if(StringUtils.isNotBlank(sysLogVo.getLoginName())){
			condition.put("loginName","%"+sysLogVo.getLoginName()+"%");
		}
		if(StringUtils.isNotBlank(sysLogVo.getRoleName())){
			condition.put("roleName","%"+sysLogVo.getRoleName()+"%");
		}
		if(StringUtils.isNotBlank(sysLogVo.getClientIp())){
			condition.put("clientIp","%"+sysLogVo.getClientIp()+"%");
		}
		if(StringUtils.isNotBlank(sysLogVo.getOptContent())){
			condition.put("optContent","%"+sysLogVo.getOptContent()+"%");
		}
		if(sysLogVo.getCreatedateStart()!=null){
			condition.put("createDateStart",sysLogVo.getCreatedateStart());
		}
		if(sysLogVo.getCreatedateEnd()!=null){
			condition.put("createDateEnd",sysLogVo.getCreatedateEnd());
		}
		pi.setCondition(condition);
		sysLogService.selectAll(pi);
		return pi;
	}
	
	@RequestMapping("/portalSysLog")
	public String portalSysLog(){
		return "framework/portal/syslog";
	}
	
	@RequestMapping("/manager")
	public String manager(){
		return "admin/syslog";
	}
}
