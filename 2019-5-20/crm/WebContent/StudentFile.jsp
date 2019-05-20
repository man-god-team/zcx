<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>学生表</title>
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
		showSetColumn();
	})
	function init() {
	
		$("#showBook").datagrid({
			url : 'selectStudent',
			method : 'post',
			pagination : true,
			toolbar : '#tb',
			queryParams:{
				stu_name:$("#stu_name").val(),
				stu_tel:$("#stu_tel").val(),
				stu_qq:$("#stu_qq").val(),
				p_isPay:$("#p_isPay").combobox("getValue"),
				p_validity:$("#p_validity").combobox("getValue"),
				p_isReturn:$("#p_isReturn").combobox("getValue"),
				stu_loadTime:$("#stu_loadTime").datebox("getValue"),
				p_firstReturnTime:$("#p_firstReturnTime").datebox("getValue"),
				p_timeTheDoor:$("#p_timeTheDoor").datebox("getValue"),
				p_payTime:$("#p_payTime").datebox("getValue"),
				p_classTime:$("#p_classTime").datebox("getValue")
				
					
					
				}

		});
		$("#tl").form("clear");

	}

	 function formatterssss(value, row, index) {
		return "<a href='javascript:void(0)' onclick='chakan("
				+ index
				+ ")'>查看</a>  <a href='javascript:void(0)' onclick='xiugai("
				+ index
				+ ")'>修改</a>  <a href='javascript:void(0)' onclick='shanchu("
				+ index
				+ ")'>删除</a>";
	} 
	

	 function chakan(index){
			var arr=$("#showBook").datagrid("getData");
			var row=arr.rows[index];
			
			//填充表单
			$("#updatefrm").form("load",row);
			
			//打开弹窗
			$("#update-dialog").dialog("open")
			
			
		}
	 function xiugai(index){
			var arr=$("#showBook").datagrid("getData");
			var row=arr.rows[index];
			
			//填充表单
			$("#addfrm1").form("load",row);
			
			//打开弹窗
			$("#add-dialog1").dialog("open")
			
			
		}
	 function shanchu(index) {
			var arr = $("#showBook").datagrid("getData");
			var row = arr.rows[index];
			$.messager.confirm('确认删除', '确认删除吗？', function(r) {
				if (r) {
					$.post("deleteStudent", {
						stu_id : row.stu_id
					}, function(res) {
						if (res > 0) {
							$("#showBook").datagrid("reload");
							$.messager.alert("提示", "删除成功");
						}
					}, "json")
				}
			});

		}
	function tianjia(index) {

		//打开弹窗
		$("#add-dialog").dialog("open")
	}
	function close() {
		$("#update-dialog").dialog("close")
		$("#add-dialog").dialog("close")
	}
	function close1() {
		$("#update-dialog1").dialog("close")
		$("#add-dialog1").dialog("close")
	}

	function saveadd1() {
		//获取弹窗中的所有的数据 
		
		$.post("updateStudent", {

			stu_id : $("#addstu_id1").val(),
			stu_name : $("#addstu_name1").val(),
			stu_sex : $("#addstu_sex1").combobox("getValue"),
			stu_age : $("#addstu_age1").val(),
			stu_tel : $("#addstu_tel1").val(),
			stu_xueli : $("#addstu_xueli1").combobox("getValue"),
			stu_State : $("#addstu_State1").combobox("getValue"),
			stu_sourcer : $("#addstu_sourcer1").combobox("getValue"),
			stu_site : $("#addstu_site1").combobox("getValue"),
			stu_qq : $("#addstu_qq1").val(),
			stu_weiXin : $("#addstu_weiXin1").val(),
			stu_reported : $("#addstu_reported1").combobox("getValue"),
			stu_note : $("#addstu_note1").val()

		}, function(res) {
			if (res > 0) {
				//添加成功
				$("#showBook").datagrid("reload");
				$("#add-dialog1").dialog("close")
				$.messager.alert("提示", "修改成功");
			} else {
				//添加失败
				$.messager.alert("提示", "修改失败");
			}

		}, "json") 

	}
	function saveadd() {
		//获取弹窗中的所有的数据
		

		$.post("addStudent", {

			stu_id : $("#addid").val(),
			stu_name : $("#addstu_name").val(),
			stu_sex : $("#addstu_sex").combobox("getValue"),
			stu_age : $("#addstu_age").val(),
			stu_tel : $("#addstu_tel").val(),
			stu_xueli : $("#addstu_xueli").combobox("getValue"),
			stu_State : $("#addstu_State").combobox("getValue"),
			stu_sourcer : $("#addstu_sourcer").val(),
			stu_site : $("#addstu_site").val(),
			stu_qq : $("#addstu_qq").val(),
			stu_weiXin : $("#addstu_weiXin").val(),
			stu_reported : $("#addstu_reported").combobox("getValue"),
			stu_note : $("#addstu_note").val()

		}, function(res) {
			if (res > 0) {
				//添加成功
				$("#showBook").datagrid("reload");
				$("#add-dialog").dialog("close");
				
				$.post("selectAllByZidongfenpei",{},function(res){
					 data = eval('(' + res + ')')
					 if(data=="是"){  
					 	 $.post("updateStudentByzidongfenpei",{},
							function(res){
					 		 if(res>0){
					 		/* 	$.messager.alert("提示", "自动分配成功"); */
					 		 }else{
					 			$.messager.alert("提示", "未自动分配");
					 		 }
					 	 })
					 }else{
						  
					 }
				})
				$.messager.alert("提示", "添加成功");
			}else{//添加失败
				$.messager.alert("提示", "添加失败");
			}

		}, "json")
		$("#addfrm").form("clear");

	}
	
	function formatShow(value, row, index) {
		var res = '';
		switch (value) {
		case 0:
			res = '<font style="color:red;">是</font>'
			break;
		case 1:
			res = '<font style="color:red;">否</font>'
			break;
		case 2:
			res = '<font style="color:red;">待定</font>'
			break;
		default:
			break;
		}
		return res;
	}
	 function formatShow1(value, row, index) {
		var res = '';
		switch (value) {
		case 0:
			res = '<font style="color:red;">未知</font>'
			break;
		case 1:
			res = '<font style="color:red;">待业</font>'
			break;
		case 2:
			res = '<font style="color:red;">在职</font>'
			break;
		case 3:
			res = '<font style="color:red;">在读</font>'
			break;
		
		}
		return res;
	} 

	
	 function shezhi(){
			$("#showColumn").window("open");
		}
		function showSetColumn(){
			$("#disColumn").find("input[name=check]").change(function(res) {
				if (this.checked == true) {
					$("#showBook").datagrid("showColumn", this.value);
				} else {
					$("#showBook").datagrid("hideColumn", this.value);
				}
			});
		}


