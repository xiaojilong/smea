<%@ page language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
   <%@include file="/common.jsp" %>
 <script type="text/javascript">
	var index_tabs;
	var index_tabsMenu;
	var index_layout;
	$(function() {
		index_layout = $('#index_layout').layout({
			fit : true
		});
		/*index_layout.layout('collapse', 'east');*/

		index_tabs = $('#index_tabs').tabs({
			fit : true,
			border : false,
			onContextMenu : function(e, title) {
				e.preventDefault();
				index_tabsMenu.menu('show', {
					left : e.pageX,
					top : e.pageY
				}).data('tabTitle', title);
			},
			 onSelect: function (title) {
				var index = index_tabs.tabs('getSelected');
				reloadTabsContext(index);
           },
           tools : [{
                iconCls : 'icon-home',
                handler : function() {
                    index_tabs.tabs('select', 0);
                }
            }, {
                iconCls : 'icon-refresh',
                handler : function() {
	                    var indexTitle = index_tabs.tabs('getTabIndex', index_tabs.tabs('getSelected'));
	                    //index_tabs.tabs('getTab', indexTitle).panel('open').panel('refresh');
	                    var indexObj = index_tabs.tabs('getTab', indexTitle);
	                    reloadTabsContext(indexObj);
                }// handler : function() {end
            }, {
                iconCls : 'icon-del',
                handler : function() {
                    var index = index_tabs.tabs('getTabIndex', index_tabs.tabs('getSelected'));
					var tab = index_tabs.tabs('getTab', index);
					if (tab.panel('options').closable) {
						index_tabs.tabs('close', index);
					} else {
						$.messager.alert('提示', '[' + tab.panel('options').title + ']不可以被关闭！', 'error');
					}
                }
            } ]
		});

		index_tabsMenu = $('#index_tabsMenu').menu({
			onClick : function(item) {
				var curTabTitle = $(this).data('tabTitle');
				var type = $(item.target).attr('title');

				if (type === 'refresh') {
					var index = index_tabs.tabs('getTab', curTabTitle);
					reloadTabsContext(index);	
					return;
				}//if (type === 'refresh') {end

				if (type === 'close') {
					var t = index_tabs.tabs('getTab', curTabTitle);
					if (t.panel('options').closable) {
						index_tabs.tabs('close', curTabTitle);
					} else {
						$.messager.alert('提示', '[' + t.panel('options').title + ']不可以被关闭！', 'error');
					}
					return;
				}

				var allTabs = index_tabs.tabs('tabs');
				var closeTabsTitle = [];

				$.each(allTabs, function() {
					var opt = $(this).panel('options');
					if (opt.closable && opt.title != curTabTitle && type === 'closeOther') {
						closeTabsTitle.push(opt.title);
					} else if (opt.closable && type === 'closeAll') {
						closeTabsTitle.push(opt.title);
					}
				});

				for ( var i = 0; i < closeTabsTitle.length; i++) {
					index_tabs.tabs('close', closeTabsTitle[i]);
				}
			}
		});
		
	var sessionInfo_userId = '${user.loginName}';
	if (sessionInfo_userId) {
		layout_west_tree_url =  '${path }/resource/tree.do';
	}
	layout_west_tree = $('#layout_west_tree').tree({
          url : layout_west_tree_url ,
          parentField : 'pid',
          lines : true,
          onClick : function(node) {
              if (node.attributes.indexOf("http") >= 0) {
                  var url = node.attributes;
                  addTab({
                      title : node.text,
                      url : url,
                      iconCls : node.iconCls
                  });
              } else if (node.attributes) {
                  var url = '${path }' + node.attributes;
                  addTab({
                      title : node.text,
                      url : url,
                      iconCls : node.iconCls
                  });
              }
          },
          onBeforeLoad : function(node, param) {
			if (layout_west_tree) {//只有刷新页面才会执行这个方法
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
/**
 * 刷新指定的index的Tab内容
**/
function reloadTabsContext(index){
	var href = index.panel('options').href;
	if (href) {/*说明tab是以href方式引入的目标页面*/
		index_tabs.tabs('getTab', index).panel('refresh');
	} else {/*说明tab是以content方式引入的目标页面*/
		var panel = index.panel('panel');
		var frame = panel.find('iframe');
		try {
			if (frame.length > 0) {
				for ( var i = 0; i < frame.length; i++) {
					frame[i].contentWindow.document.write('');
					frame[i].contentWindow.close();
					frame[i].src = frame[i].src;
				}
				if (navigator.userAgent.indexOf("MSIE") > 0) {// IE特有回收内存方法
					try {
						CollectGarbage();
					} catch (e) {
					}
				}
			}
		} catch (e) {
		}
	}
}
/**
 * 添加Tab
 */
function addTab(params) {
    var iframe = '<iframe src="' + params.url + '" frameborder="0" style="border:0;width:100%;height:99.5%;"></iframe>';
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
/**
 * 根据title关闭Tab
 */
function closeTab(curTabTitle){
	var t = index_tabs.tabs('getTab', curTabTitle);
	if (t.panel('options').closable) {
		index_tabs.tabs('close', curTabTitle);
	} else {
		$.messager.alert('提示', '[' + t.panel('options').title + ']不可以被关闭！', 'error');
	}
	return;
}
	
function logout(){
    $.messager.confirm('提示','确定要退出?',function(r){
        if (r){
            progressLoad();
            $.post('${path }/framework/logout.do', function(result) {
                if(result.success){
                    progressClose();
                    window.location.href='${path }';
                }
            }, 'json');
        }
    });
}

function editUserPwd() {
    parent.$.modalDialog({
        title : '修改密码',
        width : 300,
        height : 250,
        href : '${path }/user/editPwdPage',
        buttons : [ {
            text : '确定',
            handler : function() {
                var f = parent.$.modalDialog.handler.find('#editUserPwdForm');
                f.submit();
            }
        } ]
    });
}
</script>	
 <body class="easyui-layout">
	<div data-options="region:'north'" style="height:82px"  href="${ctx}/framework/top.do"></div>
	
	<div data-options="region:'west',split:true" title="系统导航" style="width:200px;" >
		<div class="well well-small" style="padding: 5px 5px 5px 5px;">
            <ul id="layout_west_tree"></ul>
        </div>
	</div>
		
	<div data-options="region:'center',collapsible:false" >
		<div id="index_tabs" style="overflow: hidden;" class="easyui-tabs" data-options="fit:true,narrow:true">
			<div title="主页"  data-options="iconCls:'icon-home'" style="overflow: hidden;">
				<iframe src="${ctx}/framework/main.do" frameborder="0" style="border: 0; width: 100%; height: 96%;"></iframe>
			</div>
		</div>	
	</div>
	
	<div data-options="region:'east',split:true,iconCls:'bell-bell'" title="通知公告" style="width:200px;" >
		<iframe src="${ctx }/framework/right.do" frameborder="0" style="border: 0; width: 100%; height: 96%;"></iframe>	 
	</div>
		 
	<div data-options="region:'south',split:false" style="height:30px;">
		<div style="text-align: center;">Copyright © 2015 power by xiaojl </div>
	</div>
	
	<div id="index_tabsMenu" style="width: 120px; display: none;">
		<div title="refresh" data-options="iconCls:'icon-transmit'">刷新</div>
		<div class="menu-sep"></div>
		<div title="close" data-options="iconCls:'icon-cancel'">关闭</div>
		<div title="closeOther" data-options="iconCls:'icon-cancel'">关闭其他</div>
		<div title="closeAll" data-options="iconCls:'icon-cancel'">关闭所有</div>
	</div>
	
	<!--[if lte IE 7]>
    <div id="ie6-warning"><p>您正在使用 低版本浏览器，在本页面可能会导致部分功能无法使用。建议您升级到 <a href="http://www.microsoft.com/china/windows/internet-explorer/" target="_blank">Internet Explorer 8</a> 或以下浏览器：
    <a href="http://www.mozillaonline.com/" target="_blank">Firefox</a> / <a href="http://www.google.com/chrome/?hl=zh-CN" target="_blank">Chrome</a> / <a href="http://www.apple.com.cn/safari/" target="_blank">Safari</a> / <a href="http://www.operachina.com/" target="_blank">Opera</a></p></div>
    <![endif]-->

    <style>
        /*ie6提示*/
        #ie6-warning{width:100%;position:absolute;top:0;left:0;background:#fae692;padding:5px 0;font-size:12px}
        #ie6-warning p{width:960px;margin:0 auto;}
    </style>
</body> 
</html>
