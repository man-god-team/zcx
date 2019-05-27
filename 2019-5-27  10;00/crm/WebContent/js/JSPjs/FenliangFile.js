$(function() {
		$.post("selectAllByZidongfenpei",{},function(res){
			data = eval('(' + res + ')')
			if(data=="是"){ 
				$("#a").switchbutton("check"); 
			}else if(data=="否"){ 
				$("#a").switchbutton("uncheck"); 
			}
		}) 
		
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
 
	 $.post("updateZidongfenpei1",{f_id:f_id,fenpeizhuangtai:fenpeizhuangtai},function(res){
		/*  if (res > 0) {
				$.messager.alert("提示", "自动分配开启");
			} else {
				//添加失败
				$.messager.alert("提示", "自动分配关闭");
			} */

		}) 
}