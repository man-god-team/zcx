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
<script type="text/javascript">
$(function(){
	init();
})

function init(){ 
	$('#dg').datagrid({    
	    url:'showRoles',    
	    method:"post",
	    pagination:true,
	    singleSelect:true,
	    toolbar: '#tb',
	    queryParams: {
	    	r_name:$("#r_name").val()
		}
	}); 
	$("#FormTb").form('clear');
	

}
function caozuo(value,row,index){
	return '<a href="javascript:void(0)" class="easyui-linkbutton"  onclick="editRoles('+index+')">修改</a>   <a href="javascript:void(0)" class="easyui-linkbutton"  onclick="deleteRoles('+index+')">删除 </a>'
}
function editRoles(index){
	 
	var rows=$("#dg").datagrid('getData').rows[index];
	 
	$("#ff1").form("load",rows);
	$("#win1").window('open');
}
function UpdateRoles(){
	$.post("UpdateRoles",{ r_name:$("#r_name2").val(),r_id:$("#r_id2").val()},function(res){
		if(res>0){
			$('#dg').datagrid('reload'); 
			$("#ff1").form("clear");
			$('#win1').window('close'); 
			$.messager.alert("提示","修改成功");
		}else{
			$.messager.alert("提示","该用户角色已存在");
		}
	})
}
function deleteRoles(index){
	var r_id=$("#dg").datagrid('getData').rows[index].r_id;
	$.post("deleteRoles",{r_id:r_id},function(res){
		if(res>0){
			$('#dg').datagrid('reload'); 
			  
			$.messager.alert("提示","删除成功");
		}else{
			$.messager.alert("提示","删除失败");
		}
	})
}

/* 新增角色信息 */
 
function addFrom(){
	$('#win').window('open');
	
}
  
 function addRoles(){
	 $.post("addRoles",{ r_name:$("#r_name1").val()},function(res){
			if(res>0){
				$('#dg').datagrid('reload'); 
				$("#ff").form("clear");
				$('#win').window('close'); 
				$.messager.alert("提示","新增成功");
			}else{
				$.messager.alert("提示","该用户角色已存在");
			}
		})
	
}
  
</script>

</head>
<body>
<table id="dg" class="easyui-datagrid">   
    <thead>   
        <tr>
        	 
            <th data-options="field:'r_id'">角色id</th>   
            <th data-options="field:'r_name'">角色名称</th>   
              
            <th data-options="field:'caozuo',formatter:caozuo">操作</th> 
           
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
<div id="win" class="easyui-window" title="My Window" style="width:600px;height:400px"   
        data-options="iconCls:'icon-save',modal:true,closed:true"> 
  
		   <form id="ff" >   
		   		<table style="padding-left:20px;text-align:center" >
		   			<tr>
		   				<td><label for="r_name">角色名称:</label> </td>
		   				<td> <input class="easyui-validatebox" type="text" name="r_name" id="r_name1"  /> </td>
		   			</tr> 
		   		
		   		</table>
		    
				<a href="javascript:void(0)" class="easyui-linkbutton"   onclick="addRoles()">保存</a>
				
				<a href="javascript:void(0)" class="easyui-linkbutton"  onclick="closeAddTable()">关闭</a>
							    
		       
			</form>   
</div>  


<!-- 修改角色信息 -->
<div id="win1" class="easyui-window" title="My Window" style="width:600px;height:400px"   
        data-options="iconCls:'icon-save',modal:true,closed:true"> 
  
		   <form id="ff1" >   
		   		<table style="padding-left:20px;text-align:center" >
		   			<tr>
		   				<td><label for="r_id">角色id:</label> </td>
		   				<td> <input class="easyui-validatebox" disabled="disabled" type="text" name="r_id" id="r_id2"  /> </td>
		   			</tr> 
		   			<tr>
		   				<td><label for="r_name">角色名称:</label> </td>
		   				<td> <input class="easyui-validatebox" type="text" name="r_name" id="r_name2"  /> </td>
		   			</tr> 
		   		</table>
		    
				<a href="javascript:void(0)" class="easyui-linkbutton"   onclick="UpdateRoles()">保存</a>
				
				<a href="javascript:void(0)" class="easyui-linkbutton"  onclick="closeAddTable()">关闭</a>
							    
		       
			</form>   
</div>  

</body>
</html>