
/**
 * 使panel和datagrid在加载时提示
 * 
 
 * 
 * @requires jQuery,EasyUI
 * 
 */
$.fn.panel.defaults.loadingMessage = '加载中....';
$.fn.datagrid.defaults.loadMsg = '加载中....';

/**
 
 * 
 * @requires jQuery,EasyUI
 * 
 * panel关闭时回收内存，主要用于layout使用iframe嵌入网页时的内存泄漏问题
 */
$.fn.panel.defaults.onBeforeDestroy = function() {
	var frame = $('iframe', this);
	try {
		if (frame.length > 0) {
			for ( var i = 0; i < frame.length; i++) {
				frame[i].src = '';
				frame[i].contentWindow.document.write('');
				frame[i].contentWindow.close();
			}
			frame.remove();
			if (navigator.userAgent.indexOf("MSIE") > 0) {// IE特有回收内存方法
				try {
					CollectGarbage();
				} catch (e) {
				}
			}
		}
	} catch (e) {
	}
};

/**
 
 * 
 * @requires jQuery,EasyUI
 * 
 * 防止panel/window/dialog组件超出浏览器边界
 * @param left
 * @param top
 */
var easyuiPanelOnMove = function(left, top) {
	var l = left;
	var t = top;
	if (l < 1) {
		l = 1;
	}
	if (t < 1) {
		t = 1;
	}
	var width = parseInt($(this).parent().css('width')) + 14;
	var height = parseInt($(this).parent().css('height')) + 14;
	var right = l + width;
	var buttom = t + height;
	var browserWidth = $(window).width();
	var browserHeight = $(window).height();
	if (right > browserWidth) {
		l = browserWidth - width;
	}
	if (buttom > browserHeight) {
		t = browserHeight - height;
	}
	$(this).parent().css({/* 修正面板位置 */
		left : l,
		top : t
	});
};
$.fn.dialog.defaults.onMove = easyuiPanelOnMove;
$.fn.window.defaults.onMove = easyuiPanelOnMove;
$.fn.panel.defaults.onMove = easyuiPanelOnMove;

/**
 
 * 
 * @requires jQuery,EasyUI
 * 
 * 通用错误提示
 * 
 * 用于datagrid/treegrid/tree/combogrid/combobox/form加载数据出错时的操作
 */
var easyuiErrorFunction = function(XMLHttpRequest) {
	$.messager.progress('close');
	$.messager.alert('错误', XMLHttpRequest.responseText);
};
$.fn.datagrid.defaults.onLoadError = easyuiErrorFunction;
$.fn.treegrid.defaults.onLoadError = easyuiErrorFunction;
$.fn.tree.defaults.onLoadError = easyuiErrorFunction;
$.fn.combogrid.defaults.onLoadError = easyuiErrorFunction;
$.fn.combobox.defaults.onLoadError = easyuiErrorFunction;
$.fn.form.defaults.onLoadError = easyuiErrorFunction;

/**
 
 * 
 * @requires jQuery,EasyUI
 * 
 * 为datagrid、treegrid增加表头菜单，用于显示或隐藏列，注意：冻结列不在此菜单中
 */
var createGridHeaderContextMenu = function(e, field) {
	e.preventDefault();
	var grid = $(this);/* grid本身 */
	var headerContextMenu = this.headerContextMenu;/* grid上的列头菜单对象 */
	if (!headerContextMenu) {
		var tmenu = $('<div style="width:100px;"></div>').appendTo('body');
		var fields = grid.datagrid('getColumnFields');
		for ( var i = 0; i < fields.length; i++) {
			var fildOption = grid.datagrid('getColumnOption', fields[i]);
			if (!fildOption.hidden) {
				$('<div iconCls="tick" field="' + fields[i] + '"/>').html(fildOption.title).appendTo(tmenu);
			} else {
				$('<div iconCls="bullet_blue" field="' + fields[i] + '"/>').html(fildOption.title).appendTo(tmenu);
			}
		}
		headerContextMenu = this.headerContextMenu = tmenu.menu({
			onClick : function(item) {
				var field = $(item.target).attr('field');
				if (item.iconCls == 'tick') {
					grid.datagrid('hideColumn', field);
					$(this).menu('setIcon', {
						target : item.target,
						iconCls : 'bullet_blue'
					});
				} else {
					grid.datagrid('showColumn', field);
					$(this).menu('setIcon', {
						target : item.target,
						iconCls : 'tick'
					});
				}
			}
		});
	}
	headerContextMenu.menu('show', {
		left : e.pageX,
		top : e.pageY
	});
};
$.fn.datagrid.defaults.onHeaderContextMenu = createGridHeaderContextMenu;
$.fn.treegrid.defaults.onHeaderContextMenu = createGridHeaderContextMenu;

