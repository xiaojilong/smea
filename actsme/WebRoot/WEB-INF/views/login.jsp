<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <%@include file="/common.jsp" %>
<script type="text/javascript">
 // 判断时候在Iframe框架内,在则刷新父页面
if (window != top) 
	top.location.href = location.href; 
 
$(function () {
	$('#loginForm').form({
        url:'${pageContext.request.contextPath }/framework/login.do',
        onSubmit : function() {
            progressLoad();
            var isValid = $(this).form('validate');
            if(!isValid){
                progressClose();
            }
            return isValid;
        },
        success:function(result){
            progressClose();
            result = $.parseJSON(result);
            if (result.success) {
                window.location.href = '${pageContext.request.contextPath }/framework/index.do';
            }else{
            	$.messager.alert('提示', result.msg, 'error');
            }
        }
    });
	
})
function submitForm(){
    $('#loginForm').submit();
}
function clearForm(){
    $('#loginForm').form('clear');
}
 </script> 
  <body>
    <div id="w" class="easyui-window" title="请先登录" 
    	data-options="modal:true,closed:false,iconCls:'icon-man',closable:false,minimizable:false" style="width:400px;top:200px;padding:20px 70px 20px 70px;">
        <form id="loginForm" method="post"> 
	        <div style="margin-bottom:10px">
	            <input class="easyui-textbox" id="username" name="username" style="width:100%;height:30px;padding:12px" 
	            	value="admin"
	            	data-options="prompt:'请输入登录账号',iconCls:'icon-man',iconWidth:38,required:true">
	        </div>
	        <div style="margin-bottom:20px">
	            <input class="easyui-textbox" id="password" name="password" type="password" style="width:100%;height:30px;padding:12px" 
	            	value="1"
	            	data-options="prompt:'请输入登录密码',iconCls:'icon-lock',iconWidth:38,required:true">
	        </div>
<%--	        <div style="margin-bottom:20px">--%>
<%--	            <input class="easyui-textbox" type="text" id="logyzm" style="width:50%;height:30px;padding:12px" data-options="prompt:'验证码'"> <a href="javascript:;" class="showcode" onclick="changeVeryfy()"><img style=" margin:0 0 0 3px ; vertical-align:middle; height:26px;" src="/index.php?s=/Xjadmin/verifyCode"></a>--%>
<%--	        </div>--%>
	        <div>
	            <a href="javascript:;" onclick="submitForm()" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" style="padding:5px 0px;width:100%;">
	                <span style="font-size:14px;">登录</span>
	            </a>
	        </div>
        </form> 
    </div>    
  </body>
</html>
