<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="/common.jsp" %>
<script type="text/javascript">
var treeGrid;
$(function() {
    treeGrid = $('#treeGrid').treegrid({
        url : '${pageContext.request.contextPath }/organization/treeGrid.do',
        idField : 'id',
        treeField : 'name',
        parentField : 'pid',
        fit : true,
        fitColumns : false,
        border : false,
        frozenColumns : [ [ {
            title : 'id',
            field : 'id',
            width : 40,
            hidden : true
        } ] ],
        columns : [ [ {
            field : 'code',
            title : '编号',
            width : 100
        },{
            field : 'name',
            title : '部门名称',
            width : 220
        }, {
            field : 'seq',
            title : '排序',
            width : 80
        }, {
            field : 'iconCls',
            title : '图标',
            width : 150
        },  {
            width : '150',
            title : '创建时间',
            field : 'createTime'
        },{
            field : 'pid',
            title : '上级资源ID',
            width : 150,
            hidden : true
        }, {
            field : 'address',
            title : '地址',
            width : 220
        } , {
            field : 'action',
            title : '操作',
            width : 250,
            formatter : function(value, row, index) {
                var str = '';
                    <myfst:frameSecurity link="/organization/edit.do">
                        str += $.formatString('<a href="javascript:void(0)" class="organization-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'icon-edit\'" onclick="editFun(\'{0}\');" >编辑</a>', row.id);
                    </myfst:frameSecurity>
                    <myfst:frameSecurity link="/organization/delete.do">
                        str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                        str += $.formatString('<a href="javascript:void(0)" class="organization-easyui-linkbutton-del" data-options="plain:true,iconCls:\'icon-del\'" onclick="deleteFun(\'{0}\');" >删除</a>', row.id);
                    </myfst:frameSecurity>
                return str;
            }
        } ] ],
        onLoadSuccess:function(data){
            $('.organization-easyui-linkbutton-edit').linkbutton({text:'编辑',plain:true,iconCls:'icon-edit'});
            $('.organization-easyui-linkbutton-del').linkbutton({text:'删除',plain:true,iconCls:'icon-del'});
        },
        toolbar : '#toolbar'
    });
});

function editFun(id) {
    if (id != undefined) {
        treeGrid.treegrid('select', id);
    }
    var node = treeGrid.treegrid('getSelected');
    if (node) {
        parent.$.modalDialog({
            title : '编辑',
            width : 500,
            height : 300,
            href : '${pageContext.request.contextPath }/organization/editPage.do?id=' + node.id,
            buttons : [ {
            	text:"取消编辑",
            	iconCls:"icon-cancel",
            	handler:function(){
            		 parent.$.modalDialog.handler.dialog('close');
            	}
            },{
                text : '确认编辑',
                iconCls:"icon-ok",
                handler : function() {
                    parent.$.modalDialog.openner_treeGrid = treeGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#organizationEditForm');
                    f.submit();
                }
            } ]
        });
    }
}

function deleteFun(id) {
    if (id != undefined) {
        treeGrid.treegrid('select', id);
    }
    var node = treeGrid.treegrid('getSelected');
    if (node) {
        parent.$.messager.confirm('询问', '您是否要删除当前资源？删除当前资源会连同子资源一起删除!', function(b) {
            if (b) {
                progressLoad();
                $.post('${pageContext.request.contextPath }/organization/delete.do', {
                    id : node.id
                }, function(result) {
                    if (result.success) {
                        parent.$.messager.alert('提示', result.msg, 'info');
                        treeGrid.treegrid('reload');
                    }else{
                        parent.$.messager.alert('提示', result.msg, 'info');
                    }
                    progressClose();
                }, 'JSON');
            }
        });
    }
}

function addFun() {
    parent.$.modalDialog({
        title : '添加',
        width : 500,
        height : 300,
        href : '${pageContext.request.contextPath }/organization/addPage.do',
        buttons : [ {
        	text:"取消添加",
        	iconCls:"icon-cancel",
        	handler:function(){
        		 parent.$.modalDialog.handler.dialog('close');
        	}
        },{
            text : '确认添加',
            iconCls:"icon-ok",
            handler : function() {
                parent.$.modalDialog.openner_treeGrid = treeGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#organizationAddForm');
                f.submit();
            }
        } ]
    });
}
</script>
<body>
    <div class="easyui-layout" data-options="fit:true,border:false">
        <div data-options="region:'center',border:false"  style="overflow: hidden;">
            <table id="treeGrid"></table>
        </div>
        
        <div id="toolbar" style="display: none;">
            <myfst:frameSecurity link="/organization/add.do">
                <a onclick="addFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'">添加</a>
            </myfst:frameSecurity>
        </div>
    </div>
</body>
</html>