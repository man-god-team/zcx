<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>用户管理中心</title>
<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.4.3/themes/icon.css">   
<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.4.3/themes/default/easyui.css">   
<script type="text/javascript" src="js/jquery-easyui-1.4.3/jquery.min.js"></script>   
<script type="text/javascript" src=js/jquery-easyui-1.4.3/jquery.easyui.min.js></script>  
<script type="text/javascript" src="js/jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>  

</head>
<body> 
	<table name="center" class="easyui-datagrid" id="dg" title="角色列表" style="width:300;height:400" data-options="rownumbers:true,singleSelect:true,pagination:true,method:'post',toolbar:'#usertb'">
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addModuleInfo()">新增</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" plain="true" onclick="updateModuleInfo()">修改</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-no" plain="true" onclick="deleteModuleInfo()">删除</a>
			<div class="easyui-layout" data-options="fit:true">
				<!-- <div data-options="region:'west',split:true" title="导航应用" style="width:150px;"> -->
					<div id="menuTree">
						<!--这个地方显示树状结构-->
						<ul id="tt" class="easyui-tree" data-options="iconCls:'icon-save',collapsible:true"></ul>

					</div>
				<!-- </div> -->
				<div id="mm" class="easyui-menu" data-options = "onClick:menuHandler" style="width: 160px;">
					<div data-options="iconCls:'icon-add',name:'add'">添加</div>
					<div data-options="iconCls:'icon-edit',name:'edit'">编辑</div>
					<div data-options="iconCls:'icon-remove',name:'del'">删除</div>
				</div>
		</table>

	<div id="updateuser_window" class="easyui-window" title="新增模块信息" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:500px;height:300px;padding:10px;">
			<form id="updateuserForm">
				<table cellpadding="5">
					<tr>
						<td>父模块名称:</td>
						<td>
							<div id="ename_1"></div>
						</td>
					</tr>
					<tr>
						<td>新模块名称:</td>
						<td><input class="easyui-textbox" type="text" id="modulename" name="modulename" data-options="required:true"></input>
						</td>
					</tr>
					<tr>
						<td>模块对应的路径:</td>
						<td><input class="easyui-textbox" type="text" name="path" id="path"></input>
						</td>
					</tr>

					<tr>
						<td>权重整数:</td>
						<td><input type="text" class="easyui-numberbox" id="weight" name="weight" data-options="required:true"></td>
					</tr>
				</table>
			</form>
			<div style="text-align:center;padding:5px">
				<a href="javascript:void(0)" class="easyui-linkbutton" type="button" onclick="submitModuleForm()">保存</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" onclick="closeUserForm()">取消</a>
			</div>
		</div>

		<div id="updateuser_window1" class="easyui-window" title="修改模快信息" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:500px;height:300px;padding:10px;">
			<form id="updateuserForm1">
				<table cellpadding="5">
					<tr>
						<td>修改模块名称:</td>
						<td><input class="easyui-textbox" type="text" id="updatename" name="updatename"></input>
						</td>
					</tr>
					<tr>
						<td>路径:</td>
						<td><input class="easyui-textbox" type="text" id="updatepath" name="updatepath"></input>
						</td>
					</tr>
					<tr>
						<td>权重:</td>
						<td><input class="easyui-textbox" type="text" id="updateweight" name="updateweight"></input>
						</td>
					</tr>
				</table>
			</form>
			<div style="text-align:center;padding:5px">
				<a href="javascript:void(0)" class="easyui-linkbutton" type="button" onclick="submitModuleForm1()">保存</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" onclick="closeUserForm()">取消</a>
			</div>
		</div>
</body>
  
