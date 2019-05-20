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
<script type="text/javascript">
$(function(){
	init();
})
function init(){ 
	$("#showBook").datagrid({
		url:'showYonghu',
		method:'post',
		pagination:true,
		toolbar:'#tb',
		queryParams:{  
			y_id:$("#y_id").val(),
			y_name:$("#y_name").val(),
			yq_state:$("#yq_state").combobox("getValue"),
			minTime:$("#minTime").datetimebox("getValue"),
			
			maxTime:$("#maxTime").datetimebox("getValue")
			
		}
	
		
	});
	$("#tl").form("clear");
	
	
}
 

function xiugai(index){
	var arr=$("#showBook").datagrid("getData");
	var row=arr.rows[index];
	
	//填充表单
	$("#updatefrm").form("load",row);
	//打开弹窗
	$("#update-dialog").dialog("open")
	
}
function tianjia(index){
	
	//打开弹窗
	
	$("#add-dialog").dialog("open")
}
function close(){
	$("#update-dialog").dialog("close")
	$("#add-dialog").dialog("close")
}



 function formatShow(value,rows,index){  
	return rows.yq_state==1 ? "已签到":"未签到"; 
	} 

 function yonghuqiandao(value,row,index){
 	return '<a href="javascript:void(0)" class="easyui-linkbutton"  onclick="yonghuqiandaoYonghu('+index+')">签到</a>   <a href="javascript:void(0)" class="easyui-linkbutton"  onclick="yonghuqiantuiYonghu('+index+')">签退 </a>'
 }
 /* function shijian(index){
 	var myDate = new Date();
 	alert(myDate.toLocaleString( ));
 	 
 } */
 function yonghuqiandaoYonghu(index){
 	/* var myDate = new Date();
 	var yq_startTime=myDate.toLocaleString();
 	alert(yq_startTime); */
 	var y_id=$("#showBook").datagrid('getData').rows[index].y_id;
 	
 	var yq_state=$("#showBook").datagrid('getData').rows[index].yq_state; 
 	if(yq_state == 2){ 
 		$.post("qiandao",{y_id:y_id,yq_state:1},function(res){
 			if(res>0){
 				$('#showBook').datagrid('reload');  
 				$.messager.alert("提示","上班喽！签到成功");
 			}else{
 				$.messager.alert("提示","该用户签到失败");
 			}
 		})
 	}else{
 		alert("今天已经签到了哦！")
 	}
 	
 }
 function yonghuqiantuiYonghu(index){
 	var y_id=$("#showBook").datagrid('getData').rows[index].y_id;
 	var yq_state=$("#showBook").datagrid('getData').rows[index].yq_state;
 	if(yq_state==1){
 		$.post("qiandao",{y_id:y_id,yq_state:2},function(res){
 			if(res>0){
 				$('#showBook').datagrid('reload');  
 				$.messager.alert("提示","下班啦，签退成功！");
 			}else{
 				$.messager.alert("提示","签退失败");
 			}
 		})
 	}else{
 		alert("不能重复签退哦，亲！")
 	}
 	
 }
	 
</script>



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
	<a href="javascript:void(0)" onclick="init()" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">搜索</a>
	
	
          <br>
       
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
      
    	  
		
	</form>
	</div> 
	 
</body>
</html>