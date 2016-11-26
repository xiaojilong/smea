<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="/common.jsp" %>
<script type="text/javascript">
    var treeGrid;
    $(function() {
        treeGrid = $('#treeGrid').treegrid({
            url : '${pageContext.request.contextPath }/resource/treeGrid.do',
            idField : 'id',
            treeField : 'name',
            parentField : 'pid',
            fit : true,
            fitColumns : false,
            border : false,
            frozenColumns : [ [ {
                title : '编号',
                field : 'id',
                width : 60
            } ] ],
            columns : [ [ {
                field : 'name',
                title : '资源名称',
                width : 150
            }, {
                field : 'url',
                title : '资源路径',
                width : 300
            }, {
                field : 'seq',
                title : '排序',
                width : 40
            }, {
                field : 'iconCls',
                title : '图标',
                width : 200
            }, {
                field : 'resourceType',
                title : '资源类型',
                width : 80,
                formatter : function(value, row, index) {
                    switch (value) {
                    case 0:
                        return '菜单';
                    case 1:
                        return '按钮';
                    }
                }
            }, {
                field : 'pid',
                title : '上级资源ID',
                width : 150,
                hidden : true
            }, {
                field : 'status',
                title : '状态',
                width : 80,
                formatter : function(value, row, index) {
                    switch (value) {
                    case 0:
                        return '正常';
                    case 1:
                        return '停用';
                    }
                }
            }, {
                field : 'action',
                title : '操作',
                width : 200,
                formatter : function(value, row, index) {
                    var str = '';
                    	<myfst:frameSecurity link="/resource/edit.do">
                            str += $.formatString('<a href="javascript:void(0)" class="resource-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'icon-edit\'" onclick="editFun(\'{0}\');" >编辑</a>', row.id);
                        </myfst:frameSecurity> 
                        <myfst:frameSecurity link="/resource/delete.do">
                            str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                            str += $.formatString('<a href="javascript:void(0)" class="resource-easyui-linkbutton-del" data-options="plain:true,iconCls:\'icon-del\'" onclick="deleteFun(\'{0}\');" >删除</a>', row.id);
                        </myfst:frameSecurity>     
                    return str;
                }
            } ] ],
            onLoadSuccess:function(data){
                $('.resource-easyui-linkbutton-edit').linkbutton({text:'编辑',plain:true,iconCls:'icon-pencil'});
                $('.resource-easyui-linkbutton-del').linkbutton({text:'删除',plain:true,iconCls:'icon-del'});
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
                width : 600,
                height : 350,
                href : '${ctx }/resource/editPage.do?id=' + node.id,
                buttons : [ {
			                text : '取消修改',
			                iconCls:'icon-cancel',
			                handler : function() {
			                    parent.$.modalDialog.handler.dialog('destroy');
			                    parent.$.modalDialog.handler = undefined;
			                }
		            	} ,{
		                    text : ' 确定修改 ',
		                    iconCls:'icon-ok',
		                    handler : function() {
		                        parent.$.modalDialog.openner_treeGrid = treeGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
		                        var f = parent.$.modalDialog.handler.find('#resourceEditForm');
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
                    parent.$.messager.progress({
						title : '提示',
						text : '数据处理中，请稍后....'
					});
                    $.post('${pageContext.request.contextPath}/resource/delete.do', {
                        id : node.id
                    }, function(result) {
                        if (result.success) {
                            parent.$.messager.alert('提示', result.msg, 'info');
                            treeGrid.treegrid('reload');
                            parent.layout_west_tree.tree('reload');
                        }
                        parent.$.messager.progress('close');
                    }, 'JSON');
                }
            });
        }
    }

    function addFun() {
        parent.$.modalDialog({
            title : '添加',
            width : 500,
            height : 350,
            href : '${path }/resource/addPage.do',
            buttons : [ {
                text : '取消添加',
                iconCls:'icon-cancel',
                handler : function() {
                    parent.$.modalDialog.handler.dialog('destroy');
                    parent.$.modalDialog.handler = undefined;
                }
            } ,
            {
                text : '确定添加',
                iconCls:'icon-ok',
                handler : function() {
                    parent.$.modalDialog.openner_treeGrid = treeGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#resourceAddForm');
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
    </div>
    <div id="toolbar" style="display: none;">
    	<myfst:frameSecurity link="/resource/add.do">
 			<a onclick="addFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'">添加</a>
 		</myfst:frameSecurity>
    </div>
</body>
</html>