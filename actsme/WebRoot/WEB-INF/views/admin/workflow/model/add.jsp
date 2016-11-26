<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
    $(function() {
    	//progressClose();
    	
    	$('#category').combobox({
    		url : '${pageContext.request.contextPath }/processType/comboboxData.do',
            valueField : 'code',
            textField : 'name',
            onLoadSuccess : function() {
				progressClose();
			}
		});
        
        $('#wfMdoelAddForm').form({
            url : '${pageContext.request.contextPath }/workflowModel/add.do',
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
	    <form id="wfMdoelAddForm" method="post">  
	    	<table width="100%">
				<tr>
					<td class="th">名称：</td>
					<td style="padding-left:10px;" width="80%">
						<input name="name" type="text" placeholder="请输入名称" class="easyui-validatebox span2" data-options="required:true,missingMessage:'名称必填'" value="">
					</td>
				</tr>
				<tr>	
					<td class="th">KEY：</td>
					<td style="padding-left:10px;"  width="80%">
						<input name="key" type="text" class="easyui-validatebox span2" data-options="required:true,missingMessage:'KEY必填'" />
					</td>
				</tr>
				<tr>	
					<td class="th">流程类型：</td>
					<td style="padding-left:10px;"  width="80%">
						<input id="category" name="category" class="easyui-combobox" data-options="required:true,missingMessage:'请选择流程类型',editable:false" />
					</td>
				</tr>
				<tr>	
					<td class="th">描述：</td>
					<td style="padding-left:10px;"  width="80%">
						<textarea id="description" name="description"></textarea>
					</td>
				</tr>
	        </table>  
	    </form>  
    </div>
</div>