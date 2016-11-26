<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
    $(function() {
    	$('#icon').combobox({
			data : $.iconData,
			formatter : function(v) {
				return $.formatString('<span class="{0}" style="display:inline-block;vertical-align:middle;width:16px;height:16px;"></span>{1}', v.value, v.value);
			},
			value : '${resource.icon}'
		});
    	
        $('#pid').combotree({
            url : '${pageContext.request.contextPath }/resource/tree.do',
            parentField : 'pid',
            lines : true,
            panelHeight : 'auto',
            value : '${resource.pid}',
            onLoadSuccess : function() {
				parent.$.messager.progress('close');
			}
        });
        
        $('#resourceEditForm').form({
            url : '${pageContext.request.contextPath }/resource/edit.do',
            onSubmit : function() {
                parent.$.messager.progress({
					title : '提示',
					text : '数据处理中，请稍后....'
				});
                var isValid = $(this).form('validate');
                if (!isValid) {
                    parent.$.messager.progress('close');
                }
                return isValid;
            },
            success : function(result) {
                parent.$.messager.progress('close');
                result = $.parseJSON(result);
                if (result.success) {
                	parent.$.messager.alert('提示', result.msg, 'info');
                    parent.$.modalDialog.openner_treeGrid.treegrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_treeGrid这个对象，是因为resource.jsp页面预定义好了
                    parent.layout_west_tree.tree('reload');
                    parent.$.modalDialog.handler.dialog('close');
                }else{
                	parent.$.messager.alert('提示', result.msg, 'error');
                }
            }
        });

        $("#status").val('${resource.status}');
        $("#resourcetype").val('${resource.resourceType}');
    });
</script>
<div style="padding: 5px;">
    <form id="resourceEditForm" method="post">
        <table  class="grid">
            <tr>
                <td>资源名称</td>
                <td>
                    <input name="id" type="hidden"  value="${resource.id}" >
                    <input name="name" type="text" placeholder="请输入资源名称" value="${resource.name}" class="easyui-validatebox span2" data-options="required:true" >
                </td>
                <td>资源类型</td>
                <td>
                    <select id="resourcetype" name="resourceType" class="easyui-combobox" data-options="width:140,height:29,editable:false,panelHeight:'auto'">
                        <option value="0">菜单</option>
                        <option value="1">按钮</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>资源路径</td>
                <td><input name="url" type="text" value="${resource.url}" placeholder="请输入资源路径" class="easyui-validatebox span2" ></td>
                <td>排序</td>
                <td><input name="seq" value="${resource.seq}"  class="easyui-numberspinner" style="width: 140px; height: 29px;" required="required" data-options="editable:false"></td>
            </tr>
            <tr>
                <td>菜单图标</td>
                <td>
                	<input id="icon" name="icon" style="width: 200px; height: 29px;" data-options="editable:false" />
                </td>
                <td>状态</td>
                <td>
                    <select id="status" name="status" class="easyui-combobox" data-options="width:140,height:29,editable:false,panelHeight:'auto'">
                        <option value="0">正常</option>
                        <option value="1">停用</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>上级资源</td>
                <td colspan="3"><select id="pid" name="pid" style="width: 200px; height: 29px;"></select>
                <a class="easyui-linkbutton" href="javascript:void(0)" onclick="$('#pid').combotree('clear');" >清空选择</a></td>
            </tr>
        </table>
    </form>
</div>
