<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<%@include file="../../common.jsp" %>
 <script type="text/javascript">
 //确保能跳转到最外层的窗口，而不是iframe等窗口
 if (window != top){
	top.location.href = location.href;
 }
 
$(function() {
	parent.$.messager.progress('close');
 })
 function gotoLoginPage(){
	 window.location = "${pageContext.request.contextPath }/framework/loginPage.do";
 }
 </script> 
  <body>
  	<div id="ww" class="easyui-window" title="未登录" 
    	data-options="modal:true,closed:false,iconCls:'monitor_delete',closable:false,minimizable:false" style="width:400px;padding:20px 70px 20px 70px;">
    		<div style="margin-bottom:30px">
    			<h2><font color="red">您的登录信息已失效，请重新登录!</font></h2>
	        </div>
	        <div>
	            <a href="javascript:;" onclick="gotoLoginPage()" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" style="padding:10px 0px;width:100%;">
	                <span style="font-size:14px;">进入登录界面</span>
	            </a>
	        </div>
    </div>
  </body>
</html>
