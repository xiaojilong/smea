<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
    $(function() {
    	progressClose();
    	
        $('#leaveAddForm').form({
            url : '${pageContext.request.contextPath }/leave/add.do',
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
<div class="easyui-layout" data-options="fit:true,border:false" >
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;" >
        <form id="leaveAddForm" method="post">
            <table class="grid">
                <tr>
                    <td>请假天数</td>
                    <td><input name="leaveDays" type="text" placeholder="请假天数" class="easyui-numberspinner" data-options="required:true" value=""></td>
                </tr>
                <tr>
                	<td>请假时间</td>
                	<td><input name="leaveTime" placeholder="点击选择请假时间" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly" /></td>
                </tr>
                <tr>
                    <td>请假内容</td>
                    <td colspan="3"><textarea name="context" rows="" cols="" ></textarea></td>
                </tr>
                <tr>
                    <td>备注</td>
                    <td colspan="3"><textarea name="remark" rows="" cols="" ></textarea></td>
                </tr>
            </table>
        </form>
    </div>
</div>