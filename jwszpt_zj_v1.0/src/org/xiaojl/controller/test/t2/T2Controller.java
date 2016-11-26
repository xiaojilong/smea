package org.xiaojl.controller.test.t2;

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

import org.xiaojl.service.test.t2.T2Service;

/** 
 * 类名称：T2Controller
 * 创建人：xiaojl
 * 创建时间：2016-06-24
 */
@Controller
@RequestMapping(value="/t2")
public class T2Controller extends BaseController {
	
	String menuUrl = "t2/list.do"; //菜单地址(权限用)
	@Resource(name="t2Service")
	private T2Service t2Service;
	
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	@ResponseBody
	public Json save() throws Exception{
		logBefore(logger, "新增T2");
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
			
			pd.put("T2_ID", this.get32UUID());	//主键
			pd.put("CREATE_TIME", Tools.date2Str(new Date())); 
			
			pd.put("CREATE_ACCOUNT", getCurrentUser().getUSERNAME()); //创建人
			
			
			pd.put("CREATE_NAME", getCurrentUser().getNAME()); //创建人姓名
			
			
			pd.put("CREATE_ORGANIZATION", getCurrentUser().getORGANIZATION());  //创建单位
			
			t2Service.save(pd);
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
		logBefore(logger, "删除T2");
		Json j = new Json();
		try {
			 //校验权限
			if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){
				j.setMsg("操作失败,您没有该业务的操作权限!");
				return j;
			}
			
			PageData pd = new PageData();
			pd = this.getPageData();
			t2Service.delete(pd);
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
		logBefore(logger, "修改T2");
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
			
			t2Service.edit(pd);
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
		logBefore(logger, "列表T2");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			page.setPd(pd);
			List<PageData>	varList = t2Service.list(page);	//列出T2列表
			mv.setViewName("test/t2/t2_list");
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
		logBefore(logger, "去新增T2页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			mv.setViewName("test/t2/t2_edit");
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
		logBefore(logger, "去修改T2页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd = t2Service.findById(pd);	//根据ID读取
			mv.setViewName("test/t2/t2_edit");
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
		logBefore(logger, "去查看T2详情页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd = t2Service.findById(pd);	//根据ID读取
			mv.setViewName("test/t2/t2_detail");
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
		logBefore(logger, "批量删除T2");
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
				t2Service.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, "导出T2到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			Map<String,Object> dataMap = new HashMap<String,Object>();
			List<String> titles = new ArrayList<String>();
			titles.add("姓名");	//1
			titles.add("年龄");	//2
			titles.add("创建时间");	//3
			titles.add("创建人");	//4
			titles.add("创建人姓名");	//5
			titles.add("创建单位");	//6
			dataMap.put("titles", titles);
			List<PageData> varOList = t2Service.listAll(pd);
			List<PageData> varList = new ArrayList<PageData>();
			for(int i=0;i<varOList.size();i++){
				PageData vpd = new PageData();
				vpd.put("var1", varOList.get(i).getString("NAME"));	//1
				vpd.put("var2", varOList.get(i).get("AGE").toString());	//2
				vpd.put("var3", varOList.get(i).getString("CREATE_TIME"));	//3
				vpd.put("var4", varOList.get(i).getString("CREATE_ACCOUNT"));	//4
				vpd.put("var5", varOList.get(i).getString("CREATE_NAME"));	//5
				vpd.put("var6", varOList.get(i).getString("CREATE_ORGANIZATION"));	//6
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
