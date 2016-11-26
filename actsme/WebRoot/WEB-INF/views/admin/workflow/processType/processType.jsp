<%@ page language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="/common.jsp" %>
<script type="text/javascript">  
var dataGrid;  
var editRow = undefined; //定义全局变量：当前编辑的行
$(function() {  
    dataGrid = $('#dataGrid').datagrid({  
        url : '${pageContext.request.contextPath}/processType/dataGrid.do', 
        fitColumn: false, //列自适应宽度
        striped: true, //行背景交换
        nowap: true, //列内容多时自动折至第二行
        border: false,
        idField: 'id', //主键
	    rownumbers : true,
	    pagination : true,
	    singleSelect : true,
	    idField : 'id',
	    sortName : 'id',
	    sortOrder : 'asc',
	    pageSize : 20,
	    pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
        checkOnSelect:true,  
        selectOnCheck:true,  
        columns : [ [ { 
        	width : '100',
            field : 'id',  
            title : 'ID'  
        }, {  
        	width : '300',
            field : 'code',  
            title : 'Code',  
            sortable : true,
            editor: { 
            	type: 'validatebox', 
            	options: { 
            		required: true
            	} 
            }  
        }, {  
        	width : '300',
            field : 'name',  
            title : '名称',  
            sortable : true,
            editor: { 
            	type: 'validatebox', 
            	options: { 
            		required: true
            	} 
            }  
        }] ],  
        //toolbar : '#toolbar'
        toolbar:[{ text: '添加', iconCls: 'icon-add', handler: function () {//添加列表的操作按钮添加，修改，删除等
                    //添加时先判断是否有开启编辑的行，如果有则把开户编辑的那行结束编辑
                    if (editRow != undefined) {
                        dataGrid.datagrid("endEdit", editRow);
                    }
                    //添加时如果没有正在编辑的行，则在dataGrid的第一行插入一行
                    if (editRow == undefined) {
                        dataGrid.datagrid("insertRow", {
                            index: 0, // index start with 0
                            row: { }
                        });
                        //将新插入的那一行开户编辑状态
                        dataGrid.datagrid("beginEdit", 0);
                        //给当前编辑的行赋值
                        editRow = 0;
                    }

                }
                }, '-',
                 { text: '删除', iconCls: 'icon-del', handler: function () {
                     //删除时先获取选择行
                     var rows = dataGrid.datagrid("getSelections");
                     //选择要删除的行
                     if (rows.length > 0) {
                         $.messager.confirm("提示", "你确定要删除吗?", function (r) {
                             if (r) {
                                 var ids = [];
                                 for (var i = 0; i < rows.length; i++) {
                                     ids.push(rows[i].id);
                                 }
                                 //将选择到的行存入数组并用,分隔转换成字符串，
                                 //本例只是前台操作没有与数据库进行交互所以此处只是弹出要传入后台的id
                                 //console.info(ids.join(','));
                                 $.ajax({
									url : '${pageContext.request.contextPath}/processType/delete.do',
									data : {
										ids : ids.join(',')
									},
									dataType : 'json',
									success : function(result) {
						                if (result.success) {
						                	dataGrid.datagrid('load');
											dataGrid.datagrid('unselectAll');
											$.messager.show({
												titile:'提示',
												msg:result.msg,
												timeout:1000  //毫秒
											});
						                } else {
						                    parent.$.messager.alert('错误', result.msg, 'error');
						                }
									}
								});
                             }
                         });
                     }else {
                         $.messager.alert("提示", "请选择要删除的行", "error");
                     }
                 }
                 }, '-',
                 { text: '修改', iconCls: 'icon-edit', handler: function () {
                     //修改时要获取选择到的行
                     var rows = dataGrid.datagrid("getSelections");
                     //如果只选择了一行则可以进行修改，否则不操作
                     if (rows.length == 1) {
                         //修改之前先关闭已经开启的编辑行，当调用endEdit该方法时会触发onAfterEdit事件
                         if (editRow != undefined) {
                             dataGrid.datagrid("endEdit", editRow);
                         }
                         //当无编辑行时
                         if (editRow == undefined) {
                             //获取到当前选择行的下标
                             var index = dataGrid.datagrid("getRowIndex", rows[0]);
                             //开启编辑
                             dataGrid.datagrid("beginEdit", index);
                             //把当前开启编辑的行赋值给全局变量editRow
                             editRow = index;
                             //当开启了当前选择行的编辑状态之后，
                             //应该取消当前列表的所有选择行，要不然双击之后无法再选择其他行进行编辑
                             dataGrid.datagrid("unselectAll");
                         }
                     }else{
                     	$.messager.show({
							msg : '请选择一项进行修改！',
							title : '错误'
						});
                     }
                 }
                 }, '-',
                 { text: '保存', iconCls: 'icon-filesave', handler: function () {
	                 	if (editRow != undefined) {
		                     //保存时结束当前编辑的行，自动触发onAfterEdit事件如果要与后台交互可将数据通过Ajax提交后台
							dataGrid.datagrid('endEdit', editRow);
						}
	                 }
                 }, '-',
                 { text: '取消编辑', iconCls: 'icon-redo', handler: function () {
	                     //取消当前编辑行把当前编辑行罢undefined回滚改变的数据,取消选择的行
	                     editRow = undefined;
	                     dataGrid.datagrid("rejectChanges");
	                     dataGrid.datagrid("unselectAll");
	                 }
                 }, '-'],
        onAfterEdit: function (rowIndex, rowData, changes) {
            //endEdit该方法触发此事件
            //console.info(rowData);
            var inserted = dataGrid.datagrid('getChanges', 'inserted');
			var updated = dataGrid.datagrid('getChanges', 'updated');
			if (inserted.length < 1 && updated.length < 1) {
				editRow = undefined;
				dataGrid.datagrid('unselectAll');
				return;
			}

			var url = '';
			if (inserted.length > 0) {
				url = '${pageContext.request.contextPath}/processType/add.do';
			}
			if (updated.length > 0) {
				url = '${pageContext.request.contextPath}/processType/edit.do';
			}

			$.ajax({
				url : url,
				data : rowData,
				dataType : 'json',
				success : function(result) {
	                if (result.success) {
	                	dataGrid.datagrid('acceptChanges');
	                	$.messager.show({
							titile:'提示',
							msg:result.msg,
							timeout:1000  //毫秒
						});
						editRow = undefined;
						dataGrid.datagrid('reload');
	                } else {
	                	/*datagrid.datagrid('rejectChanges');*/
						dataGrid.datagrid('beginEdit', editRow);
	                    parent.$.messager.alert('错误', result.msg, 'error');
	                }
					dataGrid.datagrid('unselectAll');
				}
			});
        },
        onDblClickRow: function (rowIndex, rowData) {
        	//双击开启编辑行
            if (editRow != undefined) {
                dataGrid.datagrid("endEdit", editRow);
            }
            if (editRow == undefined) {
                dataGrid.datagrid("beginEdit", rowIndex);
                editRow = rowIndex;
            }
        }
	});  
      
});  
</script>  
<body>  
<div class="easyui-layout" data-options="fit:true,border:false">  
    <div data-options="region:'center',border:false,title:'业务类型列表'" >  
        <table id="dataGrid" data-options="fit:true,border:false"></table>  
    </div>  
</div>  
</body>  
</html> 