<script type="text/javascript">
	$(function() {
		$("#tt").tree({
			url: 'showmodel', //数据接口的地址
			lines: true, 
			onContextMenu: function(e, node) {
				e.preventDefault();
				$("#tt").tree("select", node.target);
				$("#mm").menu("show", {
					left: e.pageX,
					top: e.pageY
				});
			}
		});
	});

	function menuHandler(item) {
		if(item.name == "add") {
			addModuleInfo();
		} else if(item.name == "edit") {
			updateModuleInfo();
		} else if(item.name == "del") {
			deleteModuleInfo();
		}
	}

	function addModuleInfo() {
		var nodes = $('#tt').tree('getSelected'); // get checked nodes
		/*var parent = $('#tt').tree('getParent', nodes.target);*/
		// alert(nodes.text);//获取
		//alert(nodes.id);//获取节点id
		/*alert(parent.id);*/
		if(nodes != null) {
			//将当前行数据填入表单
			$("#ename_1").text(nodes.text);
			$("#updateuser_window").window("open");
		} else {
			alert("请选择父节点！");
		}
	}

	//点击新增保存按钮
	function submitModuleForm() {
		var nodes = $('#tt').tree('getSelected');
		var flag = $("#updateuserForm").form("validate");
		var moduleName = $("#modulename").val();
		var weight = $("#weight").val();
		var path = $("#path").val();
		if(flag) {
			/* private Integer m_id;
			private String m_name;
			private Integer m_parentId;
			private String m_path;
			private Integer m_weight; */
			$.post("insertModules", {
				m_name: moduleName,
				m_parentId: nodes.id,
				m_path: path,
				m_weight: weight
				},
				function(res) {
					if(res>0) {
						$.messager.alert("提示信息", "新增成功");
						$("#updateuser_window").window("close");
						$("#tt").tree("reload");
					}else{
						$.messager.alert("提示信息",  "error");
					}
				}, "json");
		}
	}

	/*//点击新增取消按钮
	function clearModuleForm() {
		$('#addModuleForm').form('clear');
		$("#addModule_window").window("close");
	}*/ 
 
	function updateModuleInfo() {
		var nodes = $('#tt').tree('getSelected'); 
		 
		if(nodes != null) { 
			$.post("selectModuleById", {
				m_id: nodes.id
			}, function(res) {
				if(res) {
					//将当前行数据填入表单
					 $("#updatename").textbox("setValue",res.m_name);
					$("#updatepath").textbox("setValue", res.m_path);
					$("#updateweight").textbox("setValue", res.m_weight);
					$("#updateuser_window1").window("open");   
				}
			}, "json"); 
		} else {
			alert("请选择节点！");
		} 
	}

	function submitModuleForm1() {
		var nodes = $('#tt').tree('getSelected');
		var parent = $('#tt').tree('getParent', nodes.target);
		var flag = $("#updateuserForm1").form("validate");
		var updatename = $("#updatename").val();
		var updatepath = $("#updatepath").val();
		var updateweight = $("#updateweight").val();
		if(flag) { 
			$.post("updateModules", {
				m_id: nodes.id,
				m_name: updatename,
				m_parentId: parent.id,
				m_path: updatepath,
				m_weight: updateweight
				},
				function(res) {
					if(res>0) {
						$.messager.alert("提示信息", "修改成功", "error");
						$("#updateuser_window1").window("close");
						$("#tt").tree("reload");
					} else {
						$.messager.alert("提示信息", res.msg, "error");
					}
				}, "json");
		}
	}

	function deleteModuleInfo() {
		var nodes = $('#tt').tree('getSelected');
		$.messager.confirm('确认信息', '您确认想要删除吗？', function(r) {
			if(r) {
				if(nodes != null) {
					$.post("deleteModules", {
						m_id: nodes.id,
						},
						function(res) {
							if(res>0) {
								$.messager.alert("提示信息", "删除成功", "ok");
								$("#tt").tree("reload");
							} else {
								$.messager.alert("提示信息", "删除失败", "error");
							}
						}, "json");
				} else {
					$.messager.alert("提示信息", "请选择节点", "error");
				}
			}

		});

	}
	
	</script>
</html>