</script>



</head>
<body>
 <div id="showColumn" class="easyui-window" title="要显示的列"
		data-options="iconCls:'icon-ok',minimizable:false,closed:true,"
		style="padding:10px;min-width:500px">
  <fieldset>
		<legend>要显示的列</legend>
	   <table id="disColumn">
		<tr>
		    <!-- <td colspan="4"><input type="checkbox" name="allChecked" id="allChecked" onchange="allChecked()" />全选</td> -->
		</tr>
		<tr>
			<td><input type="checkbox" name="check" value="stu_name" checked="checked" />学员姓名</td>
			<td><input type="checkbox" name="check" value="stu_sex" checked="checked" />性别</td>
			<td><input type="checkbox" name="check" value="stu_age" checked="checked" />年龄</td> 
			<td><input type="checkbox" name="check" value="stu_tel" checked="checked" />电话</td>
			<td><input type="checkbox" name="check" value="stu_xueli" checked="checked" />学历</td>
		</tr>
		<tr>
			<td><input type="checkbox" name="check" value="stu_State" checked="checked" />个人状态</td>
			<td><input type="checkbox" name="check" value="stu_sourcer"  checked="checked" />来源渠道</td>
			<td><input type="checkbox" name="check" value="stu_site" checked="checked"/>来源网站</td> 
			<td><input type="checkbox" name="check" value="stu_qq" checked="checked"/>学员QQ</td>
			<td><input type="checkbox" name="check" value="stu_weiXin" checked="checked"/>微信号</td>
		</tr>
		<tr>
            <td><input type="checkbox" name="check" value="stu_reported" checked="checked"/>是否报备</td>
		    <td><input type="checkbox" name="check" value="stu_note" checked="checked" />在线备注</td>
			<td><input type="checkbox" name="check" value="stu_Address" checked="checked" />所在区域</td>
			
			<td><input type="checkbox" name="check" value="p_class" checked="checked" />课程方向</td>
			<td><input type="checkbox" name="check" value="p_validity" checked="checked" />是否有效</td>
		</tr>
		<tr>
		    <td><input type="checkbox" name="check" value="p_score" checked="checked"/>打分</td>
		    <td><input type="checkbox" name="check" value="p_isReturn" checked="checked"/>是否回访</td>
		    <td><input type="checkbox" name="check" value="p_firstReturnTime" checked="checked" />首次回访时间</td>
		    <td><input type="checkbox" name="check" value="p_isTheDoor" checked="checked"/>是否上门</td> 
		    <td><input type="checkbox" name="check" value="p_timeTheDoor" checked="checked" />上门时间</td>
		</tr>
		<tr>
		    <td><input type="checkbox" name="check" value="p_whyValidity" checked="checked" />无效原因</td>
		    <td><input type="checkbox" name="check" value="p_isPay" checked="checked" />是否缴费</td>
		    <td><input type="checkbox" name="check" value="p_payTime" checked="checked" />缴费时间</td>
		    <td><input type="checkbox" name="check" value="p_price" checked="checked"/>金额</td>
		    <td><input type="checkbox" name="check" value="p_isRefund" checked="checked"/>是否退费</td>
		</tr>


