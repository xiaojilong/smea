<!-- page:framework/easyuiMain.jsp -->
<%@ page language="java"  pageEncoding="UTF-8"%>
<script type="text/javascript">
var layout_west_tree;
var layout_west_tree_url = '';
var activeUserId = '${activeUserId}';
if (activeUserId) {
	layout_west_tree_url = '${pageContext.request.contextPath}/framework/meunTree.do?activeUserId=${activeUserId}';
}
$(function() {
	var layout_west_tree = $('#layout_west_tree').tree({
		url : layout_west_tree_url,
		parentField : 'pid',
		//lines : true,
		onClick : function(node) {
			if (node.attributes && node.attributes.url) {
				var url;
				if (node.attributes.url.indexOf('/') == 0) {/*如果url第一位字符是"/"，那么代表打开的是本地的资源*/
					url = '${pageContext.request.contextPath}' + node.attributes.url +"?activeUserId=${activeUserId}";
					if (url.indexOf('/druidController') == -1) {/*如果不是druid相关的控制器连接，那么进行遮罩层屏蔽*/
						parent.$.messager.progress({
							title : '提示',
							text : '数据处理中，请稍后....'
						});
					}
				} else {/*打开跨域资源*/
					url = node.attributes.url;
				}
				addTab({
					url : url,
					title : node.text,
					iconCls : node.iconCls
				});
			}
		},
		onBeforeLoad : function(node, param) {
			if (layout_west_tree_url) {//只有刷新页面才会执行这个方法
				parent.$.messager.progress({
					title : '提示',
					text : '数据处理中，请稍后....'
				});
			}
		},
		onLoadSuccess : function(node, data) {
			parent.$.messager.progress('close');
		}
	});
});

function addTab(params) {
	var iframe = '<iframe src="' + params.url + '" frameborder="0" style="border:0;width:100%;height:98%;"></iframe>';
	var t = $('#index_tabs');
	var opts = {
		title : params.title,
		closable : true,
		iconCls : params.iconCls,
		content : iframe,
		border : false,
		fit : true
	};
	if (t.tabs('exists', opts.title)) {
		t.tabs('select', opts.title);
		parent.$.messager.progress('close');
	} else {
		t.tabs('add', opts);
	}
}
</script>
<!-- 折叠面板 -->	
<div class="easyui-accordion" data-options="fit:true" >
	<div title="About Accordion" iconCls="icon-ok" style="padding:10px;">
		<h3 style="color:#0099FF;">${activeUser}</h3>
	</div>
	<div title="系统菜单" style="padding: 5px;" data-options="border:false,isonCls:'anchor',tools : [ {
				iconCls : 'database_refresh',
				handler : function() {
					$('#layout_west_tree').tree('reload');
				}
			}, {
				iconCls : 'resultset_next',
				handler : function() {
					var node = $('#layout_west_tree').tree('getSelected');
					if (node) {
						$('#layout_west_tree').tree('expandAll', node.target);
					} else {
						$('#layout_west_tree').tree('expandAll');
					}
				}
			}, {
				iconCls : 'resultset_previous',
				handler : function() {
					var node = $('#layout_west_tree').tree('getSelected');
					if (node) {
						$('#layout_west_tree').tree('collapseAll', node.target);
					} else {
						$('#layout_west_tree').tree('collapseAll');
					}
				}
			} ]">
		<div class="well well-small">
			<ul id="layout_west_tree"></ul>
		</div>
	</div>
	<div title="Tree Menu" data-options="border:false,iconCls:'anchor'">
		<ul id="layout_west_tree" class="easyui-tree">
			<li>
				<span>Folder1</span>
				<ul>
					<li>
						<span>Sub Folder 1</span>
						<ul>
							<li><span>File 11</span></li>
							<li><span>File 12</span></li>
							<li><span>File 13</span></li>
						</ul>
					</li>
					<li><span>File 2</span></li>
					<li><span>File 3</span></li>
				</ul>
			</li>
			<li><span>File2</span></li>
		</ul>
	</div>
	<div title="About easyui" iconCls="icon-reload" selected="true" style="padding:10px;">
		easyui help you build your web page easily
	</div>
	
</div>	
