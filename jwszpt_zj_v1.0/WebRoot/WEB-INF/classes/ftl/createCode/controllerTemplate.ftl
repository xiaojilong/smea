package org.xiaojl.controller.${packageName}.${objectNameLower};

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.xiaojl.controller.base.BaseController;
import org.xiaojl.entity.Page;
import org.xiaojl.util.Const;
import org.xiaojl.util.Json;
import org.xiaojl.util.Jurisdiction;
import org.xiaojl.util.ObjectExcelView;
import org.xiaojl.util.PageData;
import org.xiaojl.util.Tools;
import net.sf.json.JSONObject;

import org.xiaojl.service.${packageName}.${objectNameLower}.${objectName}Service;

/** 
 * 类名称：${objectName}Controller
 * 创建人：xiaojl
 * 创建时间：${nowDate?string("yyyy-MM-dd")}
 */
@Controller
@RequestMapping(value="/${objectNameLower}")
public class ${objectName}Controller extends BaseController {
	
	String menuUrl = "${objectNameLower}/list.do"; //菜单地址(权限用)
	@Resource(name="${objectNameLower}Service")
	private ${objectName}Service ${objectNameLower}Service;
	
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	@ResponseBody
	public Json save() throws Exception{
		logBefore(logger, "新增${objectName}");
		Json j = new Json();
		try {
			 //校验权限
			if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){
				j.setMsg("操作失败,您没有该业务的操作权限!");
				return j;
			}
			PageData pd = new PageData();
			pd = this.getPageData();
			String jsonData = pd.getString("jsonData");
			JSONObject jsonObj = new JSONObject().fromObject(jsonData);
			//json对象值 存入pd 对象
			Iterator<String> jsonKeyName = jsonObj.keys();
			String key = "";
			while(jsonKeyName.hasNext()){
				key = jsonKeyName.next();
				pd.put(key, jsonObj.get(key));
			}
			
			pd.put("${objectNameUpper}_ID", this.get32UUID());	//主键
	<#list fieldList as var>
		<#if var[3] == "否">
			<#if var[1] == 'Date'>
			pd.put("${var[0]}", Tools.date2Str(new Date())); 
			<#else>
			
			<#if var[0] == 'CREATE_ACCOUNT'> 
			pd.put("${var[0]}", getCurrentUser().getUSERNAME()); //创建人
			<#elseif var[0] == 'CREATE_NAME'>  
			pd.put("${var[0]}", getCurrentUser().getNAME()); //创建人姓名
			<#elseif var[0] == 'CREATE_ORGANIZATION'>
			pd.put("${var[0]}", getCurrentUser().getORGANIZATION());  //创建单位
			<#else>
			pd.put("${var[0]}", "${var[7]?replace("无","")}"); 
			</#if>
			
			</#if>
		</#if> 
	</#list>
			${objectNameLower}Service.save(pd);
			j.setSuccess(true);
			j.setMsg("操作成功!");
			j.setObj(pd);
		} catch (Exception e) {
			e.printStackTrace();
			j.setMsg("操作失败,请联系管理员!");
		}
		
