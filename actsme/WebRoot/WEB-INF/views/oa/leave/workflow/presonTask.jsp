<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
    $(function() {
    	progressClose();
    	
    	$('#SubmitBtn').bind('click', function(){    
        	alert('easyui'); 
        	$('#personTaskForm').form({
	            url : '${pageContext.request.contextPath }/leave/personTask.do',
	            onSubmit : function() {
	                progressLoad();
	                var isValid = $(this).form('validate');
	                if (!isValid) {
	                    progressClose();
	                }
	                return isValid;
	            },
	            success : function(result) {
	                progressClose();
	                result = $.parseJSON(result);
	                if (result.success) {
	                	parent.$.messager.alert('提示', result.msg, 'info');
	                    parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为列表页面预定义好了
	                    parent.$.modalDialog.handler.dialog('close');
	                } else {
	                    parent.$.messager.alert('错误', result.msg, 'error');
	                }
	            }
	        });   
    	});    
        
    });
</script>
<div id="tt" class="easyui-tabs"  data-options="fit:true,border:false" >   
    <div title="业务表单信息" style="padding:20px;display:none;">
      	<form id="personTaskForm" method="post">   
	        <table width="100%">
				<tr>
					<td class="th">请假天数：</td>
					<td style="padding-left:10px;" width="30%">${leaveBill.leaveDays}</td>
					<td class="th">请假时间：</td>
					<td style="padding-left:10px;"  width="30%">${leaveBill.leaveTime}</td>
				</tr>
				<tr>
					<td class="th">请假内容：</td>
					<td style="padding-left:10px;" width="30%">${leaveBill.context}</td>
					<td class="th">备注：</td>
					<td style="padding-left:10px;"  width="30%">${leaveBill.remark}</td>
				</tr>
				<tr>
					<td class="th">审批状态</td>
					<td colspan="3" style="padding-left:10px;"  width="80%">
						<c:forEach var="key" items="${outComeList}" varStatus="status">
							<input type="radio" class="radio" name="outcome" value="${key}" id="sp${status.count}"/>
							<label for="sp${status.count}">&nbsp;${key}&nbsp;&nbsp;</label> 
						</c:forEach>
					</td>
				</tr>
				<tr>
					<td class="th">审批意见</td>
					<td colspan="3" style="padding-left:10px;"  width="80%">
						<textarea name="spyj" rows="" cols="" ></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="4" >
						<a id="SubmitBtn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">提交审批</a>
					</td>
				</tr>
			</table>
	  	</form>	
    </div>   
    <div title="审批日志信息" data-options="fit:true,border:false" >   
        <!-- 审批日志信息 -->
        <iframe src="${pageContext.request.contextPath }/workflow/commentListByTaskId.do?taskId=${taskId}" frameborder="0" style="border: 0; width: 100%; height: 96%;"></iframe> 
    </div>   
</div>