<tr>
	        <td><input type="checkbox" name="check" value="p_isClass" checked="checked" />是否进班</td>
	        <td><input type="checkbox" name="check" value="p_classTime" checked="checked" />进班时间</td>
	        <td><input type="checkbox" name="check" value="p_classNote" checked="checked"/>进班备注</td>
	        <td><input type="checkbox" name="check" value="p_whyRefund" checked="checked"/>退费原因</td>
	        <td><input type="checkbox" name="check" value="p_deposit" checked="checked"/>定金金额</td>
		</tr>
	    <tr>
	        <td><input type="checkbox" name="check" value="p_depositTime" checked="checked"/>定金时间</td>
	        <td><input type="checkbox" name="check" value="y_id" checked="checked"/>角色</td>
	        <td><input type="checkbox" name="check" value="rouleNote" checked="checked"/>咨询师备注</td>
	        <td><input type="checkbox" name="check" value="caozuo" checked="checked" />操作</td>
	        
	    </tr>
	    
	 </table>
  </fieldset>
</div>
		 


	 <table id="showBook" class="easyui-datagrid" closed="false">
		<thead>
			<tr>
			
				<th data-options="field:'stu_id',title:'学生id',checkbox:true"></th>
				<th data-options="field:'stu_name',title:'学生姓名'"></th>
				<th data-options="field:'stu_sex',title:'性别'"></th>
				<th data-options="field:'stu_age',title:'年龄'"></th>
				<th data-options="field:'stu_tel',title:'电话'"></th>
				<th data-options="field:'stu_xueli',title:'学历'"></th>
				<th data-options="field:'stu_State',formatter:formatShow1,title:'状态'"></th>
				<th data-options="field:'stu_sourcer',title:'来源渠道'"></th>
				<th data-options="field:'stu_site',title:'来源网站'"></th>
				<th data-options="field:'stu_qq',title:'学员QQ'"></th>
				<th data-options="field:'stu_weiXin',title:'微信号'"></th>
				<th data-options="field:'stu_reported',formatter:formatShow, title:'是否报备'"></th>
				<th data-options="field:'stu_note',title:'在线备注'"></th>
				 
                <th data-options="field:'stu_Address',title:'所在区域'" "></th>
				<th data-options="field:'y_id',title:'角色编号id'"></th>
				<th data-options="field:'p_class',title:'课程方向'"></th>
				<th data-options="field:'p_validity',formatter:formatShow, title:'是否有效'"></th>
				<th data-options="field:'p_whyValidity',title:'无效原因'"></th>
				<th data-options="field:'p_score',title:'打分'"></th>
				<th data-options="field:'p_isReturn',formatter:formatShow, title:'是否回访'"></th>
				<th data-options="field:'p_firstReturnTime',title:'首次回访时间'"></th>
				<th data-options="field:'p_isTheDoor',title:'是否上门'"></th>
				<th data-options="field:'p_timeTheDoor',title:'上门时间'"></th>
				<th data-options="field:'p_isPay',title:'是否缴费'"></th>
				<th data-options="field:'p_payTime',title:'缴费时间'"></th>
				<th data-options="field:'p_price',title:'金额'"></th>
				<th data-options="field:'p_isRefund',title:'是否退费'"></th>
				<th data-options="field:'p_isClass',title:'是否进班'"></th>
				<th data-options="field:'p_classTime',title:'进班时间'"></th>
				<th data-options="field:'p_classNote',title:'进班备注'"></th>
				<th data-options="field:'p_whyRefund',title:'退费原因'"></th>
				<th data-options="field:'p_deposit',title:'定金金额'"></th>
				<th data-options="field:'p_depositTime',title:'定金时间'"></th>
				<th data-options="field:'rouleNote',title:'咨询师备注'"></th> 


				<th data-options="field:'caozuo',width:160,formatter:formatterssss">操作</th>
			</tr>
		</thead>
	</table> 

	<div id="tb">
		<form id="tl">
			  <a
				href="javascript:void(0)" onclick="init()"
				class="easyui-linkbutton"
				data-options="iconCls:'icon-search',plain:true">搜索</a> 
			 <a
				href="javascript:void(0)" onclick="tianjia()"
				class="easyui-linkbutton"
				data-options="iconCls:'icon-add',plain:true">添加</a> 
			 <a
				href="javascript:void(0)" onclick="shezhi()"
				class="easyui-linkbutton"
				data-options="iconCls:'icon-ok',plain:true">设置</a> 
			 <a
				href="javascript:void(0)" id="daochu"
				class="easyui-linkbutton"
				data-options="iconCls:'icon-redo',plain:true">导出到excel</a> 
				
				 <br>
       
        <label for="name">姓名关键字:</label>   
        <input class="easyui-validatebox" type="text"  id="stu_name" data-options="required:false" />   
        <label for="name">电话:</label>   
        <input class="easyui-validatebox" type="text"  id="stu_tel" data-options="required:false" />   
        <label for="name">是否缴费:</label>   
        <!-- <input class="easyui-validatebox" type="text"  id="p_isPay" data-options="required:false" /> -->
         <select id=p_isPay class="easyui-combobox" name="dept" style="width: 150px;">
				<option value="">---请选择---</option>
				<option value="已缴费">已缴费</option>
				<option value="未缴费">未缴费</option>

			</select>   
        <label for="name">是否有效:</label>   
        <!-- <input class="easyui-validatebox" type="text"  id="p_isPay" data-options="required:false" /> -->
         <select id=p_validity class="easyui-combobox" name="dept" style="width: 150px;">
				<option value="">---请选择---</option>
				<option value="0">是</option>
				<option value="1">否</option>

			</select>   
        <label for="name">是否回访:</label>   
        <!-- <input class="easyui-validatebox" type="text"  id="p_isPay" data-options="required:false" /> -->
         <select id=p_isReturn class="easyui-combobox" name="dept" style="width: 150px;">
				<option value="">---请选择---</option>
				<option value="0">已回访</option>
				<option value="1">未回访</option>

			</select> 
			<label for="name">QQ:</label>   
        <input class="easyui-validatebox" type="text"  id="stu_qq" data-options="required:false" />     
       <br>
       <label for="name">创建时间:</label>   
        <input class="easyui-datebox" type="text"  id="stu_loadTime" data-options="required:false" />
        <label for="name">上门时间:</label>   
        <input class="easyui-datebox" type="text"  id="p_timeTheDoor" data-options="required:false" />
        <label for="name">首次回访时间:</label>   
        <input class="easyui-datebox" type="text"  id="p_firstReturnTime" data-options="required:false" />
        <label for="name">进班时间:</label>   
        <input class="easyui-datebox" type="text"  id="p_classTime" data-options="required:false" />
        <label for="name">缴费时间:</label>   
        <input class="easyui-datebox" type="text"  id="p_payTime" data-options="required:false" />
    	 
        

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
			<label for="name">学生姓名:</label> <input class="easyui-textbox"
				type="text" name="name" id="addstu_name"
				 style="width: 150px;"/> 
			
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
			<label for="name">性别:</label>
			 <select id=addstu_sex class="easyui-combobox" name="dept" style="width: 150px;">
				<option value="">---请选择---</option>
				<option value="男">男</option>
				<option value="女">女</option>

			</select>
			 <br>
			 <br>
			 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			<label for="name">年龄:</label> 
			<input class="easyui-textbox" type="text" name="jiage" id="addstu_age" style="width: 150px;" /> 
			
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label for="name">电话:</label> 
			<input class="easyui-textbox" type="text" name="zuoze" id="addstu_tel" style="width: 150px;" /> 
			<br>
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			<label for="name">学历:</label> 
			
		    <select id=addstu_xueli class="easyui-combobox" name="dept" style="width: 150px;">
				<option value="">---请选择---</option>
				<option value="未知">未知</option>
				<option value="大专">大专</option>
				<option value="高中">高中</option> 
				<option value="中专">中专</option>
				<option value="初中">初中</option>
				<option value="本科">本科</option>
				<option value="其他">其他</option>

			</select>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			<label for="name">状态:</label>
			
		    <select id=addstu_State class="easyui-combobox" name="dept" style="width: 150px;">
				<option value="">---请选择---</option>
				<option value="0">未知</option>
				<option value="1">待业</option>
				<option value="2">在职</option> 
				<option value="3">在读</option>
				

			</select>
		    <br> 
		    <br>
			<label for="name">来源渠道:</label> 
			<input class="easyui-textbox" type="text" name="liyou" id="addstu_sourcer" style="width: 150px;" /> 
			 &nbsp;
			<label for="name">来源网站:</label>
			<input class="easyui-textbox" type="text" name="liyou" id="addstu_site" style="width: 150px;" />
		    <br>
		    <br> &nbsp; 
			<label for="name">学员QQ:</label>
			<input class="easyui-textbox" type="text" name="liyou" id="addstu_qq" style="width: 150px;" />
			 &nbsp;&nbsp;&nbsp; 
			<label for="name">微信号:</label>
			 <input class="easyui-textbox" type="text" name="liyou"
				id="addstu_weiXin" style="width: 150px;" />
				 <br>
				 <br>
		    <label for="name">是否报备:</label> 
			<select id=addstu_reported class="easyui-combobox" name="dept" style="width: 150px;">
				<option value="">---请选择---</option>
				<option value="1">否</option>
				<option value="0">是</option>
				<!-- <option value="2">待定</option> -->

			</select>
			<!--  <input class="easyui-textbox" type="text" name="liyou"  id="addstu_reported" data-options="required:true" /> -->
			<br>
			<br>
			 <label for="name">在线备注:</label>
			 <input class="easyui-textbox" type="text" data-options="multiline:true" name="liyou" id="addstu_note"
				style="width: 350px;height: 50px;" />
              <br>
			<br>
		</form>
	</div>
	<div id="update-dialog" class="easyui-dialog" data-options="modal:true,closed:true,title:'查看学员信息',
	buttons:[{
				text:'关闭',
				handler:function(){
				close();
				}
			
	}]">
		<form class="easyui-form" id="updatefrm">
			<div id="cc" class="easyui-layout" style="width:400px;height:500px;">  

    

   

   <div data-options="region:'west',title:'a.在线录入',split:false" >
  
	        <label for="name">名字:</label>   
	        <input class="easyui-textbox" type="text" name="stu_name"  id="name" data-options="required:true" />   
	    	<br>
	    	<br>
	    	 <label for="name">性别:</label>   
	        <input class="easyui-textbox" type="text" name="stu_sex"  id="name" data-options="required:true" />   
	    	 <br>
	    	 <br>
	    	 <label for="name">年龄:</label>   
	        <input class="easyui-textbox" type="text" name="stu_age"  id="name" data-options="required:true" />   
	    	 <br>
	    	 <br>
	    	 <label for="name">电话:</label>   
	        <input class="easyui-textbox" type="text" name="stu_tel"  id="name" data-options="required:true" />   
	    	 <br>
	    	 <br>
	    	 <label for="name">学历:</label>   
	        <input class="easyui-textbox" type="text" name="stu_xueli"  id="name" data-options="required:true" />   
	    	 <br>
	    	 <br>
	    	 <label for="name">状态:</label>   
	        <!-- <input class="easyui-textbox" type="text" name="stu_State"  id="name" data-options="required:true" />    -->
	    	 <select id=addstu_reported class="easyui-combobox" name="stu_State" style="width: 150px;">
				 
				<option disabled="disabled" value="0">未知</option>
				<option disabled="disabled" value="1">待业</option>
				<option disabled="disabled" value="2">在职</option> 
				<option disabled="disabled" value="3">在读</option>
				<!-- <option value="2">待定</option> -->

			</select>
	    	 <br>
	    	 <br>
	    	 <label for="name">来源渠道:</label>   
	        <input class="easyui-textbox" type="text" name="stu_sourcer"  id="name" data-options="required:true" />   
	    	 
	    	 <br>
	    	 <br>
	    	 <label for="name">来源网站:</label>   
	        <input class="easyui-textbox" type="text" name="stu_site"  id="name" data-options="required:true" />   
	    	 <br>
	    	 <br>
	    	 
	    	
	    	  
	    	  <label for="name">所在区域:</label>   
	        <input class="easyui-textbox" type="text"  name="stu_Address"  id="name" data-options="required:true,formatter:formatShow" />    
	    	<!--  <select id=addstu_reported class="easyui-combobox" name="stu_Address" style="width: 150px;">
				
				<option disabled="disabled" value="1">否</option>
				<option disabled="disabled" value="0">是</option>
				 <option disabled="disabled" value="2">待定</option> 

			</select> -->
			<br>
			<br>
	    	 <label for="name">学员QQ:</label>   
	        <input class="easyui-textbox" type="text" name="stu_qq"  id="name" data-options="required:true" />   
	    	 <br>
	    	 <br>
	    	 <label for="name">微信号:</label>   
	        <input class="easyui-textbox" type="text" name="stu_weiXin"  id="name" data-options="required:true" />   
	    	 <br>
	    	 <br>
	    	  <label for="name">是否报备:</label>   
	        <!-- <input class="easyui-textbox" type="text"  name="stu_reported"  id="name" data-options="required:true,formatter:formatShow" />    -->
	    	 <select id=addstu_reported class="easyui-combobox" name="stu_reported" style="width: 150px;">
				
				<option disabled="disabled" value="1">否</option>
				<option disabled="disabled" value="0">是</option>
				 <option disabled="disabled" value="2">待定</option> 

			</select>
			<br>
	    	 <br>
	    	 <label for="name">在线备注:</label>   
	        <input class="easyui-textbox" type="text" name="stu_note"  id="name" data-options="required:true" />   
	    	 
	    	 
  </div>  

  <div data-options="region:'center',title:'b.咨询师录入'" >
  
         <label for="name">姓名（咨询）:</label>   
	        <input class="easyui-textbox" type="text" name="y_id"  id="name" data-options="required:true" />   
	    	
			<br>
	    	 <label for="name">课程方向:</label>   
	        <input class="easyui-textbox" type="text" name="p_class"  id="name" data-options="required:true" />   
	    	 <br>
	    	 <label for="name">打分:</label>   
	        <input class="easyui-textbox" type="text" name="p_score"  id="name" data-options="required:true" />   
	    	 <br>
	    	 <label for="name">是否有效:</label>   
	        
	    	 <select id="name" class="easyui-combobox" name="p_validity" style="width: 150px;">
				
				<option disabled="disabled" value="1">否</option>
				<option disabled="disabled" value="0">是</option>
				

			</select>
	    	 <br>
	    	 <label for="name">无效原因:</label>   
	        <input class="easyui-textbox" type="text" name="p_whyValidity"  id="name" data-options="required:true" />   
	    	 <br>
	    	 <label for="name">是否回访:</label>   
	        
	    	 <select id="name" class="easyui-combobox" name="p_isReturn" style="width: 150px;">
				
				<option disabled="disabled" value="1">否</option>
				<option disabled="disabled" value="0">是</option>
				

			</select>
	    	 <br>
	    	 <label for="name">首访时间:</label>   
	        <input class="easyui-textbox" type="text" name="p_firstReturnTime"  id="name" data-options="required:true" />   
	    	 <br>
	    	 <label for="name">是否上门:</label>   
	        <input class="easyui-textbox" type="text" name="p_isTheDoor"  id="name" data-options="required:true" />   
	    	 <br>
	    	 <label for="name">上门时间:</label>   
	        <input class="easyui-textbox" type="text" name="p_timeTheDoor"  id="name" data-options="required:true" />   
	    	 <br>
	    	 <label for="name">定金金额:</label>   
	        <input class="easyui-textbox" type="text" name="p_deposit"  id="name" data-options="required:true" />   
	    	 <br>
	    	  <label for="name">定金时间:</label>   
	        <input class="easyui-textbox" type="text"  name="p_depositTime"  id="name" data-options="required:true" />   
	    	 <br>
	    	 <label for="name">是否缴费:</label>   
	        <input class="easyui-textbox" type="text"  name="p_isPay"  id="name" data-options="required:true" />   
	    	 <br>
	    	 <label for="name">缴费时间:</label>   
	        <input class="easyui-textbox" type="text"  name="p_payTime"  id="name" data-options="required:true" />   
	    	 <br>
	    	 <label for="name">缴费金额:</label>   
	        <input class="easyui-textbox" type="text"  name="p_price"  id="name" data-options="required:true" />   
	    	 <br>
	    	 <label for="name">是否退费:</label>   
	        <input class="easyui-textbox" type="text"  name="p_isRefund"  id="name" data-options="required:true" />   
	    	 <br>
	    	 <label for="name">退费原因:</label>   
	        <input class="easyui-textbox" type="text"  name="p_whyRefund"  id="name" data-options="required:true" />   
	    	 <br>
	    	 <label for="name">是否进班:</label>   
	        <input class="easyui-textbox" type="text"  name="p_isClass"  id="name" data-options="required:true" />   
	    	 <br>
	    	 <label for="name">进班时间:</label>   
	        <input class="easyui-textbox" type="text"  name="p_classTime"  id="name" data-options="required:true" />   
	    	 <br>
	    	 <label for="name">进班备注:</label>   
	        <input class="easyui-textbox" type="text"  name="p_classNote"  id="name" data-options="required:true" />   
	    	 <br>
	    	 <label for="name">咨询师备注:</label>   
	        <input class="easyui-textbox" type="text"  name="rouleNote"  id="name" data-options="required:true" />   
	    	 <br>
  
  </div>  

