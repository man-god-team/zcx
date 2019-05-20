<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>分量设置</title>
<link rel="stylesheet" href="js/jquery-easyui-1.4.3/themes/icon.css">
<link rel="stylesheet"
	href="js/jquery-easyui-1.4.3/themes/default/easyui.css">
<script type="text/javascript"
	src="js/jquery-easyui-1.4.3/jquery.min.js"></script>
<script type="text/javascript"
	src="js/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="js/jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript"
	src="js/jquery-easyui-1.4.3/src/jquery.tabs.js"></script>
<script type="text/javascript">
	$(function() {
		init();
	})
	function init() {
		$("#showBook").datagrid({
			url : 'selectAllByfenpei',
			method : 'post',
			pagination : true,
			toolbar : '#tb' 

		});
		$("#tl").form("clear");

	}
	
function fenpei(value, row, index) {
		return "<a href='javascript:void(0)' onclick='fenliang("+ index+ ")'>分配咨询师</a> ";
}
function fenliang(index){
	  $('#showcom').combobox({    
	    url:'selectYonghuByR_id',
	    method:'post',
	    valueField:'y_id',    
	    textField:'y_name'   
	});  
	//打开弹窗
	$("#add-dialog").dialog("open")
}
function saveadd(){
	var y_id=$("#showcom").combobox('getValue');
 	
	if(y_id=="--请选择--"){
		y_id='';
	} 
	 
	var stu_id = $("#showBook").datagrid("getSelected").stu_id;

	 $.post("UpdateStudentByFP",{stu_id:stu_id,y_id:y_id},
			 function(res){
		 if (res > 0) {
				//添加成功
				$("#showBook").datagrid("reload");
				$("#add-dialog").dialog("close")
				$.messager.alert("提示", "分配成功");
			} else {
				//添加失败
				$.messager.alert("提示", "分配失败");
			}

		}, "json")

}

function closeFeipei(){
	$("#add-dialog").dialog("close")
}
function zidongfenpei(){
	var i=$("#a")[0].checked;
	var f_id=1;
	if(i){ 
		var fenpeizhuangtai="是";		
	}else{	 
		var fenpeizhuangtai="否"; 
	}
	alert(fenpeizhuangtai)
	 $.post("updateZidongfenpei1",{f_id:f_id,fenpeizhuangtai:fenpeizhuangtai},function(res){
		 if (res > 0) {
				$.messager.alert("提示", "自动分配开启");
			} else {
				//添加失败
				$.messager.alert("提示", "自动分配关闭");
			}

		}) 
}
</script> 
    
</head>
<body>


	<table id="showBook" class="easyui-datagrid" >
		<thead>
			<tr> 
				<th data-options="field:'stu_id',title:'学生id'"></th>
				<th data-options="field:'stu_name',title:'学生姓名'"></th>
				<th data-options="field:'stu_sex',title:'性别'"></th>
				<th data-options="field:'stu_age',title:'年龄'"></th>
				<th data-options="field:'stu_tel',title:'电话'"></th>
				<th data-options="field:'stu_xueli',title:'学历'"></th>
			 	<th data-options="field:'stu_sourcer',title:'来源渠道'"></th>
				<th data-options="field:'stu_site',title:'来源网站'"></th>
				<th data-options="field:'stu_qq',title:'学员QQ'"></th>
				<th data-options="field:'stu_weiXin',title:'微信号'"></th>
		 
 
				 <th data-options="field:'fenpei',width:160,formatter:fenpei">分配咨询师</th> 
			</tr>
		</thead>
	</table>

	<div id="tb">
	
		<form id="tl"> 

<a href="javascript:void(0)"  onclick="zidongfenpei()"> <input class="easyui-switchbutton" id="a" data-options="onText:'Yes',offText:'No'"></a> 
		
		</form>
	</div>

<div id="add-dialog" class="easyui-dialog" style="width:200px;height:150px;"
		 data-options="modal:true,closed:true,title:'分配学员',
	buttons:[{
				text:'保存',
				handler:function(){
				saveadd();
				}
			},{
				text:'关闭',
				handler:function(){
				closeFeipei();
				}
			
	}]">
		<form class="easyui-form" id="addfrm">
 
                  <br>
			<br>
			 
			<label for="name">选择咨询师:</label> 
			<select style="width: 100px" id="showcom"  class="easyui-combobox">
				<option value="--请选择--">--请选择--</option>
	    	</select>
			 
		 
			<br>
		</form>
	</div>
</body>
</html>