<!-- 请假   个人任务列表 -->
<%@ page language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="/common.jsp" %>
<script type="text/javascript">
var dataGrid;
$(function() {
	dataGrid = $('#dataGrid').datagrid({
	    url : '${pageContext.request.contextPath }/leave/personTaskListDataGrid.do',
	    striped : true, //是否显示斑马线效果
	    rownumbers : true,//如果为true，则显示一个行号列
	    pagination : true,//控件底部显示分页工具栏
	    singleSelect : true,
	    idField : 'id',
	    sortName : 'taskCreateTime',
	    sortOrder : 'asc',
	    pageSize : 20,
	    pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
	    frozenColumns : [ [ {
	        width : '100',
	        title : 'id',
	        field : 'id',
	    }, {
            width : '100',
            title : '请假人',
            field : 'leavePeople'
        } , {
            width : '80',
            title : '请假天数',
            field : 'leaveDays'
        }, {
            width : '180',
            title : '请假时间',
            field : 'leaveTime'
        } , {
            width : '100',
            title : '请假状态',
            field : 'status',
            formatter : function(value, row, index) {
                switch (value) {// 0.保存,1.开始审批,2为审批通过，3审批不通过
                case 0:
                    return '保存';
                case 1:
                    return '审批中';
                case 2:
                    return '审批通过';
                case 3:
                    return '审批失败';
                }
            }
        }, {
	        width : '100',
	        title : '办理人',
	        field : 'taskPersion',
	    }  , {
	        width : '180',
	        title : '任务创建时间',
	        field : 'taskCreateTime',
	    } , {
	        field : 'action',
	        title : '操作',
	        width : 400,
	        formatter : function(value, row, index) {
	            var str = '';
	            		str += $.formatString('<a href="javascript:void(0)" class="persionTask-linkbutton-edit" data-options="plain:true,iconCls:\'icon-edit\'" onclick="transactFun(\'{0}\',\'{1}\');" >办理</a>', row.id,row.taskId);
	            		str += '&nbsp;|&nbsp;';
	                    str += $.formatString('<a href="javascript:void(0)" class="persionTask-linkbutton-eye" data-options="plain:true,iconCls:\'icon-eye\'" onclick="viewProcessImageFun(\'{0}\');" >查看流程图</a>', row.taskId);
	            return str;
	        }
	    } ] ],
	    onLoadSuccess:function(data){
	        $('.persionTask-linkbutton-edit').linkbutton({text:'办理',plain:true,iconCls:'icon-edit'});
	        $('.persionTask-linkbutton-eye').linkbutton({text:'查看流程图',plain:true,iconCls:'icon-eye'});
	    },
	    toolbar : '#toolbar'
	});
    
});

/**
* 查看流程图
*/
function viewProcessImageFun(id){
	if(id == undefined){
		var rows = dataGrid.datagrid('getSelections');
		id = row[0].id;
	}else{
		dataGrid.datagrid('unselectAll').datagrid('uncheckAll');
	}
	
	parent.$.modalDialog({
		title : '查看流程图',
		width : 800,
        height : 600,
        href : '${pageContext.request.contextPath }/workflow/viewImageUIByTaskId.do?taskId='+id+'&R='+new Date(),
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

/**
* 办理
**/
function transactFun(id,taskId){
	if (id == undefined) {//点击右键菜单才会触发这个
        var rows = dataGrid.datagrid('getSelections');
        id = rows[0].id;
    } else {//点击操作里面的删除图标会触发这个
        dataGrid.datagrid('unselectAll').datagrid('uncheckAll');
    }
    parent.$.modalDialog({
        title : '任务办理',
        width : 800,
        height : 500,
        href : '${pageContext.request.contextPath }/leave/presonTaskPage.do?id='+id+'&taskId='+taskId+'&R='+new Date(),
        buttons : [ {
        	text: '取消办理',
        	iconCls:'icon-cancel',
        	handler:function(){
        		parent.$.modalDialog.handler.dialog("destroy");
        		parent.$.modalDialog.handler = undefined;
        	}
        },{
            text : '确定办理',
            iconCls:'icon-ok',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = dataGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#personTaskForm');
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
                id : id
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
    <div data-options="region:'center',title:'我的待办列表'" >
        <table id="dataGrid" data-options="fit:true,border:false"></table>
    </div>
</body>
</html>