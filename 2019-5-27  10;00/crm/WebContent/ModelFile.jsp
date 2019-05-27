<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>用户模块管理中心</title>
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
						<ul id="tt" class="easyui-tree" data-options="iconCls:'icon-save',collapsible:true">
						</ul>

					</div>
				<!-- </div> -->
				<div id="mm" class="easyui-menu" data-options = "onClick:menuHandler" style="width: 160px;">
					<div data-options="iconCls:'icon-add',name:'add'">添加</div>
					<div data-options="iconCls:'icon-edit',name:'edit'">编辑</div>
					<div data-options="iconCls:'icon-remove',name:'del'">删除</div>
				</div>
				
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
				<a href="javascript:void(0)" class="easyui-linkbutton"  data-options="iconCls:'icon-ok',plain:true"   type="button" onclick="submitModuleForm()">保存</a>
				<a href="javascript:void(0)" class="easyui-linkbutton"  data-options="iconCls:'icon-no',plain:true"  onclick="closeUserForm()">取消</a>
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
				<a href="javascript:void(0)" class="easyui-linkbutton"   data-options="iconCls:'icon-ok',plain:true"   type="button" onclick="submitModuleForm1()">保存</a>
				<a href="javascript:void(0)" class="easyui-linkbutton"   data-options="iconCls:'icon-no',plain:true"   onclick="closeUserForm1()">取消</a>
			</div>
		</div>
</body>
  
<script type="text/javascript" src="js/JSPjs/ModelFile.js"></script>
</html>