</div>
			
		</form>
		
	</div>
	<!-- 修改页面 -->
	<div id="add-dialog1" class="easyui-dialog"
		 data-options="modal:true,closed:true,title:'新建学员',
	buttons:[{
				text:'保存',
				handler:function(){
				saveadd1();
				}
			},{
				text:'关闭',
				handler:function(){
				close1();
				}
			
	}]">
		<form class="easyui-form" id="addfrm1">


       
                  <br>
			<br>
			<label for="name">学生id:</label> <input disabled="disabled" class="easyui-textbox"
				type="text" name="stu_id" id="addstu_id1"
				 style="width: 150px;"/> 
				 <br>
			<br>
			<label for="name">学生姓名:</label> <input class="easyui-textbox"
				type="text" name="stu_name" id="addstu_name1"
				 style="width: 150px;"/> 
			
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
			<label for="name">性别:</label>
			 <select id="addstu_sex1" class="easyui-combobox" name="stu_sex" style="width: 150px;">
				<option value="">---请选择---</option>
				<option value="男">男</option>
				<option value="女">女</option>

			</select>
			 <br>
			 <br>
			 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			<label for="name">年龄:</label> 
			<input class="easyui-textbox" type="text" name="stu_age" id="addstu_age1" style="width: 150px;" /> 
			
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label for="name">电话:</label> 
			<input class="easyui-textbox" type="text" name="stu_tel" id="addstu_tel1" style="width: 150px;" /> 
			<br>
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			<label for="name">学历:</label> 
			
		    <select id="addstu_xueli1" class="easyui-combobox" name="stu_xueli" style="width: 150px;">
				<option value="">---请选择---</option>
				<option value="未知">未知</option>
				<option value="大专">大专</option>
				<option value="高中">高中</option> 
				<option value="中专">中专</option>
				<option value="初中">初中</option>
				<option value="本科">本科</option>
				<option value="其他">其他</option>

			</select>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			<label for="name">状态:</label>
			
		    <select id="addstu_State1" class="easyui-combobox" name="stu_State" style="width: 150px;">
				
				<option value="0">未知</option>
				<option value="1">待业</option>
				<option value="2">在职</option> 
				<option value="3">在读</option>
				

			</select>
		    <br> 
		    <br>
			<label for="name">来源渠道:</label> 
			<!-- <input class="easyui-textbox" type="text" name="stu_sourcer" id="addstu_sourcer1" style="width: 150px;" />  -->
			  <select id="addstu_sourcer1" class="easyui-combobox" name="stu_sourcer" style="width: 150px;">
				<option value="">---请选择---</option>
				<option value="未知">未知</option>
				<option value="百度">百度</option>
				<option value="百度移动端">百度移动端</option> 
				<option value="360">360</option>
				<option value="360移动端">360移动端</option>
				<option value="搜狗">搜狗</option>
				<option value="搜狗移动端">搜狗移动端</option>
				<option value="UC移动端">UC移动端</option>
				<option value="直接输入">直接输入</option> 
				<option value="自然流量">自然流量</option>
				<option value="直电">直电</option>
				<option value="微信">微信</option>
				<option value="QQ">QQ</option>

			</select>
			 &nbsp;
			<label for="name">来源网站:</label>
			<!-- <input class="easyui-textbox" type="text" name="stu_site" id="addstu_site1" style="width: 150px;" /> -->
		    <select id="addstu_site1" class="easyui-combobox" name="stu_site" style="width: 150px;">
				<option value="">---请选择---</option>
				<option value="未知">其他</option>
				<option value="职英B站">职英B站</option>
				<option value="高考站">高考站</option> 
				<option value="职英A站">职英A站</option>
				

			</select>
		    <br>
		    <br> &nbsp; 
			<label for="name">学员QQ:</label>
			<input class="easyui-textbox" type="text" name="stu_qq" id="addstu_qq1" style="width: 150px;" />
			 &nbsp;&nbsp;&nbsp; 
			<label for="name">微信号:</label>
			 <input class="easyui-textbox" type="text" name="stu_weiXin"
				id="addstu_weiXin1" style="width: 150px;" />
				 <br>
				 <br>
		    <label for="name">是否报备:</label> 
			<select id="addstu_reported1" class="easyui-combobox" name="stu_reported" style="width: 150px;">
				
				<option value="1">否</option>
				<option value="0">是</option>
				<option value="2">待定</option>

			</select>
			<!--  <input class="easyui-textbox" type="text" name="liyou"  id="addstu_reported1" data-options="required:true" /> -->
			<br>
			<br>
			 <label for="name">在线备注:</label>
			 <input class="easyui-textbox" type="text" data-options="multiline:true" name="stu_note" id="addstu_note1"
				style="width: 350px;height: 50px;" />
              <br>
			<br>
		</form>
	</div>
