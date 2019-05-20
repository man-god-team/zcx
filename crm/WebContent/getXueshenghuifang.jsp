<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>跟踪信息</title>
<link rel="stylesheet" href="js/jquery-easyui-1.4.3/themes/icon.css">
<link rel="stylesheet"
	href="js/jquery-easyui-1.4.3/themes/default/easyui.css">
<script type="text/javascript"
	src="js/jquery-easyui-1.4.3/jquery.min.js"></script>
<script type="text/javascript"
	src="js/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="js/jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
	$(function(){
		init();
	})
	function init(){
		$('#show').datagrid({
			url : 'getXueshenghuifang',
			method : 'post',
			pagination : true,
			toolbar : '#tb',
			queryParams: {
				stu_name:$("#stu_name").val(),
				y_name:$("#y_name").val(),
				t_visitTime:$('#t_visitTime').datetimebox('getValue'),
				t_nextTraceTime:$('#t_nextTraceTime').datetimebox('getValue'),
				t_Revisit: $("#t_Revisit").val(),
				t_method:$("#t_method").combobox("getValue") 
			}
		});
	}
	
	function yonghu(value,rows,index){
		return rows.yonghu.y_name;
	}
	function xuesheng(value,rows,index){
		return rows.student.stu_name;
	}
	function tianjia(index) {

		//打开弹窗
		$("#add-dialog").dialog("open")
	}
	function saveadd() {
		//获取弹窗中的所有的数据
		

		$.post("insertHuifang", {

			stu_id : $("#stu_idA").val(),
			y_id : $("#y_idA").val(),
			t_visitTime : $("#t_visitTimeA").datetimebox('getValue'),
			t_Revisit : $("#t_RevisitA").val(),
			t_method : $("#t_methodA").val(),
			t_nextTraceTime : $("#t_nextTraceTimeA").datetimebox('getValue'),
			t_note : $("#t_noteA").val(),
			

		}, function(res) {
			if (res > 0) {
				//添加成功
				$("#showBook").datagrid("reload");
				$("#add-dialog").dialog("close")
				$.messager.alert("提示", "添加成功");
			} else {
				//添加失败
				$.messager.alert("提示", "添加失败");
			}

		}, "json")
		$("#addfrm").form("clear");

	}
</script>
</head>
<body>
	<table id=show class="easyui-datagrid">
		<thead>
			<tr>
			
				
				<th data-options="field:'t_id',title:'跟踪id'"></th>
				<th data-options="field:'y_id',title:'用户姓名',formatter:yonghu"></th>
				<th data-options="field:'stu_id',title:'学生姓名',formatter:xuesheng"></th>
				<th data-options="field:'t_visitTime',title:'上次跟踪时间'"></th>
				<th data-options="field:'t_Revisit',title:'跟踪回访情况'"></th>
				<th data-options="field:'t_method',title:'跟踪方式'"></th>
				<th data-options="field:'t_nextTraceTime',title:'下次时间'"></th>
				<th data-options="field:'t_note',title:'备注'"></th>
				

			</tr>
		</thead>
	</table>
	<div id="tb">
		<form id="tarfrm" class="easyui-form">
	        <label for=name>学生名称:</label>   
	        <input class="easyui-validatebox"   id="stu_name" data-options="required:true"  />   
	    	 &ensp;
	    	 <label for=name>跟踪者:</label>   
	        <input class="easyui-validatebox" type="text"  id="y_name" data-options="required:true" />   
	    	 
			  &ensp;
	        <label for="name">跟踪开始时间:</label>   
	        <input class="easyui-datebox" type="text"  id="t_visitTime" data-options="required:true,showSeconds:false" />   
	    	
	    	 &ensp;
	        <label for="name">跟踪结束时间:</label>   
	        <input class="easyui-datebox" type="text"  id="t_nextTraceTime" data-options="required:true,showSeconds:false" />   
	    	 &ensp;
	        <label for="name">跟踪情况:</label>   
	        <input class="easyui-validatebox" type="text"  id="t_Revisit" data-options="required:true" />   
	    	 &ensp;
	       
	        <label for="name">跟踪方式:</label>   
	       <select  class="easyui-combobox"  id="t_method"  style="width:200px;">   
  			 <option value="">--请选择--</option>   
    		 <option >电话</option>   
   			 <option >微信</option>   
    		 <option >QQ</option> 
    		 <option >其他</option>    
			</select> 	    	&ensp;
				
				<a href="javascript:void(0)" onclick="init()" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">搜索</a>
				<a href="javascript:void(0)" onclick="tianjia()" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">添加日志</a>
		</form>
	</div>
		
		
	<div id="add-dialog" class="easyui-dialog"
		 data-options="modal:true,closed:true,title:'新建学员',
	buttons:[{
				text:'保存',
				handler:function(){
				saveadd();
				}
			},{
				text:'关闭',
				handler:function(){
				close();
				}
			
	}]">
		<form class="easyui-form" id="addfrm">


       
                  <br>
			<br>
			<label for="name">学生id:</label> <input class="easyui-textbox"
				type="text"  id="stu_idA"
				 style="width: 150px;"/>  <br> <br>  
			<label for="name">用户id:</label> <input class="easyui-textbox"
				type="text"  id="y_idA"
				 style="width: 150px;"/>   <br> <br>
			<label for="name">跟踪时间:</label> <input  class="easyui-datebox"
				type="text"  id="t_visitTimeA"
				 style="width: 150px;"/>  <br> <br> 
			<label for="name">跟踪情况:</label> <input class="easyui-textbox"
				type="text"  id="t_RevisitA"
				 style="width: 150px;"/>   <br> <br>
			<label for="name">跟踪方式:</label> <input class="easyui-textbox"
				type="text"  id="t_methodA"
				 style="width: 150px;"/>  <br> <br> 
			<label for="name">跟踪结束时间:</label> <input  class="easyui-datebox"
				type="text"  id="t_nextTraceTimeA"
				 style="width: 150px;"/>   <br> <br>
			<label for="name">备注:</label> <input class="easyui-textbox"
				type="text"  id="t_noteA"
				 style="width: 150px;"/>  <br> <br> 
			
			
		
			
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
			
		</form>
	</div>

</body>
</html>