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
<script type="text/javascript" src="js/JSPjs/FenliangFile.js"></script> 
    
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