</body>

<script type="text/javascript">
function JSONToCSVConvertor(JSONData, ReportTitle, ShowLabel){
	//如果jsondata不是对象，那么json.parse将分析对象中的json字符串。
	var arrData = typeof JSONData != 'object' ? JSON.parse(JSONData) : JSONData;
	var CSV = '';

	//在第一行拼接标题
	CSV += ReportTitle + '\r\n\n';

	//产生数据标头
	if (ShowLabel) {
		var row = "";
		//此循环将从数组的第一个索引中提取标签
		for ( var index in arrData[0]) {

			//现在将每个值转换为字符串和逗号分隔
			row += index + ',';
		}

		row = row.slice(0, -1);

		//添加带换行符的标签行
		CSV += row + '\r\n';
	}

	//第一个循环是提取每一行
	for (var i = 0; i < arrData.length; i++) {
		var row = "";

		//2nd loop will extract each column and convert it in string comma-seprated
		for ( var index in arrData[i]) {
			row += '"' + arrData[i][index] + '",';
		}

		row.slice(0, row.length - 1);

		//add a line break after each row
		CSV += row + '\r\n';
	}

	if (CSV == '') {
		alert("Invalid data");
		return;
	}

	//Generate a file name
	var fileName = "网络学生_";
	//this will remove the blank-spaces from the title and replace it with an underscore
	fileName += ReportTitle.replace(/ /g, "_");

	//Initialize file format you want csv or xls
	//var uri = 'data:text/csv;charset=utf-8,' + escape(CSV);
	var uri = 'data:text/csv;charset=utf-8,\ufeff' + encodeURI(CSV);

	// Now the little tricky part.
	// you can use either>> window.open(uri);
	// but this will not work in some browsers
	// or you will not get the correct file extension    

	//this trick will generate a temp <a /> tag
	var link = document.createElement("a");
	link.href = uri;

	//set the visibility hidden so it will not effect on your web-layout
	link.style = "visibility:hidden";
	link.download = fileName + ".csv";

	//this part will append the anchor tag and remove it after automatic click
	document.body.appendChild(link);
	link.click();
	document.body.removeChild(link);
}
/**
 * 选择ID增加单击时间执行方法
 */
  
$("#daochu").click(function() {
	var rows=$('#showBook').datagrid('getSelections');
	if(rows.length==0){
		$.messager.alert("系统信息","请选择你要导出的数据");
		return ;
	}
	//导出所有
	/* var data = JSON.stringify($('#booTab').datagrid('getData').rows); */
	var data=JSON.stringify(rows);
	if (data == '')
		return;

	JSONToCSVConvertor(data, "数据信息", true);
});
</script>
</html>