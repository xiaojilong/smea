<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="/common.jsp" %>
<script type="text/javascript">
    var dataGrid;
    $(function() {
        dataGrid = $('#dataGrid').datagrid({
            url : '${pageContext.request.contextPath }/leave/dataGrid.do',
            fit: true,
            striped : true,
            rownumbers : true,
            pagination : true,
            singleSelect : true,
            idField : 'id',
            sortName : 'id',
            sortOrder : 'asc',
            pageSize : 20,
            pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
            columns : [ [ {
                width : '100',
                title : 'id',
                field : 'id',
                sortable : true
            }, {
                width : '100',
                title : '请假人',
                field : 'leavePeople',
                sortable : true
            } , {
                width : '80',
                title : '请假天数',
                field : 'leaveDays',
                sortable : true
            }, {
                width : '80',
                title : '请假时间',
                field : 'leaveTime',
                sortable : true
            } , {
                width : '100',
                title : '请假状态',
                field : 'status',
                sortable : true,
                formatter : function(value, row, index) {
                    switch (value) {// 0.保存,1.审批中,2为审批通过，3审批不通过
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
                width : '200',
                title : '请假内容',
                field : 'context'
            }, {
                width : '200',
                title : '备注',
                field : 'remark'
            }, {
                field : 'action',
                title : '操作',
                width : 400,
                formatter : function(value, row, index) {
                    var str = '';
                            str += $.formatString('<a href="javascript:void(0)" class="leave-easyui-linkbutton-ok" data-options="plain:true,iconCls:\'icon-ok\'" onclick="startWorkflowFun(\'{0}\',\'{1}\');" >启动审批</a>', row.id,row.status);
                            
                   	  if(row.status==0){
                   	  	<myfst:frameSecurity link="/leave/edit.do">    
                            str += '&nbsp;|&nbsp;';
                            str += $.formatString('<a href="javascript:void(0)" class="leave-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'icon-edit\'" onclick="editFun(\'{0}\',\'{1}\');" >编辑</a>', row.id,row.status);
                        </myfst:frameSecurity>     
                        <myfst:frameSecurity link="/leave/delete.do">    
                            str += '&nbsp;|&nbsp;';
                            str += $.formatString('<a href="javascript:void(0)" class="leave-easyui-linkbutton-del" data-options="plain:true,iconCls:\'icon-del\'" onclick="deleteFun(\'{0}\',\'{1}\');" >删除</a>', row.id,row.status);
                         </myfst:frameSecurity>
                   	  }else{
                   	  	//commentList
                   	  	str += '&nbsp;|&nbsp;';
                        str += $.formatString('<a href="javascript:void(0)" class="leave-easyui-linkbutton-comment" data-options="plain:true,iconCls:\'icon-list\'" onclick="showCommentFun(\'{0}\',\'{1}\');" >审批日志</a>', row.id,row.status);
                   	  	
                   	  }
                             
                    return str;
                }
            } ] ],
            onLoadSuccess:function(data){
                $('.leave-easyui-linkbutton-ok').linkbutton({text:'启动审批',plain:true,iconCls:'icon-ok'});
                $('.leave-easyui-linkbutton-edit').linkbutton({text:'编辑',plain:true,iconCls:'icon-edit'});
                $('.leave-easyui-linkbutton-del').linkbutton({text:'删除',plain:true,iconCls:'icon-del'});
                $('.leave-easyui-linkbutton-comment').linkbutton({text:'审批日志',plain:true,iconCls:'icon-list'});
            },
            toolbar : '#toolbar'
        });
    });

/**
* 查看审批日志
*/
function showCommentFun(id,status){
	if(status=="0"){
		parent.$.messager.alert('提示', "该单据未启动审批流程，暂无审批日志!", 'info');
		return false;
	}
    if (id == undefined) {
        var rows = dataGrid.datagrid('getSelections');
        id = rows[0].id;
    } else {
        dataGrid.datagrid('unselectAll').datagrid('uncheckAll');
    }
    parent.$.modalDialog({
        title : '审批日志',
        width : 600,
        height : 300,
        href : '${pageContext.request.contextPath }/workflow/commentList.do?businessId='+id+'&key=LeaveBill&R='+new Date(),
        buttons : [ {
        	text: '关 闭',
        	iconCls:'icon-cancel',
        	handler:function(){
        		parent.$.modalDialog.handler.dialog("destroy");
        		parent.$.modalDialog.handler = undefined;
        	}
        } ]
    });
}

function addFun() {
    parent.$.modalDialog({
        title : '添加',
        width : 500,
        height : 300,
        href : '${pageContext.request.contextPath }/leave/addPage.do',
        buttons : [ {
        	text: '取消添加',
        	iconCls:'icon-cancel',
        	handler:function(){
        		parent.$.modalDialog.handler.dialog("destroy");
        		parent.$.modalDialog.handler = undefined;
        	}
        },{
            text : '确定添加',
            iconCls:'icon-ok',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = dataGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#leaveAddForm');
                f.submit();
            }
        } ]
    });
}

function editFun(id,status) {
	if(status=="1"){
		parent.$.messager.alert('提示', "该请假单正在审批中，单据不能修改!", 'info');
		return false;
	}
	if(status=="2"){
		parent.$.messager.alert('提示', "该请假单已审批通过，单据不能修改!", 'info');
		return false;
	}
    if (id == undefined) {
        var rows = dataGrid.datagrid('getSelections');
        id = rows[0].id;
    } else {
        dataGrid.datagrid('unselectAll').datagrid('uncheckAll');
    }
    parent.$.modalDialog({
        title : '编辑',
        width : 500,
        height : 300,
        href : '${path }/leave/editPage.do?id=' + id ,
        buttons : [{
        	text : '取消修改',
        	iconCls:'icon-cancel',
        	handler:function(){
        		parent.$.modalDialog.handler.dialog('destroy');
        		parent.$.modalDialog.handler = undefined;
        	}
        }, {
            text : '确定修改',
            iconCls: 'icon-ok',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = dataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#leaveEditForm');
                f.submit();
            }
        } ]
    });
}

