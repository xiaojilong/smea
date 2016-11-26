<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<%@include file="../../common.jsp" %>
 <script type="text/javascript">
 //确保能跳转到最外层的窗口，而不是iframe等窗口
<%-- if (window != top){--%>
<%--	top.location.href = location.href;--%>
<%-- }--%>
<%-- --%>
$(function() {
	parent.$.messager.progress('close');
 })
 </script> 
  <body>
  	<h4>${user.loginName},您没有访问/执行该操作的权限,如有疑问,请联系管理员!</h4>
  </body>
</html>
