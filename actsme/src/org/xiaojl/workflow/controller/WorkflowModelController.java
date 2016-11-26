package org.xiaojl.workflow.controller;

import java.io.ByteArrayInputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.activiti.bpmn.converter.BpmnXMLConverter;
import org.activiti.bpmn.model.BpmnModel;
import org.activiti.editor.constants.ModelDataJsonConstants;
import org.activiti.editor.language.json.converter.BpmnJsonConverter;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.Model;
import org.activiti.engine.repository.ModelQuery;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xiaojl.core.controller.BaseController;
import org.xiaojl.core.model.result.PageInfo;

import sun.misc.BASE64Encoder;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;

/**
 * 流程模型控制器
 */
@Controller
@RequestMapping(value = "/workflowModel")
public class WorkflowModelController extends BaseController{
    protected Log logger = LogFactory.getLog(getClass());

    @Autowired  
    RepositoryService repositoryService;  
    
    /** 
     * 模型列表页面
     */
    @RequestMapping("/manager")
    public String manager(){
    	return "admin/workflow/model/modelList";
    }
    
    /** 
     * 模型列表数据
     */  
    @ResponseBody  
    @RequestMapping("dataGrid")  
    public Object dataGrid(Integer page,Integer rows,String sort,String order) {  
    	logger.debug("请求参数：sort="+sort+",order="+order);//sort=createTime,order=asc
    	PageInfo pi = new PageInfo(page,rows,sort,order);
    	ModelQuery  mq = repositoryService.createModelQuery();
    	//总记录数
    	Long total = repositoryService.createModelQuery().count();
    	//排序
    	if(StringUtils.isNoneBlank(sort)){
    		if("createTime".equals(sort)){
    			mq = mq.orderByCreateTime();
    		}
    		if("key".equals(sort)){
    			mq = mq.orderByModelKey();
    		}
    		if("name".equals(sort)){
    			mq = mq.orderByModelName();
    		}
    		
    		if(StringUtils.isNoneBlank(order) && "asc".equals(order)){
        		mq = mq.asc();
        	}else{
        		mq = mq.desc();
        	}
    	}
    	
        List<Model> list = mq.listPage(pi.getFrom(), pi.getSize()); 
        
        pi.setRows(list);
        pi.setTotal(total.intValue());
        
        return pi;  
    }  
    
    @RequestMapping("/addPage")
    public String addPage(){
    	return "admin/workflow/model/add";
    }
  
    /** 
     * 创建模型 
     */  
    @RequestMapping("add")  
    @ResponseBody
    public Object add(String name,String key,String category, String description, HttpServletRequest request, HttpServletResponse response) {  
        try {  
            ObjectMapper objectMapper = new ObjectMapper();  
            ObjectNode editorNode = objectMapper.createObjectNode();  
            editorNode.put("id", "canvas");  
            editorNode.put("resourceId", "canvas");  
            ObjectNode stencilSetNode = objectMapper.createObjectNode();  
            stencilSetNode.put("namespace", "http://b3mn.org/stencilset/bpmn2.0#");  
            editorNode.put("stencilset", stencilSetNode);  
            Model modelData = repositoryService.newModel();  
  
            ObjectNode modelObjectNode = objectMapper.createObjectNode();  
            modelObjectNode.put(ModelDataJsonConstants.MODEL_NAME, name);  
            modelObjectNode.put(ModelDataJsonConstants.MODEL_REVISION, 1);  
            description = StringUtils.defaultString(description);  
            modelObjectNode.put(ModelDataJsonConstants.MODEL_DESCRIPTION, description);  
            modelData.setMetaInfo(modelObjectNode.toString());  
            modelData.setName(name);  
            modelData.setCategory(category);
            modelData.setKey(StringUtils.defaultString(key));  
  
            //保存模型  
            repositoryService.saveModel(modelData);  
            repositoryService.addModelEditorSource(modelData.getId(), editorNode.toString().getBytes("utf-8"));  
              
            return renderSuccess("模型创建成功！");
            
        } catch (Exception e) {  
            logger.error("创建模型失败：", e); 
            return renderError("未知错误，模型创建失败！");
        }  
    }  
  
    /** 
     * 根据Model部署流程 
     */  
    @ResponseBody  
    @RequestMapping("deploy")  
    public Object deploy(String modelId) {  
        try {  
            Model modelData = repositoryService.getModel(modelId);  
            ObjectNode modelNode = (ObjectNode) new ObjectMapper().readTree(repositoryService.getModelEditorSource(modelData.getId()));  
            logger.debug("modelNode = "+modelNode);//中文正常
            byte[] bpmnBytes = null;  
  
            //BpmnModel model = new BpmnJsonConverter().convertToBpmnModel(modelNode);  
            BpmnJsonConverter bjc = new BpmnJsonConverter();
            BpmnModel model = bjc.convertToBpmnModel(modelNode);
            
            //bpmnBytes = new BpmnXMLConverter().convertToXML(model);
            BpmnXMLConverter bxc = new BpmnXMLConverter();
            bpmnBytes = bxc.convertToXML(model); //"UTF-8"
            
            String bpmn = new String(bpmnBytes,"UTF-8");
            logger.debug(bpmn);
            String processName = modelData.getName() + ".bpmn20.xml";  
            String name = modelData.getName();
            
            Deployment deployment = repositoryService.createDeployment()
            										.name(name)
            										.addString(processName, bpmn)
            										.deploy();  
            
            return renderSuccess("部署成功，部署ID=" + deployment.getId());
        } catch (Exception e) {  
            logger.error("根据模型部署流程失败：modelId={"+modelId+"}", e);  
            
            return renderError("模型部署流程失败");
        }  
    }  
  
    /** 
     * 导出model的xml文件 
     */  
    @RequestMapping("export")  
    public void export(String modelId, HttpServletResponse response) {  
        try {  
            Model modelData = repositoryService.getModel(modelId);  
            BpmnJsonConverter jsonConverter = new BpmnJsonConverter();  
            JsonNode editorNode = new ObjectMapper().readTree(repositoryService.getModelEditorSource(modelData.getId()));  
            BpmnModel bpmnModel = jsonConverter.convertToBpmnModel(editorNode);  
            BpmnXMLConverter xmlConverter = new BpmnXMLConverter();  
            byte[] bpmnBytes = xmlConverter.convertToXML(bpmnModel);  
  
            ByteArrayInputStream in = new ByteArrayInputStream(bpmnBytes);  
            IOUtils.copy(in, response.getOutputStream());  
            String filename = bpmnModel.getMainProcess().getId() + ".bpmn20.xml";  
            response.setHeader("Content-Disposition", "attachment; filename=" + filename);  
            response.flushBuffer();  
            
        } catch (Exception e) {  
            logger.error("导出model的xml文件失败：modelId={"+modelId+"}", e);  
        }  
    }  
  
    @RequestMapping(value = "delete")
    @ResponseBody
    public Object delete(String modelId) {  
        try {
        	if(StringUtils.isNoneBlank(modelId)){
        		repositoryService.deleteModel(modelId);
        	}else{
        		return renderError("参数错误！");
        	}
		} catch (Exception e) {
			e.printStackTrace();
			return renderError("未知错误，删除失败！");
		}  
		
		return renderSuccess("删除成功！");
    }  
    
    /**
     * 流程模板设计保存后，跳转的中间页面
     */
    @RequestMapping("/modelEditClosePage")
    public String modelEditClosePage(Long modelId){
    	this.setRequestAttribute("modelId", modelId);
    	return "admin/workflow/model/modelSavePage";
    }
} 