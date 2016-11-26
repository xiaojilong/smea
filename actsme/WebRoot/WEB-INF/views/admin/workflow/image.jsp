<%@ page language="java"  pageEncoding="UTF-8"%>
<script type="text/javascript">
$(function(){
	progressClose();
});
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
    	<!-- 1.获取到规则流程图 -->
		<img style="position: absolute;top: 0px;left: 0px;" src="${pageContext.servletContext.contextPath }/workflow/viewImage.do?deploymentId=${deploymentId}&diagramResourceName=${diagramResourceName}">
		
		<!-- 2.根据当前活动的坐标，动态绘制DIV -->
		<c:choose>
		    <c:when test="${acs!=null}">
				<div style="position: absolute;border:2px solid red;top:${acs.y-4 }px;left: ${acs.x-4 }px;width: ${acs.width+4 }px;height:${acs.height+4 }px;   "></div>
			</c:when>
		</c:choose>	
    </div>
</div>