/**
 * grid tooltip参数
 * 
 
 */
var gridTooltipOptions = {
	tooltip : function(jq, fields) {
		return jq.each(function() {
			var panel = $(this).datagrid('getPanel');
			if (fields && typeof fields == 'object' && fields.sort) {
				$.each(fields, function() {
					var field = this;
					bindEvent($('.datagrid-body td[field=' + field + '] .datagrid-cell', panel));
				});
			} else {
				bindEvent($(".datagrid-body .datagrid-cell", panel));
			}
		});

		function bindEvent(jqs) {
			jqs.mouseover(function() {
				var content = $(this).text();
				if (content.replace(/(^\s*)|(\s*$)/g, '').length > 5) {
					$(this).tooltip({
						content : content,
						trackMouse : true,
						position : 'bottom',
						onHide : function() {
							$(this).tooltip('destroy');
						},
						onUpdate : function(p) {
							var tip = $(this).tooltip('tip');
							if (parseInt(tip.css('width')) > 500) {
								tip.css('width', 500);
							}
						}
					}).tooltip('show');
				}
			});
		}
	}
};
/**
 * Datagrid扩展方法tooltip 基于Easyui 1.3.3，可用于Easyui1.3.3+
 * 
 * 简单实现，如需高级功能，可以自由修改
 * 
 * 使用说明:
 * 
 * 在easyui.min.js之后导入本js
 * 
 * 代码案例:
 * 
 * $("#dg").datagrid('tooltip'); 所有列
 * 
 * $("#dg").datagrid('tooltip',['productid','listprice']); 指定列
 * 
 * @author 夏悸
 */
$.extend($.fn.datagrid.methods, gridTooltipOptions);

/**
 * Treegrid扩展方法tooltip 基于Easyui 1.3.3，可用于Easyui1.3.3+
 * 
 * 简单实现，如需高级功能，可以自由修改
 * 
 * 使用说明:
 * 
 * 在easyui.min.js之后导入本js
 * 
 * 代码案例:
 * 
 * $("#dg").treegrid('tooltip'); 所有列
 * 
 * $("#dg").treegrid('tooltip',['productid','listprice']); 指定列
 * 
 * @author 夏悸
 */
$.extend($.fn.treegrid.methods, gridTooltipOptions);

/**
 
 * 
 * @requires jQuery,EasyUI
 * 
 * 扩展validatebox，添加验证两次密码功能
 */
$.extend($.fn.validatebox.defaults.rules, {
	eqPwd : {
		validator : function(value, param) {
			return value == $(param[0]).val();
		},
		message : '密码不一致！'
	}
});

/**
 * @author 夏悸
 * 
 * @requires jQuery,EasyUI
 * 
 * 扩展tree，使其可以获取实心节点
 */
$.extend($.fn.tree.methods, {
	getCheckedExt : function(jq) {// 获取checked节点(包括实心)
		var checked = $(jq).tree("getChecked");
		var checkbox2 = $(jq).find("span.tree-checkbox2").parent();
		$.each(checkbox2, function() {
			var node = $.extend({}, $.data(this, "tree-node"), {
				target : this
			});
			checked.push(node);
		});
		return checked;
	},
	getSolidExt : function(jq) {// 获取实心节点
		var checked = [];
		var checkbox2 = $(jq).find("span.tree-checkbox2").parent();
		$.each(checkbox2, function() {
			var node = $.extend({}, $.data(this, "tree-node"), {
				target : this
			});
			checked.push(node);
		});
		return checked;
	}
});

/**
 * @author 夏悸
 * 
 * @requires jQuery,EasyUI
 * 
 * 扩展tree，使其支持平滑数据格式
 */
