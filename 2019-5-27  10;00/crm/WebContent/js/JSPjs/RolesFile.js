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
function searchsetRoles(value, row, index) {
	return "<a  href='javascript:void(0)' style='cursor:pointer;' onclick='control(" + index + ")'>查看</a> <a  href='javascript:void(0)' style='cursor:pointer;' onclick='kongzhi(" + index + ")'>设置</a> ";
}
function control(index) {
	var data = $("#dg").datagrid("getData");
	var row = data.rows[index];
	$("#frm").form("load", row);
	$("#wd").window("open");
}

function closechakan() {
	$("#wd").window("close");
}
function kongzhi(index) {
	var data = $("#dg").datagrid("getData");
	var row = data.rows[index];
	$("#menuTree").tree({
		url: "zhanshiModel",
		lines: true,
		queryParams: {
			r_id: row.r_id  
		},
		onContextMenu: function(e, node) {
			$("#menuTree").tree('select', node.target);
		}
	});
	  $("#menuTree").tree({
		checkbox: true
	});  
	jiaoseid=null;
	jiaoseid=row.r_id;
	$("#mkWindow").window("open");
}
function tijiaoModules() {
	 
	var nodes = $("#menuTree").tree('getChecked', ['checked', 'indeterminate']);
	var s = "";
	for(var i = 0; i < nodes.length; i++) {
		if(s == "") {
			s += nodes[i].id;
		} else {
			s += ",";
			s += nodes[i].id;
		}
	}
	$.post("InsertRolem", {
		m_id: s,
		r_id: jiaoseid 
	}, function(res) {
		if(res>0) {
			$.messager.alert("消息", "保存权限成功");
			$("#mkWindow").window("close");
			rolesId = "";
			window.top.loadTree();
		} else {
			$.messager.alert("消息", res.messager);
		}
	},"json")
}

 
function caozuo(value,row,index){
	return '<a href="javascript:void(0)" class="easyui-linkbutton"  onclick="editRoles('+index+')">修改</a>   <a href="javascript:void(0)" class="easyui-linkbutton"  onclick="deleteRoles('+index+')">删除 </a>'
}
function editRoles(index){
	 
	var rows=$("#dg").datagrid('getData').rows[index];
	 
	$("#ff1").form("load",rows);
	$("#win1").window('open');
}
function closeAddTable1(){
	$("#win1").window('close');
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
			$.messager.alert("提示","该角色存在某个用户或者模块不能删除");
		}
	})
}

/* 新增角色信息 */
 
function addFrom(){
	$('#win').window('open');
	
}
function closeAddTable2(){
	$('#win').window('close');
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
   