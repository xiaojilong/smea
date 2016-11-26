<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
    $(function() {
    	parent.$.messager.progress('close');
    	
        $('#startWorkflowForm').form({
            url : '${pageContext.request.contextPath }/leave/startWorkflow.do',
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
                    parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
                    parent.$.modalDialog.handler.dialog('close');
                } else {
                    parent.$.messager.alert('错误', result.msg, 'error');
                }
            }
        });
    });
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
        <form id="startWorkflowForm" method="post">
        	<input name="leaveBillId" type="hidden"  value="${leaveBill.id}">
            <table class="grid">
            	<tr>
                    <td>请假人</td>
                    <td>${leaveBill.leavePeople}</td>
                </tr>
                <tr>
                    <td>请假天数</td>
                    <td>${leaveBill.leaveDays}天</td>
                </tr>
                <tr>
                	<td>请假时间</td>
                	<td>${leaveBill.leaveTime}</td>
                </tr>
                <tr>
                    <td>请假内容</td>
                    <td colspan="3">${leaveBill.context}</td>
                </tr>
                <tr>
                    <td>备注</td>
                    <td colspan="3">${leaveBill.remark}</td>
                </tr>
            </table>
        </form>
    </div>
</div>