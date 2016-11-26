<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
var commentDataGrid;
$(function() {
	progressClose();
	
	commentDataGrid = $('#commentDataGrid').datagrid({
	    url : '${pageContext.request.contextPath }/workflow/commentListDataGrid.do?processInstanceId=${processInstanceId}&R='+new Date(),
	    striped : true,
	    rownumbers : true,
	    pagination : true,
	    singleSelect : true,
	    idField : 'userId',
	    sortName : 'time',
	    sortOrder : 'asc',
	    pageSize : 20,
	    pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
	    frozenColumns : [ [ {
	        width : '60',
	        title : 'id',
	        field : 'id',
	    }, {
	        width : '100',
	        title : '审批人',
	        field : 'userId',
	    } , {
	        width : '150',
	        title : '审批时间',
	        field : 'time',
	    } , {
	        width : '300',
	        title : '审批意见',
	        field : 'fullMessage',
	    }  ] ]
	});
    
});
</script>
<div class="easyui-layout" data-options="fit:true,border:false" >
    <div data-options="region:'center'">
        <table id="commentDataGrid" data-options="fit:true,border:false"></table>
    </div>
</div>