$.fn.tree.defaults.loadFilter = function(data, parent) {
	var opt = $(this).data().tree.options;
	var idFiled, textFiled, parentField;
	if (opt.parentField) {
		idFiled = opt.idFiled || 'id';
		textFiled = opt.textFiled || 'text';
		parentField = opt.parentField;
		var i, l, treeData = [], tmpMap = [];
		for (i = 0, l = data.length; i < l; i++) {
			tmpMap[data[i][idFiled]] = data[i];
		}
		for (i = 0, l = data.length; i < l; i++) {
			if (tmpMap[data[i][parentField]] && data[i][idFiled] != data[i][parentField]) {
				if (!tmpMap[data[i][parentField]]['children'])
					tmpMap[data[i][parentField]]['children'] = [];
				data[i]['text'] = data[i][textFiled];
				tmpMap[data[i][parentField]]['children'].push(data[i]);
			} else {
				data[i]['text'] = data[i][textFiled];
				treeData.push(data[i]);
			}
		}
		return treeData;
	}
	return data;
};

/**
 
 * 
 * @requires jQuery,EasyUI
 * 
 * 扩展treegrid，使其支持平滑数据格式
 */
$.fn.treegrid.defaults.loadFilter = function(data, parentId) {
	var opt = $(this).data().treegrid.options;
	var idFiled, textFiled, parentField;
	if (opt.parentField) {
		idFiled = opt.idFiled || 'id';
		textFiled = opt.textFiled || 'text';
		parentField = opt.parentField;
		var i, l, treeData = [], tmpMap = [];
		for (i = 0, l = data.length; i < l; i++) {
			tmpMap[data[i][idFiled]] = data[i];
		}
		for (i = 0, l = data.length; i < l; i++) {
			if (tmpMap[data[i][parentField]] && data[i][idFiled] != data[i][parentField]) {
				if (!tmpMap[data[i][parentField]]['children'])
					tmpMap[data[i][parentField]]['children'] = [];
				data[i]['text'] = data[i][textFiled];
				tmpMap[data[i][parentField]]['children'].push(data[i]);
			} else {
				data[i]['text'] = data[i][textFiled];
				treeData.push(data[i]);
			}
		}
		return treeData;
	}
	return data;
};

/**
 
 * 
 * @requires jQuery,EasyUI
 * 
 * 扩展combotree，使其支持平滑数据格式
 */
$.fn.combotree.defaults.loadFilter = $.fn.tree.defaults.loadFilter;

/**
 
 * 
 * @requires jQuery,EasyUI
 * 
 * 创建一个模式化的dialog
 * 
 * @returns $.modalDialog.handler 这个handler代表弹出的dialog句柄
 * 
 * @returns $.modalDialog.xxx 这个xxx是可以自己定义名称，主要用在弹窗关闭时，刷新某些对象的操作，可以将xxx这个对象预定义好
 */
$.modalDialog = function(options) {
	if ($.modalDialog.handler == undefined) {// 避免重复弹出
		var opts = $.extend({
			title : '',
			width : 840,
			height : 680,
			modal : true,
			onClose : function() {
				$.modalDialog.handler = undefined;
				$(this).dialog('destroy');
			},
			onOpen : function() {
				parent.$.messager.progress({
					title : '提示',
					text : '数据处理中，请稍后....'
				});
			}
		}, options);
		opts.modal = true;// 强制此dialog为模式化，无视传递过来的modal参数
		return $.modalDialog.handler = $('<div/>').dialog(opts);
	}
};

/**
 
 * 
 * 定义一些小图标样式的数组
 */
