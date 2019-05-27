<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>用户角色管理中心</title>
<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.4.3/themes/icon.css">   
<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.4.3/themes/default/easyui.css">   
<script type="text/javascript" src="js/jquery-easyui-1.4.3/jquery.min.js"></script>   
<script type="text/javascript" src=js/jquery-easyui-1.4.3/jquery.easyui.min.js></script>  
<script type="text/javascript" src="js/jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js" charset="utf-8"></script>  

<script type="text/javascript" charset="gbk" src="js/JSPjs/RolesFile.js">


</script>
</head>
<body>
<table id="dg" class="easyui-datagrid">   
    <thead>   
        <tr>
        	 
            <th data-options="field:'r_id'">角色id</th>   
            <th data-options="field:'r_name'">角色名称</th>    
            <th data-options="field:'caozuo',formatter:caozuo">操作</th> 
           <th data-options="field:'actionUpdate',width:200,title:'设置权限',formatter:searchsetRoles">操作</th>
           
        </tr>   
    </thead>    
</table>  
<div id="tb">
	<form id="FormTb">
	<!-- 用户名、创建起止时间、创建结束时间、是否锁定（1：是；2：否）、排序（创建时间、最后登录时间) -->
		<label for="r_name">角色名称:</label> 
		<input class="easyui-validatebox" type="text" name="r_name" id="r_name"  />
		
		 
	</form>
<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onclick="init()">检索</a>
<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="addFrom()">新增用户</a>
</div>


<!-- 新增角色信息 -->
<div id="win" class="easyui-window" data-options="modal:true,closed:true,iconCls:'icon-ok'" style="width: 500px;height: 300px;padding: 10px;">
  
		   <form id="ff" >   
		   		<table style="padding-left:20px;text-align:center" >
		   			<tr>
		   				<td><label for="r_name">角色名称:</label> </td>
		   				<td> <input class="easyui-validatebox" type="text" name="r_name" id="r_name1"  /> </td>
		   			</tr> 
		   		
		   		</table>
		     <div style="text-align: center;padding: 5px;">
				<a href="javascript:void(0)" class="easyui-linkbutton"  data-options="iconCls:'icon-ok',plain:true"    onclick="addRoles()">保存</a>
				
				<a href="javascript:void(0)" class="easyui-linkbutton"  data-options="iconCls:'icon-no',plain:true"   onclick="closeAddTable2()">关闭</a>
				</div>			    
		       
			</form>   
</div>  

  
			 
			
	 
<!-- 修改角色信息 -->
<div id="win1" class="easyui-window"  title="修改信息" data-options="modal:true,closed:true,iconCls:'icon-ok'" style="width: 500px;height: 300px;padding: 10px;">
  
		   <form id="ff1" >   
		   		<table cellpadding="5" >
		   			<tr>
		   				<td><label for="r_id">角色id:</label> </td>
		   				<td> <input class="easyui-validatebox" disabled="disabled" type="text" name="r_id" id="r_id2"  /> </td>
		   			</tr> 
		   			<tr>
		   				<td><label for="r_name">角色名称:</label> </td>
		   				<td> <input class="easyui-validatebox" type="text" name="r_name" id="r_name2"  /> </td>
		   			</tr> 
		   		</table>
		    <div style="text-align: center;padding: 5px;">
				<a href="javascript:void(0)" class="easyui-linkbutton"  data-options="iconCls:'icon-ok',plain:true"      onclick="UpdateRoles()">保存</a>
				
				<a href="javascript:void(0)" class="easyui-linkbutton"   data-options="iconCls:'icon-no',plain:true"     onclick="closeAddTable1()">关闭</a>
			</div>
				
							    
		       
			</form>   
</div>  
<!-- 查看模塊信息 -->
	<div id="wd" class="easyui-window" title="查看信息" data-options="modal:true,closed:true,iconCls:'icon-ok'" style="width: 500px;height: 300px;padding: 10px;">
			<form id="frm">
				<table cellpadding="5">
					<tr>
						<td>角色名称：</td>
						<td><input class="easyui-textbox" type="text" name="r_name"  disabled="disabled"/></td>
					</tr>
				</table>
			</form>
			<div style="text-align: center;padding: 5px;">
				<a href="javascript:void(0)" class="easyui-linkbutton" type="button" onclick="closechakan()">关闭</a>
			</div>
		</div>
		<!-- 樹狀圖 -->
	<div class="easyui-window" id="mkWindow" data-options="closed:true">

			<div class="easyui-layout" style="width:200px;height:400px;">

				<div id="centerTabs" data-options="region:'center',iconCls:'icon-ok',title:'模块信息',collapsible:true" style="width: 530px;">
					<div id="menuTree">
						<!--这个地方显示树状结构-->

					</div>
				</div>
				<div data-options="region:'south'">
					<input type="button" onclick="tijiaoModules()" value="提交" />
				</div>
			</div>
		</div>
</body>
</html>