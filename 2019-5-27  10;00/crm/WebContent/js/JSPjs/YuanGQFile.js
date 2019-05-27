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
 
 function yijianqiantui(){
	 $.post("yijianqiantui",{},function(res){
			if(res>0){
				$('#showBook').datagrid('reload');  
				$.messager.alert("提示","一键签退成功");
			}else{
				$.messager.alert("提示","一键签退失败");
			}
		})
	 
 }