		return j ;
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value="/delete")
	@ResponseBody
	public Json delete(PrintWriter out){
		logBefore(logger, "删除${objectName}");
		Json j = new Json();
		try {
			 //校验权限
			if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){
				j.setMsg("操作失败,您没有该业务的操作权限!");
				return j;
			}
			
			PageData pd = new PageData();
			pd = this.getPageData();
			${objectNameLower}Service.delete(pd);
			j.setSuccess(true);
			j.setMsg("操作成功!");
			j.setObj(pd);
		} catch (Exception e) {
			e.printStackTrace();
			j.setMsg("操作失败,请联系管理员!");
		}
	
		return j ;
	}
	
	/**
	 * 修改
	 */
	@RequestMapping(value="/edit")
	@ResponseBody
	public Json edit() throws Exception{
		logBefore(logger, "修改${objectName}");
		Json j = new Json();
		try {
			 //校验权限
			if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){
				j.setMsg("操作失败,您没有该业务的操作权限!");
				return j;
			}
			PageData pd = new PageData();
			pd = this.getPageData();
			String jsonData = pd.getString("jsonData");
			JSONObject jsonObj = new JSONObject().fromObject(jsonData);
			//json对象值 存入pd 对象
			Iterator<String> jsonKeyName = jsonObj.keys();
			String key = "";
			while(jsonKeyName.hasNext()){
				key = jsonKeyName.next();
				pd.put(key, jsonObj.get(key));
			}
			
			${objectNameLower}Service.edit(pd);
			j.setSuccess(true);
			j.setMsg("操作成功!");
			j.setObj(pd);
		} catch (Exception e) {
			e.printStackTrace();
			j.setMsg("操作失败,请联系管理员!");
		}
	
		return j ;
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page){
		logBefore(logger, "列表${objectName}");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			page.setPd(pd);
			List<PageData>	varList = ${objectNameLower}Service.list(page);	//列出${objectName}列表
			mv.setViewName("${packageName}/${objectNameLower}/${objectNameLower}_list");
			mv.addObject("varList", varList);
			mv.addObject("pd", pd);
			mv.addObject(Const.SESSION_QX,this.getHC());	//按钮权限
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**
	 * 去新增页面
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd(){
		logBefore(logger, "去新增${objectName}页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			mv.setViewName("${packageName}/${objectNameLower}/${objectNameLower}_edit");
			mv.addObject("msg", "save");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	
	/**
	 * 去修改页面
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit(){
		logBefore(logger, "去修改${objectName}页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd = ${objectNameLower}Service.findById(pd);	//根据ID读取
			mv.setViewName("${packageName}/${objectNameLower}/${objectNameLower}_edit");
			mv.addObject("msg", "edit");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	
	/**
	 * 去详情页面
	 */
	@RequestMapping(value="/goDetail")
	public ModelAndView goDetail(){
		logBefore(logger, "去查看${objectName}详情页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd = ${objectNameLower}Service.findById(pd);	//根据ID读取
			mv.setViewName("${packageName}/${objectNameLower}/${objectNameLower}_detail");
			mv.addObject("msg", "edit");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	
	/**
	 * 批量删除
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Json deleteAll() {
		logBefore(logger, "批量删除${objectName}");
		Json j = new Json();
		try {
			 //校验权限
			if(!Jurisdiction.buttonJurisdiction(menuUrl, "dell")){
				j.setMsg("操作失败,您没有该业务的操作权限!");
				return j;
			}
			PageData pd = new PageData();		
			Map<String,Object> map = new HashMap<String,Object>();
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String DATA_IDS = pd.getString("DATA_IDS");
			if(null != DATA_IDS && !"".equals(DATA_IDS)){
				String ArrayDATA_IDS[] = DATA_IDS.split(",");
				${objectNameLower}Service.deleteAll(ArrayDATA_IDS);
			}
			pdList.add(pd);
			j.setSuccess(true);
			j.setMsg("操作成功!");
			j.setObj(pdList);
		} catch (Exception e) {
			e.printStackTrace();
			j.setMsg("操作失败,请联系管理员!");
		}
	
		return j ;
	}
	
	/*
	 * 导出到excel
	 * @return
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel(){
		logBefore(logger, "导出${objectName}到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			Map<String,Object> dataMap = new HashMap<String,Object>();
			List<String> titles = new ArrayList<String>();
	<#list fieldList as var>
			titles.add("${var[2]}");	//${var_index+1}
	</#list>
			dataMap.put("titles", titles);
			List<PageData> varOList = ${objectNameLower}Service.listAll(pd);
			List<PageData> varList = new ArrayList<PageData>();
			for(int i=0;i<varOList.size();i++){
				PageData vpd = new PageData();
	<#list fieldList as var>
			<#if var[1] == 'Integer'>
				vpd.put("var${var_index+1}", varOList.get(i).get("${var[0]}").toString());	//${var_index+1}
			<#else>
				vpd.put("var${var_index+1}", varOList.get(i).getString("${var[0]}"));	//${var_index+1}
			</#if>
	</#list>
				varList.add(vpd);
			}
			dataMap.put("varList", varList);
			ObjectExcelView erv = new ObjectExcelView();
			mv = new ModelAndView(erv,dataMap);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/* ===============================权限================================== */
	public Map<String, String> getHC(){
		Subject currentUser = SecurityUtils.getSubject();  //shiro管理的session
		Session session = currentUser.getSession();
		return (Map<String, String>)session.getAttribute(Const.SESSION_QX);
	}
	/* ===============================权限================================== */
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
