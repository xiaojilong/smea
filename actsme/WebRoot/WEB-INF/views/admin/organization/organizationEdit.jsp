<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
$(function() {
    progressClose();
    $('#icon').combobox({
		data : $.iconData,
		formatter : function(v) {
			return $.formatString('<span class="{0}" style="display:inline-block;vertical-align:middle;width:16px;height:16px;"></span>{1}', v.value, v.value);
		},
		value : '${organization.icon}'
	});
    
    $('#pid').combotree({
        url : '${pageContext.request.contextPath }/organization/tree.do?flag=false',
        parentField : 'pid',
        lines : true,
        panelHeight : 'auto',
        value :'${organization.pid}'
    });
    
    $('#organizationEditForm').form({
        url : '${pageContext.request.contextPath }/organization/edit.do',
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
                parent.$.modalDialog.openner_treeGrid.treegrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_treeGrid这个对象，是因为organization.jsp页面预定义好了
                parent.$.modalDialog.handler.dialog('close');
            }else{
            	 parent.$.messager.alert('错误', result.msg, 'error');
            }
        }
    });
    
});
</script>
<div style="padding: 3px;">
    <form id="organizationEditForm" method="post">
        <table class="grid">
            <tr>
                <td>编号</td>
                <td><input name="id" type="hidden"  value="${organization.id}"><input name="code" type="text" value="${organization.code}" /></td>
                <td>资源名称</td>
                <td><input name="name" type="text" value="${organization.name}" placeholder="请输入部门名称" class="easyui-validatebox" data-options="required:true" ></td>
            </tr>
            <tr>
                <td>排序</td>
                <td><input name="seq"  class="easyui-numberspinner" value="${organization.seq}" style="widtd: 140px; height: 29px;" required="required" data-options="editable:false"></td>
                <td>菜单图标</td>
                <td ><input id="icon" name="icon" style="width: 200px; height: 29px;" data-options="editable:false" /></td>
            </tr>
            <tr>
                <td>地址</td>
                <td colspan="3"><input  name="address" style="width: 300px;" value="${organization.address}"/></td>
            </tr>
            <tr>
                <td>上级部门</td>
                <td colspan="3"><select id="pid" name="pid" style="width: 200px; height: 29px;"></select>
                <a class="easyui-linkbutton" href="javascript:void(0)" onclick="$('#pid').combotree('clear');" >清空选择</a></td>
            </tr>
        </table>
    </form>
</div>
