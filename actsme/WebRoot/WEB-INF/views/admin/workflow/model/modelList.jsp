<%@ page language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="/common.jsp" %>
<script type="text/javascript">  
var dataGrid;  
$(function() {  
    dataGrid = $('#dataGrid').datagrid({  
        url : '${pageContext.request.contextPath}/workflowModel/dataGrid.do', 
        striped : true,
	    rownumbers : true,
	    pagination : true,
	    singleSelect : true,
	    idField : 'id',
	    sortName : 'createTime',
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
        	width : '100',
            field : 'key',  
            title : 'KEY',  
            sortable : true  
        }, {  
        	width : '100',
            field : 'name',  
            title : '名称',  
            sortable : true  
        }, {  
        	width : '70',
            field : 'version',  
            title : '版本'  
        }, {  
        	width : '150',
            field : 'createTime',  
            title : '创建时间',
            sortable : true
        }, {  
        	width : '150',
            field : 'lastUpdateTime',  
            title : '更新时间'  
        }, {  
        	width : '200',
            field : 'metaInfo',  
            title : '元数据'  
        }, {
	        field : 'action',
	        title : '操作',
	        width : 400,
	        formatter : function(value, row, index) {
	            var str = '';
	                    str += $.formatString('<a href="javascript:void(0)" class="model-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'icon-edit\'" onclick="processDefinitionFun(\'{0}\');" >设计流程</a>', row.id);
	                    str += '&nbsp;|&nbsp;';
	                    str += $.formatString('<a href="javascript:void(0)" class="model-easyui-linkbutton-sum" data-options="plain:true,iconCls:\'icon-sum\'" onclick="deployModel(\'{0}\');" >部署流程</a>', row.id);
	                    str += '&nbsp;|&nbsp;';
	                    str += $.formatString('<a href="javascript:void(0)" class="model-easyui-linkbutton-filesave" data-options="plain:true,iconCls:\'icon-filesave\'" onclick="exportModelFun(\'{0}\');" >导出</a>', row.id);
	                <myfst:frameSecurity link="/workflow/deleteDeployment.do">    
	                    str += '&nbsp;|&nbsp;';
	                    str += $.formatString('<a href="javascript:void(0)" class="model-easyui-linkbutton-del" data-options="plain:true,iconCls:\'icon-del\'" onclick="deleteFun(\'{0}\');" >删除</a>', row.id);
	                 </myfst:frameSecurity>     
	            return str;
	        }
	    }] ],  
        toolbar : '#toolbar' , 
        onLoadSuccess:function(data){
	        $('.model-easyui-linkbutton-edit').linkbutton({text:'设计流程',plain:true,iconCls:'icon-edit'});
	        $('.model-easyui-linkbutton-sum').linkbutton({text:'部署流程',plain:true,iconCls:'icon-sum'});
	        $('.model-easyui-linkbutton-filesave').linkbutton({text:'导出',plain:true,iconCls:'icon-filesave'});
	        $('.model-easyui-linkbutton-del').linkbutton({text:'删除',plain:true,iconCls:'icon-del'});
	    }
    });  
      
});  
  
function addFun() {
    parent.$.modalDialog({
        title : '新增模型',
        width : 500,
        height : 300,
        href : '${pageContext.request.contextPath }/workflowModel/addPage.do',
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
                parent.$.modalDialog.openner_dataGrid = dataGrid;//因为添加成功之后，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#wfMdoelAddForm');
                f.submit();
            }
        } ]
    });
}


/**
 * 设计流程图
 */
function processDefinitionFun(id){  
	if (id == undefined) {//点击右键菜单才会触发这个
        var rows = dataGrid.datagrid('getSelections');
        id = rows[0].id;
    } else {//点击操作里面的删除图标会触发这个
        dataGrid.datagrid('unselectAll').datagrid('uncheckAll');
    }
	var url = "${pageContext.request.contextPath}/modeler.html?modelId="+id+"&R="+new Date();
    //window.open(url);  
    
    parent.addTab({
        title : '流程设计-'+id,
        url : url,
        iconCls : ''
    });
}  

/**
 * 导出模型
 */
function exportModelFun(id){  
	if (id == undefined) {//点击右键菜单才会触发这个
        var rows = dataGrid.datagrid('getSelections');
        id = rows[0].id;
    } else {//点击操作里面的删除图标会触发这个
        dataGrid.datagrid('unselectAll').datagrid('uncheckAll');
    }
    window.open("${pageContext.request.contextPath}/workflowModel/export.do?modelId="+id+"&R="+new Date());  
}  
  
function deployModel(id){
	if (id == undefined) {//点击右键菜单才会触发这个
        var rows = dataGrid.datagrid('getSelections');
        id = rows[0].id;
    } else {//点击操作里面的删除图标会触发这个
        dataGrid.datagrid('unselectAll').datagrid('uncheckAll');
    }
    progressLoad();
    $.post('${pageContext.request.contextPath}/workflowModel/deploy.do', {modelId:id}, function(result) {  
        if (result.success) {
             parent.$.messager.alert('提示', result.msg, 'info');
             dataGrid.datagrid('reload');
         }else{
         	parent.$.messager.alert('错误', result.msg, 'error');
         }
         progressClose();
    }, 'json');
}  

/**
 * 删除模型
 */
function deleteFun(id){
	if (id == undefined) {//点击右键菜单才会触发这个
        var rows = dataGrid.datagrid('getSelections');
        id = rows[0].id;
    } else {//点击操作里面的删除图标会触发这个
        dataGrid.datagrid('unselectAll').datagrid('uncheckAll');
    } 
         
    $.messager.confirm('确认','您确认想要删除记录吗？',function(r){  
		if (r){  
        	progressLoad();
       		$.post('${pageContext.request.contextPath}/workflowModel/delete.do', {
       				modelId : id
       			}, function(result) { 
               	if (result.success) {
                    parent.$.messager.alert('提示', result.msg, 'info');
                    dataGrid.datagrid('reload');
                }else{
                	parent.$.messager.alert('错误', result.msg, 'error');
                }
                progressClose();
           	}, 'json');  
   		}      
	}); 
}  
</script>  
<body>  
<div class="easyui-layout" data-options="fit:true,border:false">  
    <div data-options="region:'center',border:false,title:'模型列表'" >  
        <table id="dataGrid" data-options="fit:true,border:false"></table>  
    </div>  
</div>  
<div id="toolbar" style="display: none;">
 	<myfst:frameSecurity link="/workflowModel/add.do">
		<a onclick="addFun();"	href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'">添加</a>
	</myfst:frameSecurity>
</div>  
</body>  
</html> 