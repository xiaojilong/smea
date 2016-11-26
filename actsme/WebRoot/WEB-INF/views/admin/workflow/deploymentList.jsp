<%@ page language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="/common.jsp" %>
<script type="text/javascript">
var dataGrid;
$(function() {
	dataGrid = $('#dataGrid').datagrid({
	    url : '${pageContext.request.contextPath }/workflow/deploymentDataGrid.do',
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
	        width : '80',
	        title : 'id',
	        field : 'id',
	    }, {
	        width : '100',
	        title : '流程名称',
	        field : 'name',
	    } , {
	        width : '150',
	        title : '部署时间',
	        field : 'deploymentTime',
	    } , {
	        width : '100',
	        title : '类别',
	        field : 'category',
	    }  , {
	        width : '100',
	        title : 'tenantId',
	        field : 'tenantId',
	    } , {
	        field : 'action',
	        title : '操作',
	        width : 200,
	        formatter : function(value, row, index) {
	            var str = '';
	                    //str += $.formatString('<a href="javascript:void(0)" class="deplyment-easyui-linkbutton-eye" data-options="plain:true,iconCls:\'icon-eye\'" onclick="queryProcessDefinitionFun(\'{0}\');" >查看流程定义</a>', row.id);
	                    //str += '&nbsp;|&nbsp;';
	                <myfst:frameSecurity link="/workflow/deleteDeployment.do">    
	                    str += $.formatString('<a href="javascript:void(0)" class="deplyment-easyui-linkbutton-del" data-options="plain:true,iconCls:\'icon-del\'" onclick="deleteFun(\'{0}\');" >删除流程定义</a>', row.id);
	                 </myfst:frameSecurity>     
	            return str;
	        }
	    } ] ],
	    onLoadSuccess:function(data){
	        $('.deplyment-easyui-linkbutton-eye').linkbutton({text:'查看流程定义',plain:true,iconCls:'icon-eye'});
	        $('.deplyment-easyui-linkbutton-del').linkbutton({text:'删除流程定义',plain:true,iconCls:'icon-del'});
	        
	        //清空流程定义列表数据
	        $("#processDfIframe").attr("src",'');
	    },
	    onClickRow:function(index,row){
	    	queryProcessDefinitionFun(row.id);
	    	$('#dataGrid').datagrid('selectRow',index);
	    },
	    toolbar : '#toolbar'
	});
    
});

function addFun() {
    parent.$.modalDialog({
        title : '部署流程',
        width : 500,
        height : 300,
        href : '${pageContext.request.contextPath }/workflow/deployPage.do',
        buttons : [ {
        	text: '取消部署',
        	iconCls:'icon-cancel',
        	handler:function(){
        		parent.$.modalDialog.handler.dialog("destroy");
        		parent.$.modalDialog.handler = undefined;
        	}
        },{
            text : '确定部署',
            iconCls:'icon-ok',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = dataGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#deployForm');
                f.submit();
            }
        } ]
    });
}


function deleteFun(id) {
    if (id == undefined) {//点击右键菜单才会触发这个
        var rows = dataGrid.datagrid('getSelections');
        id = rows[0].id;
    } else {//点击操作里面的删除图标会触发这个
        dataGrid.datagrid('unselectAll').datagrid('uncheckAll');
    }
    parent.$.messager.confirm('询问', '您是否要删除当前流程定义吗？', function(b) {
        if (b) {
            progressLoad();
            $.post('${pageContext.request.contextPath}/workflow/deleteDeployment.do', {
                deploymentId : id
            }, function(result) {
                if (result.success) {
                    parent.$.messager.alert('提示', result.msg, 'info');
                    dataGrid.datagrid('reload');
                }else{
                	parent.$.messager.alert('错误', result.msg, 'error');
                }
                progressClose();
            }, 'JSON');
        }
    });
}

function queryProcessDefinitionFun(id) {
	if (id == undefined) {//点击右键菜单才会触发这个
        var rows = dataGrid.datagrid('getSelections');
        id = rows[0].id;
    } else {//点击操作里面的删除图标会触发这个
        dataGrid.datagrid('unselectAll').datagrid('uncheckAll');
    }
	//console.info($("#processDfIframe"));
	$("#processDfIframe").attr("src","${pageContext.request.contextPath }/workflow/processDefinitionList.do?deploymentId=" + id+"&R="+new Date());
	
}
</script>
<body class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'north',split:true,collapsible:false,title:'流程部署列表'" style="height:50%;">
        <table id="dataGrid" data-options="fit:true,border:false"></table>
    </div>
    <div data-options="region:'center',title:'流程定义列表'" style="height:50%;">
    	<iframe id="processDfIframe" src="", frameborder="0" style="border: 0; width: 100%; height: 96%;"></iframe>
    </div>
    <div id="toolbar" style="display: none;">
    	<myfst:frameSecurity link="/workflow/addDeployment.do">
			<a onclick="addFun();"	href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'">部署流程</a>
		</myfst:frameSecurity>
    </div>
</body>
</html>