<!-- page:framework/easyuiTop.jsp -->
<%@ page language="java"  pageEncoding="UTF-8"%>
<script type="text/javascript" charset="utf-8">
	/**
	 * @requires jQuery,EasyUI,jQuery cookie plugin
	 * 
	 * 更换EasyUI主题的方法
	 * 
	 * @param themeName
	 *            主题名称
	 */
	function changeThemeFun(themeName) {
		if ($.cookie('easyuiThemeName')) {
			$('#layout_north_pfMenu').menu('setIcon', {
				target : $('#layout_north_pfMenu div[title=' + $.cookie('easyuiThemeName') + ']')[0],
				iconCls : 'emptyIcon'
			});
		}
		$('#layout_north_pfMenu').menu('setIcon', {
			target : $('#layout_north_pfMenu div[title=' + themeName + ']')[0],
			iconCls : 'tick'
		});

		var $easyuiTheme = $('#easyuiTheme');
		var url = $easyuiTheme.attr('href');
		var href = url.substring(0, url.indexOf('themes')) + 'themes/' + themeName + '/easyui.css';
		$easyuiTheme.attr('href', href);

		var $iframe = $('iframe');
		if ($iframe.length > 0) {
			for ( var i = 0; i < $iframe.length; i++) {
				var ifr = $iframe[i];
				try {
					$(ifr).contents().find('#easyuiTheme').attr('href', href);
				} catch (e) {
					try {
						ifr.contentWindow.document.getElementById('easyuiTheme').href = href;
					} catch (e) {
					}
				}
			}
		}

		$.cookie('easyuiThemeName', themeName, {
			expires : 7
		});

	};

	function logoutFun() {
		$.messager.confirm('提示','确定要退出?',function(r){
            if (r){
                progressLoad();
                $.post('${pageContext.request.contextPath }/framework/logout.do', function(result) {
                    if(result.success){
                        progressClose();
                        window.location.href='${pageContext.request.contextPath }/index.jsp';
                    }
                }, 'json');
            }
        });
	}

	function editCurrentUserPwd() {
		parent.$.modalDialog({
			title : '修改密码',
			width : 300,
			height : 250,
			href : '${pageContext.request.contextPath}/user/editCurrentUserPwdPage.do',
			buttons : [ {
				text:"取消修改",
				iconCls:'icon-cancel',
				handler:function(){
					parent.$.modalDialog.handler.dialog('close');
				}
			},{
				text : '确认修改',
				iconCls:"icon-ok",
				handler : function() {
					var f = parent.$.modalDialog.handler.find('#editUserPwdForm');
					f.submit();
				}
			} ]
		});
	}
	function currentUserRole() {
		parent.$.modalDialog({
			title : '我的角色',
			width : 300,
			height : 250,
			href : '${pageContext.request.contextPath}/userController/currentUserRolePage'
		});
	}
	function currentUserResource() {
		parent.$.modalDialog({
			title : '我可以访问的资源',
			width : 300,
			height : 250,
			href : '${pageContext.request.contextPath}/userController/currentUserResourcePage'
		});
	}
</script>
<div id="sessionInfoDiv" style="position: absolute; right: 100px; bottom: 5px;" class="alert alert-info">
	<c:if test="${user != null}">[<strong>${user.loginName}</strong>]，欢迎您！</c:if>
</div>
<div style="position: absolute; right: 50px; top: 0px;">
	<a href="javascript:void(0);" class="easyui-menubutton" data-options="menu:'#layout_north_pfMenu',iconCls:'icon-rainbow'">更换皮肤</a> 
	<a href="javascript:void(0);" class="easyui-menubutton" data-options="menu:'#layout_north_kzmbMenu',iconCls:'cog-cog'">控制面板</a> 
	<a href="javascript:void(0);" class="easyui-menubutton" data-options="menu:'#layout_north_zxMenu',iconCls:'icon-house_go'">注销</a>
</div>
<div id="layout_north_pfMenu" style="width: 120px; display: none;">
	<div onclick="changeThemeFun('default');" title="default">default</div>
	<div onclick="changeThemeFun('gray');" title="gray">gray</div>
	<div onclick="changeThemeFun('bootstrap');" title="bootstrap">bootstrap</div>
	<div onclick="changeThemeFun('black');" title="black">black</div>
	<div onclick="changeThemeFun('metro');" title="metro">metro</div>
	<div onclick="changeThemeFun('material');" title="material">material</div>
	<div class="menu-sep"></div>
	<div onclick="changeThemeFun('metro-blue');" title="metro-blue">metro-blue</div>
	<div onclick="changeThemeFun('metro-gray');" title="metro-gray">metro-gray</div>
	<div onclick="changeThemeFun('metro-green');" title="metro-green">metro-green</div>
	<div onclick="changeThemeFun('metro-orange');" title="metro-orange">metro-orange</div>
	<div onclick="changeThemeFun('metro-red');" title="metro-red">metro-red</div>
</div>
<div id="layout_north_kzmbMenu" style="width: 100px; display: none;">
	<div onclick="editCurrentUserPwd();"  data-options="iconCls:'cog-cog_edit'">修改密码</div>
	<div class="menu-sep"></div>
	<div onclick="currentUserRole();"  data-options="iconCls:'icon-sum'">我的角色</div>
	<div class="menu-sep"></div>
	<div onclick="currentUserResource();"  data-options="iconCls:'icon-list'">我的权限</div>
</div>
<div id="layout_north_zxMenu" style="width: 100px; display: none;">
	<div onclick="logoutFun();" data-options="iconCls:'lock-lock_delete'">锁定窗口</div>
	<div class="menu-sep"></div>
	<div onclick="logoutFun();" data-options="iconCls:'lock-lock_edit'">重新登录</div>
	<div onclick="logoutFun(true);" data-options="iconCls:'lock-lock_go'">退出系统</div>
</div>