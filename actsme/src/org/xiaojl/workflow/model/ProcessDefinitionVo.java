package org.xiaojl.workflow.model;


public class ProcessDefinitionVo {
//	 System.out.println("流程定义ID:" + pd.getId());// 流程定义的key+版本+随机生成数  
//     System.out.println("流程定义的名称:" + pd.getName());// 对应helloworld.bpmn文件中的name属性值  
//     System.out.println("流程定义的key:" + pd.getKey());// 对应helloworld.bpmn文件中的id属性值  
//     System.out.println("流程定义的版本:" + pd.getVersion());// 当流程定义的key值相同的相同下，版本升级，默认1  
//     System.out.println("资源名称bpmn文件:" + pd.getResourceName());  
//     System.out.println("资源名称png文件:" + pd.getDiagramResourceName());  
//     System.out.println("部署对象ID：" + pd.getDeploymentId());  
     
     private String id;
     private String name;
     private String key;
     private Integer version;
     
	private String resourceName;
     private String diagramResourceName;
     private String deploymentId;
     
    public Integer getVersion() {
 		return version;
 	}
 	public void setVersion(Integer version) {
 		this.version = version;
 	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getResourceName() {
		return resourceName;
	}
	public void setResourceName(String resourceName) {
		this.resourceName = resourceName;
	}
	public String getDiagramResourceName() {
		return diagramResourceName;
	}
	public void setDiagramResourceName(String diagramResourceName) {
		this.diagramResourceName = diagramResourceName;
	}
	public String getDeploymentId() {
		return deploymentId;
	}
	public void setDeploymentId(String deploymentId) {
		this.deploymentId = deploymentId;
	}
	@Override
	public String toString() {
		return "ProcessDefinitionVo [id=" + id + ", name=" + name + ", key="
				+ key + ", version=" + version + ", deploymentId="
				+ deploymentId + ", diagramResourceName=" + diagramResourceName
				+ ", resourceName=" + resourceName + "]";
	}
     
}