function deleteFun(id) {
	if(status=="1"){
		parent.$.messager.alert('提示', "该请假单正在审批中，单据不能删除!", 'info');
		return false;
	}
	if(status=="2"){
		parent.$.messager.alert('提示', "该请假单已审批通过，单据不能删除!", 'info');
		return false;
	}
    if (id == undefined) {//点击右键菜单才会触发这个
        var rows = dataGrid.datagrid('getSelections');
        id = rows[0].id;
    } else {//点击操作里面的删除图标会触发这个
        dataGrid.datagrid('unselectAll').datagrid('uncheckAll');
    }
    parent.$.messager.confirm('询问', '您是否要删除当前单据吗？', function(b) {
        if (b) {
            progressLoad();
            $.post('${pageContext.request.contextPath}/leave/delete.do', {
                id : id
            }, function(result) {
                progressClose();
                if (result.success) {
                    parent.$.messager.alert('提示', result.msg, 'info');
                    dataGrid.datagrid('reload');
                }else{
                	parent.$.messager.alert('错误', result.msg, 'error');
                }
            }, 'JSON');
        }
    });
}

function startWorkflowFun(id,status) {
    if (id == undefined) {
        var rows = dataGrid.datagrid('getSelections');
        id = rows[0].id;
    } else {
        dataGrid.datagrid('unselectAll').datagrid('uncheckAll');
    }
    if(status=="1"){
		parent.$.messager.alert('提示', "该请假单正在审批中，请耐心等待领导审批!", 'info');
		return false;
	}
	if(status=="2"){
		parent.$.messager.alert('提示', "该请假单已审批通过，无需再次启动审批流程!", 'info');
		return false;
	}
	
    parent.$.modalDialog({
        title : '启动审批',
        width : 500,
        height : 500,
        href : '${pageContext.request.contextPath }/leave/startWorkflowPage.do?id=' + id,
        buttons : [ {
        	text : '取消启动',
        	iconCls:'icon-cancel',
        	handler:function(){
        		parent.$.modalDialog.handler.dialog("destroy");
        		parent.$.modalDialog.handler = undefined ;
        	}
        },{
            text : '启动流程',
            iconCls: 'icon-ok',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = dataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#startWorkflowForm');
                f.submit();
            }
        } ]
    });
}
    
</script>
<body class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',fit:true,border:false">
        <table id="dataGrid" data-options="fit:true,border:false"></table>
    </div>
    <div id="toolbar" style="display: none;">
    	<myfst:frameSecurity link="/leave/add.do">
			<a onclick="addFun();"	href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'">添加</a>
		</myfst:frameSecurity>
    </div>
</body>
</html>