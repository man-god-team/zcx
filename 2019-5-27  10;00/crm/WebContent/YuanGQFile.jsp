<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户签到表</title>
<link rel="stylesheet" href="js/jquery-easyui-1.4.3/themes/icon.css">
<link rel="stylesheet" href="js/jquery-easyui-1.4.3/themes/default/easyui.css">
<script type="text/javascript" src="js/jquery-easyui-1.4.3/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="js/JSPjs/YuanGQFile.js"></script> 
</head>
<body>
	<table id="showBook" class="easyui-datagrid" >
		<thead>
			<tr>
				<th data-options="field:'y_id',title:'编号'"></th>
				<th data-options="field:'y_name',title:'用户名'" ></th>
				<th data-options="field:'yq_state',formatter:formatShow,title:'签到状态'"></th>
				 <th data-options="field:'yq_startTime',title:'签到时间'"></th>
				<th data-options="field:'yq_endTime',title:'签退时间'"></th>
				<th data-options="field:'yonghuqiandao',formatter:yonghuqiandao">操作</th>
			</tr>
		</thead>
	</table>
	
	<div id="tb">
		<form id="tl">
	
       
        <label for="name">用户名:</label>   
        <input class="easyui-validatebox" type="text"  id="y_name" data-options="required:false" />   
    	
    	 
        <label for="name">签到状态:</label>   
        
         <select id=yq_state class="easyui-combobox" name="dept" style="width: 200px;">
				<option value="">---请选择---</option>
				<option value="1">已签到</option>
				<option value="2">未签到</option>
				

			</select> 
       
        <label for="name">签到开始时间:</label>   
        <input class="easyui-datetimebox" type="text"  id="minTime" data-options="required:false" />
     
        <label for="name">签到结束时间:</label>   
        <input class="easyui-datetimebox" type="text"  id="maxTime" data-options="required:false" />
          <br>
      <a href="javascript:void(0)" onclick="init()" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">搜索</a>
      <a href="javascript:void(0)" onclick="yijianqiantui()" class="easyui-linkbutton" >一键签退</a>
	
	
     
    	  
		
	</form>
	</div> 
	 
</body>
</html>