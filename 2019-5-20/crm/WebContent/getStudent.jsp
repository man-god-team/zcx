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
			url : 'getALL',
			method : 'post',
			pagination : true,
			toolbar : '#tb',
			queryParams: {
				stu_name:$("#stu_name").val(),
				stu_tel:$("#stu_tel").val(),
				y_name:$("#y_name").val(),
				stu_qq:$("#stu_qq").val(),
				p_isPay: $('#p_isPay').combobox('getValue'),
				p_validity: $('#p_validity').combobox('getValue'),
				p_isReturn: $('#p_isReturn').combobox('getValue'),
				listA: $('#listA').combobox('getValue'),
				timeMix:$('#timeMix').datetimebox('getValue'),
				timeMax:$('#timeMax').datetimebox('getValue')
			}
		});
	}
	
	function yonghu(value,rows,index){
		return rows.yonghu.y_name;
	}
	
	function updateStu(index){
		
		var data = $("#show").datagrid("getData"); 
		var row = data.rows[index];
 
		//填充表单
		$("#updatefrm").form("load",row);
		
		//打开弹窗
		$("#update-dialog").dialog("open")
		
	}
	function saveUpdate(){
		alert(111);
		var stu_idS=$("#show").datagrid("getSelected").stu_id;
		$.post("updateA",{
			stu_id:stu_idS,
			stu_Address:$("#stu_AddressA").val(),
			y_id:$("#r_idA").val(),
			p_class:$("#p_classA").val(),
			p_validity:$("#p_validityA").val(),
			p_whyValidity:$("#p_whyValidityA").val(),
			p_score:$("#p_scoreA").val(),
			p_isReturn:$("#p_isReturnA").val(),
			p_firstReturnTime:$("#p_firstReturnTimeA").val(),
			p_isTheDoor:$("#p_isTheDoorA").val(),
			p_timeTheDoor:$("#p_timeTheDoorA").val(),
			p_isPay:$("#p_isPayA").val(),
			p_payTime:$("#p_payTimeA").val(),
			p_price:$("#p_priceA").val(),
			p_isRefund:$("#p_isRefundA").val(),
			p_isClass:$("#p_isClassA").val(),
			p_classTime:$("#p_classTimeA").val(),
			p_classNote:$("#p_classNoteA").val(),
			p_whyRefund:$("#p_whyRefundA").val(),
			p_deposit:$("#p_depositA").val(),
			p_depositTime:$("#p_depositTimeA").val(),
			rouleNote:$("#rouleNote").val(),

		},function(res){
			if(res>0){
				//修改成功
				$("#show").datagrid("reload");
				$("#update-dialog").dialog("close")
				$.messager.alert("提示","修改成功");
			}else{
				//修改失败
				$.messager.alert("提示","修改失败");
			}
			
		},"json")
		
		
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
	<table id="show" class="easyui-datagrid" data-options="singleSelect:true,checkbox:true">
		<thead>
			<tr >
			
				
				<!-- <th type="checkbox" data-options="field:'stu_id',title:'跟踪id',checkbox:true"></th>
				<th type="checkbox" data-options="field:'stu_name',title:'学生姓名'"></th>
				<th type="checkbox" data-options="field:'y_id',title:'用户姓名',formatter:yonghu"></th>
				<th type="checkbox" data-options="field:'stu_sex',title:'性别'"></th>
				<th type="checkbox" data-options="field:'stu_age',title:'跟踪方式'"></th>
				<th type="checkbox" data-options="field:'stu_tel',title:'下次时间'"></th>
				<th type="checkbox" data-options="field:'stu_xueli',title:'备注'"></th>
				<th type="checkbox" data-options="field:'stu_State',title:'备注'"></th>
				<th type="checkbox" data-options="field:'stu_sourcer',title:'备注'"></th>
				<th type="checkbox" data-options="field:'stu_site',title:'备注'"></th>
				<th type="checkbox" data-options="field:'stu_qq',title:'备注'"></th>
				<th type="checkbox" data-options="field:'stu_weiXin',title:'备注'"></th>
				<th type="checkbox" data-options="field:'stu_reported',title:'备注'"></th>
				<th type="checkbox" data-options="field:'stu_note',title:'备注'"></th>
				<th type="checkbox" data-options="field:'stu_Address',title:'备注'"></th>
				<th type="checkbox" data-options="field:'r_id',title:'备注'"></th>
				<th type="checkbox" data-options="field:'p_class',title:'备注'"></th>
				<th type="checkbox" data-options="field:'p_validity',title:'备注'"></th>
				<th type="checkbox" data-options="field:'p_whyValidity',title:'备注'"></th>
				<th type="checkbox" data-options="field:'p_score',title:'备注'"></th>
				<th type="checkbox" data-options="field:'p_isReturn',title:'备注'"></th>
				<th type="checkbox" data-options="field:'p_firstReturnTime',title:'备注'"></th>
				<th type="checkbox" data-options="field:'p_isTheDoor',title:'备注'"></th>
				<th type="checkbox" data-options="field:'p_timeTheDoor',title:'备注'"></th>
				<th type="checkbox" data-options="field:'p_isPay',title:'备注'"></th>
				<th type="checkbox" data-options="field:'p_payTime',title:'备注'"></th>
				<th type="checkbox" data-options="field:'p_price',title:'备注'"></th>
				<th type="checkbox" data-options="field:'p_isRefund',title:'备注'"></th>
				<th type="checkbox" data-options="field:'p_isClass',title:'备注'"></th>
				<th type="checkbox" data-options="field:'p_classTime',title:'备注'"></th>
				<th type="checkbox" data-options="field:'p_classNote',title:'备注'"></th>
				<th type="checkbox" data-options="field:'p_whyRefund',title:'备注'"></th>
				<th type="checkbox" data-options="field:'p_deposit',title:'备注'"></th>
				<th type="checkbox" data-options="field:'p_depositTime',title:'备注'"></th>
				<th type="checkbox" data-options="field:'rouleNote',title:'备注'"></th>
				<th type="checkbox" data-options="field:'stu_loadTime',title:'备注'"></th> -->
				
				<th type="checkbox" data-options="field:'stu_id',title:'学生id',checkbox:true"></th>
				<th type="checkbox" data-options="field:'stu_name',title:'学生姓名'"></th>
				<th type="checkbox" data-options="field:'r_id',title:'用户姓名',formatter:yonghu"></th>
				<th type="checkbox" data-options="field:'stu_sex',title:'性别'"></th>
				<th type="checkbox" data-options="field:'stu_age',title:'年龄'"></th>
				<th type="checkbox" data-options="field:'stu_tel',title:'电话'"></th>
				<th type="checkbox" data-options="field:'stu_xueli',title:'学历'"></th>
				<th type="checkbox" data-options="field:'stu_State',title:'状态'"></th>
				<th type="checkbox" data-options="field:'stu_sourcer',title:'来源渠道'"></th>
				<th type="checkbox" data-options="field:'stu_site',title:'来源网站'"></th>
				<th type="checkbox" data-options="field:'stu_qq',title:'学生QQ'"></th>
				<th type="checkbox" data-options="field:'stu_weiXin',title:'学生微信'"></th>
				<th type="checkbox" data-options="field:'stu_reported',title:'是否报备'"></th>
				<th type="checkbox" data-options="field:'stu_note',title:'在线备注'"></th>
				<th type="checkbox" data-options="field:'stu_Address',title:'所在区域'"></th>
				<th type="checkbox" data-options="field:'y_id',title:'角色编号id'"></th>
				<th type="checkbox" data-options="field:'p_class',title:'班级'"></th>
				<th type="checkbox" data-options="field:'p_validity',title:'是否有效'"></th>
				<th type="checkbox" data-options="field:'p_whyValidity',title:'无效原因'"></th>
				<th type="checkbox" data-options="field:'p_score',title:'打分'"></th>
				<th type="checkbox" data-options="field:'p_isReturn',title:'是否回访'"></th>
				<th type="checkbox" data-options="field:'p_firstReturnTime',title:'首次回访时间'"></th>
						<th type="checkbox" data-options="field:'p_isTheDoor',title:'是否上门'"></th>
							<th type="checkbox" data-options="field:'p_timeTheDoor',title:'上门时间'"></th>
					<th type="checkbox" data-options="field:'p_isPay',title:'是否缴费'"></th>
				<th type="checkbox" data-options="field:'p_payTime',title:'备缴费时间'"></th>
				<th type="checkbox" data-options="field:'p_price',title:'金额'"></th>
				<th type="checkbox" data-options="field:'p_isRefund',title:'是否退费'"></th>
				<th type="checkbox" data-options="field:'p_isClass',title:'是否进班'"></th>
				<th type="checkbox" data-options="field:'p_classTime',title:'进班时间'"></th>
				<th type="checkbox" data-options="field:'p_classNote',title:'进班备注'"></th>
				<th type="checkbox" data-options="field:'p_whyRefund',title:'退费原因'"></th>
				<th type="checkbox" data-options="field:'p_deposit',title:'定金金额'"></th>
				<th type="checkbox" data-options="field:'p_depositTime',title:'定金时间'"></th>
				<th type="checkbox" data-options="field:'rouleNote',title:'咨询师备注'"></th>
				<th type="checkbox" data-options="field:'stu_loadTime',title:'添加时间'"></th> 
				
			</tr>
		</thead>
	</table>
	<div id="tb">
		<form id="ss">
			<label > 姓名关键字:</label>   
	        <input class="easyui-validatebox" type="text"  id="stu_name"/>   
	        <label >电话:</label>   
	        <input class="easyui-validatebox" type="text"  id="stu_tel" />  
	        <label>咨询师:</label>   
	        <input class="easyui-validatebox" type="text"  id="y_name"/> 
	        <label >是否缴费:</label>   
	        <select id="p_isPay" class="easyui-combobox"  style="width:173px;"> 
	       		<option value="">---请选择---</option>
			    <option value="1">是</option>   
			    <option value="0">否</option>   
			</select>
			<br/>
			<label >是否有效:</label>  
			 <select id="p_validity" class="easyui-combobox"  style="width:173px;"> 
	       		<option value="">---请选择---</option>
			    <option value="1">是</option>   
			    <option value="0">否</option>   
			</select>
			<label >是否回访:</label>  
			 <select id="p_isReturn" class="easyui-combobox"  style="width:173px;"> 
	       		<option value="">---请选择---</option>
			    <option value="0">是</option>   
			    <option value="1">否</option>   
			</select>
	        <label>QQ:</label>   
	        <input class="easyui-validatebox" type="text"  id="stu_qq"/>   
	        <br/>
	        <select id="listA" class="easyui-combobox" style="width:100px;">  
	        	<option value="">---请选择---</option>   
			    <option value="stu_loadTime">创建时间</option>   
			    <option value="p_timeTheDoor">上门时间</option>   
			    <option value="p_firstReturnTime">首次回访时间</option>   
			    <option value="p_payTime">缴费时间</option>   
			    <option value="p_classTime">进班时间</option>   
			</select>
			<label>:</label>   
	        <input  id="timeMix"  type= "text" class= "easyui-datebox" required ="required"> </input>  
	        <label>~</label>   
	        <input  id="timeMax"   type= "text" class= "easyui-datebox" required ="required"> </input>  
			<br>
			<a id="btn" href="javascript:void(0)" onclick="init()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">搜索</a>  			
			<a id="daoru1" href="javascript:void(0)" onclick="updateStu()" class="easyui-linkbutton" data-options="iconCls:'icon-add'">修改</a> 
			<a id="daoru1" href="javascript:void(0)" onclick="tianjia()" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加日志</a> 			
		
	</form>
	</div>
	
	<div id="update-dialog" class="easyui-dialog" data-options="modal:true,closed:true,title:'修改',
	buttons:[{
				text:'保存',
				handler:function(){
				saveUpdate();
				}
			},{
				text:'关闭',
				handler:function(){}
			
	}]">
		<form class="easyui-form" id="updatefrm">
			
			<label for="name">所在地区:</label>   
	        <input class="easyui-validatebox" type="text" name="stu_Address"  id="stu_AddressA" />   
	    	 <br>
			  
	        <label for="name">咨询师id:</label>   
	        <input class="easyui-validatebox" type="text" name="r_id"  id="r_idA"  />   
	    	 <br>
	    	 
	        <label for="name">课程方向:</label>   
	        <input class="easyui-validatebox" type="text" name="p_class"  id="p_classA"  />   
	    	 <br> 
	    	  <label for="name">是否有效:</label>   
	        <input class="easyui-validatebox" type="text" name="p_validity"  id="p_validityA"  />   
	    	 <br> 

	        <label for="name">无效原因:</label>   
	        <input class="easyui-validatebox" type="text" name="p_whyValidity"  id="p_whyValidityA"  /><br>
	        <label for="name">打分:</label>   
	        <input class="easyui-validatebox" type="text" name="p_score"  id="p_scoreA"  /><br>
	        <label for="name">是否回访:</label>   
	        <input class="easyui-validatebox" type="text" name="p_isReturn"  id="p_isReturnA"  /><br>
	        <label for="name">首次回访时间:</label>   
	        <input class="easyui-validatebox" type="text" name="p_firstReturnTime"  id="p_firstReturnTimeA"  /><br>
	        <label for="name">是否上门:</label>   
	        <input class="easyui-validatebox" type="text" name="p_isTheDoor"  id="p_isTheDoorA"  /><br>
	        <label for="name">上门时间:</label>   
	        <input class="easyui-validatebox" type="text" name="p_timeTheDoor"  id="p_timeTheDoorA"  /><br>
	        <label for="name">是否缴费:</label>   
	        <input class="easyui-validatebox" type="text" name="p_isPay"  id="p_isPayA"  /><br>
	        <label for="name">缴费时间:</label>   
	        <input class="easyui-validatebox" type="text" name="p_payTime"  id="p_payTimeA"  /><br>
	        <label for="name">金额:</label>   
	        <input class="easyui-validatebox" type="text" name="p_price"  id="p_priceA"  /><br>
	        <label for="name">是否退费:</label>   
	        <input class="easyui-validatebox" type="text" name="p_isRefund"  id="p_isRefundA"  /><br>
	        <label for="name">是否进班:</label>   
	        <input class="easyui-validatebox" type="text" name="p_isClass"  id="p_isClassA"  /><br>
	        <label for="name">进班时间:</label>   
	        <input class="easyui-validatebox" type="text" name="p_classTime"  id="p_classTimeA"  /><br>
	        <label for="name">进班备注:</label>   
	        <input class="easyui-validatebox" type="text" name="p_classNote"  id="p_classNoteA"  /><br>
	        <label for="name">退费原因:</label>   
	        <input class="easyui-validatebox" type="text" name="p_whyRefund"  id="p_whyRefundA"  /><br>
	        <label for="name">定金金额:</label>   
	        <input class="easyui-validatebox" type="text" name="p_deposit"  id="p_depositA"  /><br>
	        <label for="name">定金时间:</label>   
	        <input class="easyui-validatebox" type="text" name="p_depositTime"  id="p_depositTimeA"  /><br>
	        <label for="name">咨询师备注:</label>   
	    <!--     <input class="easyui-validatebox" type="text" name="rouleNote"  id="rouleNoteA"  /><br>
	        <label for="name">Birthday:</label>   
	        <input class="easyui-validatebox" type="text" name="stu_loadTime"  id="stu_loadTimeA"  /> -->
	        
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
			<label for="name">学生id:</label>&nbsp; &nbsp;&nbsp;  <input class="easyui-textbox"
				type="text"  id="stu_idA"
				 style="width: 150px;"/>   &nbsp; &nbsp; &nbsp; &nbsp; 
			<label for="name">用户id:</label> <input class="easyui-textbox"
				type="text"  id="y_idA"
				 style="width: 150px;"/>   <br> <br>
			<label for="name">跟踪时间:</label> <input  class="easyui-datebox"
				type="text"  id="t_visitTimeA"
				 style="width: 150px;"/> &nbsp; &nbsp; 
			<label for="name">跟踪情况:</label> <input class="easyui-textbox"
				type="text"  id="t_RevisitA"
				 style="width: 150px;"/>   <br> <br>
				 <label for="name">结束时间:</label> <input  class="easyui-datebox"
				type="text"  id="t_nextTraceTimeA"
				 style="width: 150px;"/>&nbsp; &nbsp; 
			  
			  
			   <label for="name">跟踪方式:</label> <input class="easyui-textbox"
				type="text"  id="t_methodA"
				 style="width: 150px;"/><br><br>
			<label for="name">备注:</label> <input class="easyui-textbox"
				type="text"  id="t_noteA"
				 style="width: 150px;"/>   
			
			
		
			
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
			
		</form>
	</div>
</body>
</html>