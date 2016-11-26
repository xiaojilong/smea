<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8" />
		<title></title>
		<meta name="description" content="overview & stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="static/css/bootstrap.min.css" rel="stylesheet" />
		<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="static/css/font-awesome.min.css" />
		<!-- 下拉框 -->
		<link rel="stylesheet" href="static/css/chosen.css" />
		
		<link rel="stylesheet" href="static/css/ace.min.css" />
		<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="static/css/ace-skins.min.css" />
		
		<link rel="stylesheet" href="static/css/datepicker.css" /><!-- 日期框 -->
		<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		
<script type="text/javascript">
	
	
	//保存
	function save(){
			if($("#CLUE_NAME").val()==""){
			$("#CLUE_NAME").tips({
				side:3,
	            msg:'请输入线索名称',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#CLUE_NAME").focus();
			return false;
		}
		if($("#CLUE_CONTENT").val()==""){
			$("#CLUE_CONTENT").tips({
				side:3,
	            msg:'请输入线索内容',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#CLUE_CONTENT").focus();
			return false;
		}
		if($("#CLUE_CREATETIME").val()==""){
			$("#CLUE_CREATETIME").tips({
				side:3,
	            msg:'请输入创建时间',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#CLUE_CREATETIME").focus();
			return false;
		}
		if($("#CLUE_CREATOR").val()==""){
			$("#CLUE_CREATOR").tips({
				side:3,
	            msg:'请输入创建人',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#CLUE_CREATOR").focus();
			return false;
		}
		if($("#CLUE_CRATOR_NAME").val()==""){
			$("#CLUE_CRATOR_NAME").tips({
				side:3,
	            msg:'请输入创建人姓名',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#CLUE_CRATOR_NAME").focus();
			return false;
		}
		if($("#CLUE_CREATE_DEPT").val()==""){
			$("#CLUE_CREATE_DEPT").tips({
				side:3,
	            msg:'请输入创建部门',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#CLUE_CREATE_DEPT").focus();
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<form action="clue/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="CLUE_ID" id="CLUE_ID" value="${pd.CLUE_ID}"/>
		<div id="zhongxin">
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">线索名称:</td>
				<td><input type="text" name="CLUE_NAME" id="CLUE_NAME" value="${pd.CLUE_NAME}" maxlength="32" placeholder="这里输入线索名称" title="线索名称"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">线索内容:</td>
				<td><input type="text" name="CLUE_CONTENT" id="CLUE_CONTENT" value="${pd.CLUE_CONTENT}" maxlength="32" placeholder="这里输入线索内容" title="线索内容"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">创建时间:</td>
				<td><input class="span10 date-picker" name="CLUE_CREATETIME" id="CLUE_CREATETIME" value="${pd.CLUE_CREATETIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="创建时间" title="创建时间"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">创建人:</td>
				<td><input type="text" name="CLUE_CREATOR" id="CLUE_CREATOR" value="${pd.CLUE_CREATOR}" maxlength="32" placeholder="这里输入创建人" title="创建人"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">创建人姓名:</td>
				<td><input type="text" name="CLUE_CRATOR_NAME" id="CLUE_CRATOR_NAME" value="${pd.CLUE_CRATOR_NAME}" maxlength="32" placeholder="这里输入创建人姓名" title="创建人姓名"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">创建部门:</td>
				<td><input type="text" name="CLUE_CREATE_DEPT" id="CLUE_CREATE_DEPT" value="${pd.CLUE_CREATE_DEPT}" maxlength="32" placeholder="这里输入创建部门" title="创建部门"/></td>
			</tr>
			<tr>
				<td style="text-align: center;" colspan="10">
					<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
				</td>
			</tr>
		</table>
		</div>
		
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
		
	</form>
	
	
		<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/js/ace-elements.min.js"></script>
		<script src="static/js/ace.min.js"></script>
		<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
		<script type="text/javascript" src="static/js/bootstrap-datepicker.min.js"></script><!-- 日期框 -->
		<script type="text/javascript">
		$(top.hangge());
		$(function() {
			
			//单选框
			$(".chzn-select").chosen(); 
			$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
			
			//日期框
			$('.date-picker').datepicker();
			
		});
		
		</script>
</body>
</html>