<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<%@ include file="/common.jsp" %>
<script type="text/javascript">
var dataGrid;
$(function () {
    dataGrid = $('#dataGrid').datagrid({
        url: '${pageContext.request.contextPath }/sysLog/dataGrid.do',
        fit: true,
        striped: true,
        pagination: true,
        singleSelect: true,
        idField: 'id',
        pageSize: 20,
        pageList: [10, 20, 30, 40, 50, 100, 200, 300, 400, 500],
        columns: [[{
            width: '100',
            title: '登录名',
            field: 'loginName',
            sortable: true
        }, {
            width: '100',
            title: '用户名',
            field: 'roleName'
        }, {
            width: '150',
            title: 'IP地址',
            field: 'clientIp',
            sortable: true
        }, {
            width: '800',
            title: '内容',
            field: 'optContent'
        }, {
            width: '200',
            title: '创建时间',
            field: 'createTime'
        }]]
    });
});

function searchFun() {
    dataGrid.datagrid('load', $.serializeObject($('#searchForm')));
}
function cleanFun() {
    $('#searchForm input').val('');
    dataGrid.datagrid('load', {});
}
</script>
</head>
<body class="easyui-layout" data-options="fit:true,border:false">
<div data-options="region:'north',border:false" style="height: 60px; overflow: hidden;background-color: #fff">
    <form id="searchForm">
        <table>
            <tr>
                <th>登录名:</th>
                <td><input name="loginName" placeholder="请输入登录名"/></td>
                <th>用户名:</th>
                <td><input name="roleName" placeholder="请输入用户名"/></td>
                <th>IP地址:</th>
                <td><input name="clientIp" placeholder="请输入IP地址"/></td>
                <th>内容:</th>
                <td><input name="optContent" placeholder="请输入内容"/></td>
                <th>创建时间:</th>
                <td>
                	<input name="createdateStart" placeholder="点击选择时间" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly" />至<input  name="createdateEnd" placeholder="点击选择时间" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly" />
                	<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onclick="searchFun();">查询</a><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',plain:true" onclick="cleanFun();">清空</a>
                </td>
            </tr>
        </table>
    </form>
</div>
<div data-options="region:'center',border:false,title:'日志列表'">
    <table id="dataGrid" data-options="fit:true,border:false"></table>
</div>
</body>
</html>