<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 自定义标签库：jsp按钮权限控制 -->
<%@ taglib prefix="myfst" uri="/WEB-INF/tlds/frameSecurityTag.tld" %>

<%--basePath
	http://localhost:8081/sme
 --%>
<c:set var="base" value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" />
<%--静态文件目录 --%>
<c:set var="path" value="${base}" />
<%--项目路径 --%>
<c:set var="staticPath" value="${base}" />
<!-- /sme -->
<c:set var="ctx" value="${base}" />
<head>
   <title>项目名称</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="spring,MVC,jquery,easyui">
	<!-- 修改web项目的favicon图标
	<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
　　<link rel="shortcut icon" href="${ctx }/static/images/Luffy.ico" type="image/x-icon" />
	 -->
	<!-- 引入easyUI -->
	<link id="easyuiTheme" rel="stylesheet" type="text/css" href="${ctx }/static/jquery-easyui-1.5/themes/<c:out value="${cookie.easyuiThemeName.value}" default="bootstrap"/>/easyui.css">
	<script type="text/javascript" src="${ctx }/static/jquery-easyui-1.5/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx }/static/jquery-easyui-1.5/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${ctx }/static/jquery-easyui-1.5/locale/easyui-lang-zh_CN.js"></script>
	
	<!-- 引入json包 
		JSON.parse(jsonstr); //可以将json字符串转换成json对象 
		JSON.stringify(jsonobj); //可以将json对象转换成json对符串 
	-->
	<script type="text/javascript" src="${ctx }/static/json2.js"></script>
	
	<!-- [my97日期时间控件] -->
	<script type="text/javascript" src="${ctx }/static/My97DatePicker/WdatePicker.js" charset="utf-8"></script>
	
	<!-- 引入EasyUI Portal插件 -->
	<link rel="stylesheet" href="${ctx }/static/jquery-easyui-portal/portal.css" type="text/css">
	<script type="text/javascript" src="${ctx }/static/jquery-easyui-portal/jquery.portal.js" charset="utf-8"></script>
	
	<!-- 扩展EasyUI -->
	<script type="text/javascript" src="${ctx }/static/extEasyUI.js?v=20161026" charset="utf-8"></script>
	
	<!-- 扩展EasyUI Icon -->
	<link rel="stylesheet" href="${ctx }/static/jquery-easyui-1.5/extIcon/extEasyuiIcon.css?v=20161026" type="text/css" charset="utf-8">
	
	<!-- 扩展jQuery -->
	<script type="text/javascript" src="${ctx }/static/extJquery.js?v=20161026" charset="utf-8"></script>
	
	<!-- 引入自定义样式 -->
	<link rel="stylesheet" href="${ctx }/static/my.css" type="text/css">
	
<script type="text/javascript">
/**
 * 页面加载加载进度条启用
 */
function progressLoad(){
	parent.$.messager.progress({
		title : '提示',
		text : '数据处理中，请稍后....'
	});
}
/**
 * 页面加载加载进度条关闭
 */
function progressClose(){
	parent.$.messager.progress('close');
}
</script>	
</head>