$.iconData = [ {
	value : '',
	text : '请选择图标'
}, {
	value : 'icon-add',
	text : 'icon-add'
}, {
	value : 'icon-list',
	text : 'icon-list'
}, {
	value : 'icon-edit',
	text : 'icon-edit'
}, {
	value : 'icon-del',
	text : 'icon-del'
},
{
	value : 'icon-back',
	text : 'icon-back'
},
{
	value : 'bell-bell',
	text : 'bell-bell'
},
{
	value : 'bell-bell_add',
	text : 'bell-bell_add'
},
{
	value : 'bell-bell_delete',
	text : 'bell-bell_delete'
},
{
	value : 'bell-bell_error',
	text : 'bell-bell_error'
},
{
	value : 'bell-bell_go',
	text : 'bell-bell_go'
},
{
	value : 'bell-bell_link',
	text : 'bell-bell_link'
},
{
	value : 'icon-blank',
	text : 'icon-blank'
},
{
	value : 'book-book',
	text : 'book-book'
},
{
	value : 'book-book_add',
	text : 'book-book_add'
},
{
	value : 'book-book_addresses',
	text : 'book-book_addresses'
},
{
	value : 'book-book_delete',
	text : 'book-book_delete'
},
{
	value : 'book-book_edit',
	text : 'book-book_edit'
},
{
	value : 'book-book_error',
	text : 'book-book_error'
},
{
	value : 'book-book_go',
	text : 'book-book_go'
},
{
	value : 'book-book_key',
	text : 'book-book_key'
},
{
	value : 'book-book_link',
	text : 'book-book_link'
},
{
	value : 'book-book_next',
	text : 'book-book_next'
},
{
	value : 'book-book_open',
	text : 'book-book_open'
},
{
	value : 'book-book_previous',
	text : 'book-book_previous'
},
{
	value : 'icon-btn',
	text : 'icon-btn'
},
{
	value : 'bug-bug',
	text : 'bug-bug'
},
{
	value : 'bug-bug_add',
	text : 'bug-bug_add'
},
{
	value : 'bug-bug_delete',
	text : 'bug-bug_delete'
},
{
	value : 'bug-bug_edit',
	text : 'bug-bug_edit'
},
{
	value : 'bug-bug_error',
	text : 'bug-bug_error'
},
{
	value : 'bug-bug_go',
	text : 'bug-bug_go'
},
{
	value : 'bug-bug_link',
	text : 'bug-bug_link'
},
{
	value : 'icon-cancel',
	text : 'icon-cancel'
},
{
	value : 'chart-chart_bar',
	text : 'chart-chart_bar'
},
{
	value : 'chart-chart_bar_add',
	text : 'chart-chart_bar_add'
},
{
	value : 'chart-chart_bar_delete',
	text : 'chart-chart_bar_delete'
},
{
	value : 'chart-chart_bar_edit',
	text : 'chart-chart_bar_edit'
},
{
	value : 'chart-chart_bar_error',
	text : 'chart-chart_bar_error'
},
{
	value : 'chart-chart_bar_link',
	text : 'chart-chart_bar_link'
},
{
	value : 'chart-chart_curve',
	text : 'chart-chart_curve'
},
{
	value : 'chart-chart_curve_add',
	text : 'chart-chart_curve_add'
},
{
	value : 'chart-chart_curve_delete',
	text : 'chart-chart_curve_delete'
},
{
	value : 'chart-chart_curve_edit',
	text : 'chart-chart_curve_edit'
},
{
	value : 'chart-chart_curve_error',
	text : 'chart-chart_curve_error'
},
{
	value : 'chart-chart_curve_go',
	text : 'chart-chart_curve_go'
},
{
	value : 'chart-chart_curve_link',
	text : 'chart-chart_curve_link'
},
{
	value : 'chart-chart_line',
	text : 'chart-chart_line'
},
{
	value : 'chart-chart_line_add',
	text : 'chart-chart_line_add'
},
{
	value : 'chart-chart_line_delete',
	text : 'chart-chart_line_delete'
},
{
	value : 'chart-chart_line_edit',
	text : 'chart-chart_line_edit'
},
{
	value : 'chart-chart_line_error',
	text : 'chart-chart_line_error'
},
{
	value : 'chart-chart_line_link',
	text : 'chart-chart_line_link'
},
{
	value : 'chart-chart_organisation',
	text : 'chart-chart_organisation'
},
{
	value : 'chart-chart_organisation_add',
	text : 'chart-chart_organisation_add'
},
{
	value : 'chart-chart_organisation_delete',
	text : 'chart-chart_organisation_delete'
},
{
	value : 'chart-chart_pie',
	text : 'chart-chart_pie'
},
{
	value : 'chart-chart_pie_add',
	text : 'chart-chart_pie_add'
},
{
	value : 'chart-chart_pie_delete',
	text : 'chart-chart_pie_delete'
},
{
	value : 'chart-chart_pie_edit',
	text : 'chart-chart_pie_edit'
},
{
	value : 'chart-chart_pie_error',
	text : 'chart-chart_pie_error'
},
{
	value : 'chart-chart_pie_link',
	text : 'chart-chart_pie_link'
},
{
	value : 'icon-clear',
	text : 'icon-clear'
},
{
	value : 'clock-clock',
	text : 'clock-clock'
},
{
	value : 'clock-clock_add',
	text : 'clock-clock_add'
},
{
	value : 'clock-clock_delete',
	text : 'clock-clock_delete'
},
{
	value : 'clock-clock_edit',
	text : 'clock-clock_edit'
},
{
	value : 'clock-clock_error',
	text : 'clock-clock_error'
},
{
	value : 'clock-clock_go',
	text : 'clock-clock_go'
},
{
	value : 'clock-clock_link',
	text : 'clock-clock_link'
},
{
	value : 'clock-clock_pause',
	text : 'clock-clock_pause'
},
{
	value : 'clock-clock_play',
	text : 'clock-clock_play'
},
{
	value : 'clock-clock_red',
	text : 'clock-clock_red'
},
{
	value : 'clock-clock_stop',
	text : 'clock-clock_stop'
},
{
	value : 'cog-cog',
	text : 'cog-cog'
},
{
	value : 'cog-cog_add',
	text : 'cog-cog_add'
},
{
	value : 'cog-cog_delete',
	text : 'cog-cog_delete'
},
{
	value : 'cog-cog_edit',
	text : 'cog-cog_edit'
},
{
	value : 'cog-cog_error',
	text : 'cog-cog_error'
},
{
	value : 'cog-cog_go',
	text : 'cog-cog_go'
},
{
	value : 'icon-company',
	text : 'icon-company'
},
{
	value : 'control-control_eject',
	text : 'control-control_eject'
},
{
	value : 'control-control_eject_blue',
	text : 'control-control_eject_blue'
},
{
	value : 'control-control_end',
	text : 'control-control_end'
},
{
	value : 'control-control_end_blue',
	text : 'control-control_end_blue'
},
{
	value : 'control-control_equalizer',
	text : 'control-control_equalizer'
},
{
	value : 'control-control_equalizer_blue',
	text : 'control-control_equalizer_blue'
},
{
	value : 'control-control_fastforward',
	text : 'control-control_fastforward'
},
{
	value : 'control-control_fastforward_blue',
	text : 'control-control_fastforward_blue'
},
{
	value : 'control-control_pause',
	text : 'control-control_pause'
},
{
	value : 'control-control_pause_blue',
	text : 'control-control_pause_blue'
},
{
	value : 'control-control_play',
	text : 'control-control_play'
},
{
	value : 'control-control_play_blue',
	text : 'control-control_play_blue'
},
{
	value : 'control-control_repeat',
	text : 'control-control_repeat'
},
{
	value : 'control-control_repeat_blue',
	text : 'control-control_repeat_blue'
},
{
	value : 'control-control_rewind',
	text : 'control-control_rewind'
},
{
	value : 'control-control_rewind_blue',
	text : 'control-control_rewind_blue'
},
{
	value : 'control-control_start',
	text : 'control-control_start'
},
{
	value : 'control-control_start_blue',
	text : 'control-control_start_blue'
},
{
	value : 'control-control_stop',
	text : 'control-control_stop'
},
{
	value : 'control-control_stop_blue',
	text : 'control-control_stop_blue'
},
{
	value : 'css-css',
	text : 'css-css'
},
{
	value : 'css-css_add',
	text : 'css-css_add'
},
{
	value : 'css-css_delete',
	text : 'css-css_delete'
},
{
	value : 'css-css_go',
	text : 'css-css_go'
},
{
	value : 'css-css_valid',
	text : 'css-css_valid'
},
{
	value : 'icon-cut',
	text : 'icon-cut'
},
{
	value : 'Date-date',
	text : 'Date-date'
},
{
	value : 'Date-date_add',
	text : 'Date-date_add'
},
{
	value : 'Date-date_delete',
	text : 'Date-date_delete'
},
{
	value : 'Date-date_edit',
	text : 'Date-date_edit'
},
{
	value : 'Date-date_error',
	text : 'Date-date_error'
},
{
	value : 'Date-date_go',
	text : 'Date-date_go'
},
{
	value : 'Date-date_link',
	text : 'Date-date_link'
},
{
	value : 'Date-date_magnify',
	text : 'Date-date_magnify'
},
{
	value : 'Date-date_next',
	text : 'Date-date_next'
},
{
	value : 'Date-date_previous',
	text : 'Date-date_previous'
},
{
	value : 'icon-del',
	text : 'icon-del'
},
{
	value : 'driver-drive',
	text : 'driver-drive'
},
{
	value : 'driver-drive_add',
	text : 'driver-drive_add'
},
{
	value : 'driver-drive_burn',
	text : 'driver-drive_burn'
},
{
	value : 'driver-drive_cd',
	text : 'driver-drive_cd'
},
{
	value : 'driver-drive_cd_empty',
	text : 'driver-drive_cd_empty'
},
{
	value : 'driver-drive_delete',
	text : 'driver-drive_delete'
},
{
	value : 'driver-drive_disk',
	text : 'driver-drive_disk'
},
{
	value : 'driver-drive_edit',
	text : 'driver-drive_edit'
},
{
	value : 'driver-drive_error',
	text : 'driver-drive_error'
},
{
	value : 'driver-drive_go',
	text : 'driver-drive_go'
},
{
	value : 'driver-drive_key',
	text : 'driver-drive_key'
},
{
	value : 'driver-drive_link',
	text : 'driver-drive_link'
},
{
	value : 'driver-drive_magnify',
	text : 'driver-drive_magnify'
},
{
	value : 'driver-drive_network',
	text : 'driver-drive_network'
},
{
	value : 'driver-drive_rename',
	text : 'driver-drive_rename'
},
{
	value : 'driver-drive_user',
	text : 'driver-drive_user'
},
{
	value : 'driver-drive_web',
	text : 'driver-drive_web'
},
{
	value : 'icon-edit_add',
	text : 'icon-edit_add'
},
{
	value : 'icon-edit_remove',
	text : 'icon-edit_remove'
},
{
	value : 'email-email',
	text : 'email-email'
},
{
	value : 'email-email_add',
	text : 'email-email_add'
},
{
	value : 'email-email_attach',
	text : 'email-email_attach'
},
{
	value : 'email-email_delete',
	text : 'email-email_delete'
},
{
	value : 'email-email_edit',
	text : 'email-email_edit'
},
{
	value : 'email-email_error',
	text : 'email-email_error'
},
{
	value : 'email-email_go',
	text : 'email-email_go'
},
{
	value : 'email-email_link',
	text : 'email-email_link'
},
{
	value : 'email-email_open',
	text : 'email-email_open'
},
{
	value : 'email-email_open_image',
	text : 'email-email_open_image'
},
{
	value : 'icon-emoticon_evilgrin',
	text : 'icon-emoticon_evilgrin'
},
{
	value : 'icon-emoticon_grin',
	text : 'icon-emoticon_grin'
},
{
	value : 'icon-emoticon_happy',
	text : 'icon-emoticon_happy'
},
{
	value : 'icon-emoticon_smile',
	text : 'icon-emoticon_smile'
},
{
	value : 'icon-emoticon_surprised',
	text : 'icon-emoticon_surprised'
},
{
	value : 'icon-emoticon_tongue',
	text : 'icon-emoticon_tongue'
},
{
	value : 'icon-emoticon_unhappy',
	text : 'icon-emoticon_unhappy'
},
{
	value : 'icon-emoticon_wink',
	text : 'icon-emoticon_wink'
},
{
	value : 'icon-error',
	text : 'icon-error'
},
{
	value : 'icon-eye',
	text : 'icon-eye'
},
{
	value : 'feed-feed',
	text : 'feed-feed'
},
{
	value : 'feed-feed_add',
	text : 'feed-feed_add'
},
{
	value : 'feed-feed_delete',
	text : 'feed-feed_delete'
},
{
	value : 'feed-feed_disk',
	text : 'feed-feed_disk'
},
{
	value : 'feed-feed_edit',
	text : 'feed-feed_edit'
},
{
	value : 'feed-feed_error',
	text : 'feed-feed_error'
},
{
	value : 'feed-feed_go',
	text : 'feed-feed_go'
},
{
	value : 'feed-feed_key',
	text : 'feed-feed_key'
},
{
	value : 'feed-feed_link',
	text : 'feed-feed_link'
},
{
	value : 'feed-feed_magnify',
	text : 'feed-feed_magnify'
},
{
	value : 'feed-Thumbs',
	text : 'feed-Thumbs'
},
{
	value : 'icon-filesave',
	text : 'icon-filesave'
},
{
	value : 'icon-filter',
	text : 'icon-filter'
},
{
	value : 'flag-flag_blue',
	text : 'flag-flag_blue'
},
{
	value : 'flag-flag_green',
	text : 'flag-flag_green'
},
{
	value : 'flag-flag_orange',
	text : 'flag-flag_orange'
},
{
	value : 'flag-flag_pink',
	text : 'flag-flag_pink'
},
{
	value : 'flag-flag_purple',
	text : 'flag-flag_purple'
},
{
	value : 'flag-flag_red',
	text : 'flag-flag_red'
},
{
	value : 'flag-flag_yellow',
	text : 'flag-flag_yellow'
},
{
	value : 'flag-Thumbs',
	text : 'flag-Thumbs'
},
{
	value : 'icon-folder',
	text : 'icon-folder'
},
{
	value : 'group-group',
	text : 'group-group'
},
{
	value : 'group-group_add',
	text : 'group-group_add'
},
{
	value : 'group-group_delete',
	text : 'group-group_delete'
},
{
	value : 'group-group_edit',
	text : 'group-group_edit'
},
{
	value : 'group-group_error',
	text : 'group-group_error'
},
{
	value : 'group-group_gear',
	text : 'group-group_gear'
},
{
	value : 'group-group_go',
	text : 'group-group_go'
},
{
	value : 'group-group_key',
	text : 'group-group_key'
},
{
	value : 'group-group_link',
	text : 'group-group_link'
},
{
	value : 'icon-help',
	text : 'icon-help'
},
{
	value : 'icon-home',
	text : 'icon-home'
},
{
	value : 'icon-house',
	text : 'icon-house'
},
{
	value : 'icon-house_go',
	text : 'icon-house_go'
},
{
	value : 'icon-house_link',
	text : 'icon-house_link'
},
{
	value : 'icon-large_chart',
	text : 'icon-large_chart'
},
{
	value : 'icon-large_clipart',
	text : 'icon-large_clipart'
},
{
	value : 'icon-large_picture',
	text : 'icon-large_picture'
},
{
	value : 'icon-large_shapes',
	text : 'icon-large_shapes'
},
{
	value : 'icon-large_smartart',
	text : 'icon-large_smartart'
},
{
	value : 'icon-list',
	text : 'icon-list'
},
{
	value : 'lock-lock',
	text : 'lock-lock'
},
{
	value : 'lock-lock_add',
	text : 'lock-lock_add'
},
{
	value : 'lock-lock_break',
	text : 'lock-lock_break'
},
{
	value : 'lock-lock_delete',
	text : 'lock-lock_delete'
},
{
	value : 'lock-lock_edit',
	text : 'lock-lock_edit'
},
{
	value : 'lock-lock_go',
	text : 'lock-lock_go'
},
{
	value : 'lock-lock_open',
	text : 'lock-lock_open'
},
{
	value : 'icon-lock',
	text : 'icon-lock'
},
{
	value : 'icon-man',
	text : 'icon-man'
},
{
	value : 'icon-mini_add',
	text : 'icon-mini_add'
},
{
	value : 'icon-mini_edit',
	text : 'icon-mini_edit'
},
{
	value : 'icon-mini_refresh',
	text : 'icon-mini_refresh'
},
{
	value : 'monitor-monitor',
	text : 'monitor-monitor'
},
{
	value : 'monitor-monitor_add',
	text : 'monitor-monitor_add'
},
{
	value : 'monitor-monitor_delete',
	text : 'monitor-monitor_delete'
},
{
	value : 'monitor-monitor_edit',
	text : 'monitor-monitor_edit'
},
{
	value : 'monitor-monitor_error',
	text : 'monitor-monitor_error'
},
{
	value : 'monitor-monitor_go',
	text : 'monitor-monitor_go'
},
{
	value : 'monitor-monitor_lightning',
	text : 'monitor-monitor_lightning'
},
{
	value : 'monitor-monitor_link',
	text : 'monitor-monitor_link'
},
{
	value : 'icon-more',
	text : 'icon-more'
},
{
	value : 'icon-no',
	text : 'icon-no'
},
{
	value : 'icon-ok',
	text : 'icon-ok'
},
{
	value : 'icon-palette',
	text : 'icon-palette'
},
{
	value : 'icon-pencil',
	text : 'icon-pencil'
},
{
	value : 'icon-print',
	text : 'icon-print'
},
{
	value : 'printer-printer',
	text : 'printer-printer'
},
{
	value : 'printer-printer_add',
	text : 'printer-printer_add'
},
{
	value : 'printer-printer_delete',
	text : 'printer-printer_delete'
},
{
	value : 'printer-printer_empty',
	text : 'printer-printer_empty'
},
{
	value : 'printer-printer_error',
	text : 'printer-printer_error'
},
{
	value : 'icon-rainbow',
	text : 'icon-rainbow'
},
{
	value : 'icon-redo',
	text : 'icon-redo'
},
{
	value : 'icon-refresh',
	text : 'icon-refresh'
},
{
	value : 'icon-reload',
	text : 'icon-reload'
},
{
	value : 'icon-search',
	text : 'icon-search'
},
{
	value : 'start-award_star_add',
	text : 'start-award_star_add'
},
{
	value : 'start-award_star_bronze_1',
	text : 'start-award_star_bronze_1'
},
{
	value : 'start-award_star_bronze_2',
	text : 'start-award_star_bronze_2'
},
{
	value : 'start-award_star_bronze_3',
	text : 'start-award_star_bronze_3'
},
{
	value : 'start-award_star_delete',
	text : 'start-award_star_delete'
},
{
	value : 'start-award_star_gold_1',
	text : 'start-award_star_gold_1'
},
{
	value : 'start-award_star_gold_2',
	text : 'start-award_star_gold_2'
},
{
	value : 'start-award_star_gold_3',
	text : 'start-award_star_gold_3'
},
{
	value : 'start-award_star_silver_1',
	text : 'start-award_star_silver_1'
},
{
	value : 'start-award_star_silver_2',
	text : 'start-award_star_silver_2'
},
{
	value : 'start-award_star_silver_3',
	text : 'start-award_star_silver_3'
},
{
	value : 'icon-sum',
	text : 'icon-sum'
},
{
	value : 'time-thumb_down',
	text : 'time-thumb_down'
},
{
	value : 'time-thumb_up',
	text : 'time-thumb_up'
},
{
	value : 'time-time',
	text : 'time-time'
},
{
	value : 'time-time_add',
	text : 'time-time_add'
},
{
	value : 'time-time_delete',
	text : 'time-time_delete'
},
{
	value : 'time-time_go',
	text : 'time-time_go'
},
{
	value : 'icon-tip',
	text : 'icon-tip'
},
{
	value : 'icon-transmit',
	text : 'icon-transmit'
},
{
	value : 'icon-tux',
	text : 'icon-tux'
},
{
	value : 'icon-undo',
	text : 'icon-undo'
},
{
	value : 'user-user',
	text : 'user-user'
},
{
	value : 'user-user_add',
	text : 'user-user_add'
},
{
	value : 'user-user_comment',
	text : 'user-user_comment'
},
{
	value : 'user-user_delete',
	text : 'user-user_delete'
},
{
	value : 'user-user_edit',
	text : 'user-user_edit'
},
{
	value : 'user-user_female',
	text : 'user-user_female'
},
{
	value : 'user-user_go',
	text : 'user-user_go'
},
{
	value : 'user-user_gray',
	text : 'user-user_gray'
},
{
	value : 'user-user_green',
	text : 'user-user_green'
},
{
	value : 'user-user_orange',
	text : 'user-user_orange'
},
{
	value : 'user-user_red',
	text : 'user-user_red'
},
{
	value : 'user-user_suit',
	text : 'user-user_suit'
} ];