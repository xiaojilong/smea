<!-- 流程定义列表 -->
<%@ page language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="/common.jsp" %>
<script type="text/javascript">
var dataGrid;
$(function() {
	progressClose();
	
    dataGrid = $('#dataGrid').datagrid({
        url : '${pageContext.request.contextPath }/workflow/processDefinitionDataGrid.do?deploymentId=${deploymentId}&R='+new Date(),
        striped : true,
        rownumbers : true,
        pagination : true,
        singleSelect : true,
        idField : 'id',
        sortName : 'deploymentTime',
        sortOrder : 'asc',
        pageSize : 20,
        pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
        columns : [ [ {
            title : 'id',
            field : 'id',
            width:100
        }, {
            title : '流程Key',
            field : 'key',
            width:120
        } , {
            title : '流程名称',
            field : 'name',
            width:200
        } , {
            title : '版本号',
            field : 'version',
            width:90
        }, {
            title : '类别',
            field : 'category',
            width:90
        } , {
            title : 'DeploymentId',
            field : 'deploymentId',
            sortable : false,
            width:150
        }, {
            title : 'ResourceName',
            field : 'diagramResourceName',
            sortable : false,
            width:150
        }, {
            field : 'action',
            title : '操作',
            width:200,
            formatter : function(value, row, index) {
                var str = '';
                	str += $.formatString('<a href="javascript:void(0)" class="pdl-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'icon-eye\'" onclick="viewImageFun(\'{0}\');" >查看流程图</a>', row.deploymentId);
                return str;
            }
        } ] ],
        onLoadSuccess:function(data){
        	$('.pdl-easyui-linkbutton-edit').linkbutton({text:'查看流程图',plain:true,iconCls:'icon-eye'});
        },
        toolbar : '#toolbar'
    });
});

function viewImageFun(deploymentId) {
    parent.$.modalDialog({
        title : '查看流程图',
        width : 800,
        height : 600,
        href : '${pageContext.request.contextPath }/workflow/viewImageUI.do?deploymentId='+deploymentId+'&R='+new Date(),
        buttons : [{
        	text : ' 关  闭  ',
        	iconCls:'icon-cancel',
        	handler:function(){
        		parent.$.modalDialog.handler.dialog('destroy');
        		parent.$.modalDialog.handler = undefined;
        	}
        } ]
    });
}

</script>
<div class="easyui-layout" data-options="fit:true,border:false" >
    <div data-options="region:'center',fit:true,border:false">
        <table id="dataGrid" data-options="fit:true,border:false"></table>
    </div>
</div>
</html>