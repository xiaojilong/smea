<!-- page:framework/easyuiRight.jsp -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="/common.jsp" %>
<script type="text/javascript">
var onlineUserdataGrid;
$(function() {
    /**
	dataGrid = $('#onlineUserdataGrid').datagrid({
        url : '${pageContext.request.contextPath }/framework/onlineUserList.do',
        striped : true,
        rownumbers : true,
        pagination : true,
        singleSelect : true,
        idField : 'id',
        sortName : 'id',
        sortOrder : 'asc',
        pageSize : 20,
        pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
        frozenColumns : [ [ {
            width : '100',
            title : 'id',
            field : 'id',
            sortable : true
        }, {
            width : '80',
            title : '用户',
            field : 'loginName',
            sortable : true
        } , {
            width : '80',
            title : '主机地址',
            field : 'host',
            sortable : true
        }, {
            width : '200',
            title : '最后操作时间',
            field : 'lastTime'
        }, {
            width : '60',
            title : '状态',
            field : 'isExpired',
            sortable : true,
            formatter : function(value, row, index) {
                switch (value) {
                case false:
                    return '正常';
                case true:
                    return '已过期';
                }
            }
        }] ]
    });//dataGrid = $('#onlineUserdataGrid').datagrid({ end
    */	
});
</script>
<body class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'north',border:false" style="height: 190px; overflow: hidden;background-color: #fff">
        <div class="easyui-calendar" style="width:100%;height:190px;"></div>
    </div>
    <div data-options="region:'center',border:true,title:'在线用户列表'" >
        <table id="onlineUserdataGrid" data-options="fit:true,border:false"></table>
    </div>
</body>
</html>
