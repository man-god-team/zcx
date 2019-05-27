$(function(){
	init();
})

function init(){ 
	$('#dg').datagrid({    
	    url:'showYonghu',    
	    method:"post",
	    pagination:true,
	    singleSelect:true,
	    toolbar: '#tb',
	    queryParams: {
	    	y_name:$("#y_name").val(), 
	    	y_createStartTime:$("#y_createStartTime").datebox('getValue'),
	    	y_createEndTime:$("#y_createEndTime").datebox('getValue'),
	    	y_isLockout:$("#y_isLockout").combobox("getValue"),
	    	/*	yq_state:$("#yq_state").combobox("getValue"),
		 	minTime:$("#minTime").datetimebox("getValue"), 
			maxTime:$("#maxTime").datetimebox("getValue"),  */
			orderByTime:$("#orderByTime").combobox("getValue")
		} 
	}); 
	$("#FormTb").form('clear');
}

function suodingy_isLockout(value,rows,index){
	return rows.y_isLockout==1 ? "锁定":"未锁定"
}
function shezhi(value,row,index){
	return '<a href="javascript:void(0)" class="easyui-linkbutton"  onclick="ShezhiYonghu('+index+')">設置用户角色</a>  '
}
/* 設置用戶角色  */
function ShezhiYonghu(index){
	var row=$("#dg").datagrid('getData').rows[index];
	 
	$("#win2").window({
		title: "您正在设置" + row.y_name + "的角色！！！！"
	});
	$('#win2').window('open');
	$("#yhRoles").datagrid({
		url: 'showRoles1'
	});
	$("#myRoles").datagrid({
		url: 'showRolesByY_Id',
		queryParams: { 
			y_id:row.y_id
		}
	})
}
function addRoles() {   /*此事件为给用户添加角色*/
	var r_id = $("#yhRoles").datagrid("getSelected").r_id;
	var y_id = $("#dg").datagrid("getSelected").y_id; 
	var role = $("#yhRoles").datagrid("getSelected");
	if(role) {
		$.post("addYonghuJuese", {
			r_id:r_id,
			y_id:y_id
		}, function(res) {
			if(res>0) {
				$("#myRoles").datagrid("reload");
			} else {
				alert("对不起，該用戶已具備此角色！！！");
			}
		},"json");
	} else {
		$.messager.alert("提示","请选择角色名！！！！");
	}
}
function deleteyonghuByRoles(){  /*此事件为删除用户已有的角色*/
	var r_id = $("#myRoles").datagrid("getSelected").r_id;
	var y_id = $("#dg").datagrid("getSelected").y_id; 
	var role = $("#myRoles").datagrid("getSelected");
	if(role) {
		$.post("deleteYonghuJuese", {
			r_id:r_id,
			y_id:y_id
		}, function(res) {
			if(res>0) {
				$("#myRoles").datagrid("reload");
			} else {
				alert("对不起，删除失败，请重试！！！");
			}
		},"json");
	} else {
		$.messager.alert("请选择角色名！！！！");
	}
}
function suoding(value,row,index){
	return '<a href="javascript:void(0)" class="easyui-linkbutton"  onclick="suodingYonghu('+index+')">锁定用户</a>   <a href="javascript:void(0)" class="easyui-linkbutton"  onclick="jiesuoYonghu('+index+')">解锁用户 </a>'
}
function suodingYonghu(index){
	var y_id=$("#dg").datagrid('getData').rows[index].y_id;
	var y_isLockout=$("#dg").datagrid('getData').rows[index].y_isLockout; 
	if(y_isLockout == 2){ 
		$.post("jiesuoYonghu",{y_id:y_id,y_isLockout:1},function(res){
			if(res>0){
				$('#dg').datagrid('reload');  
				$.messager.alert("提示","用户锁定成功");
			}else{
				$.messager.alert("提示","该用户锁定失败");
			}
		})
	}else{
		alert("该用户已被锁定")
	}
	
}
function jiesuoYonghu(index){
	var y_id=$("#dg").datagrid('getData').rows[index].y_id;
	var y_isLockout=$("#dg").datagrid('getData').rows[index].y_isLockout;
	var y_pasdWrongShu =$("#dg").datagrid('getData').rows[index].y_pasdWrongShu;
	if(y_isLockout==1){
		$.post("jiesuoYonghu",{y_id:y_id,y_isLockout:2,y_pasdWrongShu:0},function(res){
			if(res>0){
				$('#dg').datagrid('reload');  
				$.messager.alert("提示","用户解锁成功");
			}else{
				$.messager.alert("提示","解锁失败");
			}
		})
	}else{
		alert("该用户未被锁定")
	}
	
}
function caozuo(value,row,index){
	return '<a href="javascript:void(0)" class="easyui-linkbutton"  onclick="editYonghu('+index+')">修改</a>  <a href="javascript:void(0)" class="easyui-linkbutton"  onclick="Re_PasswordYonghu('+index+')">重置密碼</a>  <a href="javascript:void(0)" class="easyui-linkbutton"  onclick="deleteYonghu('+index+')">删除 </a>'
}
function Re_PasswordYonghu(index){
	var rows=$("#dg").datagrid('getData').rows[index];
	var y_resetPassword=rows.y_resetPassword;
	var y_id=rows.y_id;
	
	$.post("ResetYonghu",{ y_resetPassword:y_resetPassword,y_id:y_id},function(res){
		if(res>0 && res !=null){
			$('#dg').datagrid('reload');  
			$.messager.alert("提示","密碼重置成功");
		}else{
			$.messager.alert("提示","密碼重置失败");
		}
	})
}
function editYonghu(index){
	 
	var rows=$("#dg").datagrid('getData').rows[index];
	 
	$("#ff1").form("load",rows);
	$("#win1").window('open');
}
function closeeditTable(){
	$("#win1").window('close');
}
function editYonghu1(){
	
	$('#ff1').form('submit', { 
		onSubmit: function(){
			var isValid = $(this).form('validate');
			if (!isValid){
				alert("邮箱格式错误")	// 如果表单是无效的则隐藏进度条
			}
			return isValid;	// 返回false终止表单提交
		},
		success: function(){
			$.post("updateYonghu",{ y_name:$("#y_name2").val(),y_email:$("#y_email2").val(),y_tel:$("#y_tel2").val(),y_id:$("#y_id2").val()},function(res){
				if(res>0){
					$('#dg').datagrid('reload');  
					$('#win1').window('close'); 
					$.messager.alert("提示","修改成功");
				}else{
					$.messager.alert("提示","修改失败");
				}
			})	// 如果提交成功则隐藏进度条
		}
	});
 
}
function deleteYonghu(index){
	var y_id=$("#dg").datagrid('getData').rows[index].y_id; 
	$.post("deleteYonghu",{y_id:y_id},function(res){
		if(res>0){
			$('#dg').datagrid('reload');  
			$.messager.alert("提示","删除成功");
		}else{
			$.messager.alert("提示","该用户存在角色关联不能删除");
		}
	})
}
function addFrom(){ 
	$('#win').window('open');
}
function closeAddTable(){
	$('#win').window('close');
}
function addYonghu(){ 
	$('#ff').form('submit', { 
		onSubmit: function(){
			var isValid = $(this).form('validate');
			if (!isValid){
				alert("邮箱格式错误")	// 如果表单是无效的则隐藏进度条
			}
			return isValid;	// 返回false终止表单提交
		},
		success: function(){
			
	/* 		 mobile: {//value值为文本框中的值
			        validator:function(value) {
			            var reg = /^1[3|4|5|8|9]\d{9}$/;
			            alert(reg.test(value))
			            return reg.test(value);
			        },
			        message: "输入手机号码格局不正确."
			    }
		alert(message) */
			$.post("addYonghuAll",
					{y_name:$("#y_name1").val(),
				 y_password:$("#y_password1").val(),
				 y_email:$("#y_email1").val(),
				 y_tel:$("#y_tel1").val()},function(res){
				if(res>0){
					$('#dg').datagrid('reload'); 
					$("#ff").form("clear");
					$('#win').window('close'); 
					$.messager.alert("提示","新增成功");
				}else{
					$.messager.alert("提示","用户名重复不能新增");
				}
			}) 
	}  
	})
}

function formatShow(value,rows,index){  
	return rows.yq_state==1 ? "已签到":"未签到"; 
	} 
function qiandao(value,row,index){
	return '<a href="javascript:void(0)" class="easyui-linkbutton"  onclick="qiandaoYonghu('+index+')">签到</a>   <a href="javascript:void(0)" class="easyui-linkbutton"  onclick="qiantuiYonghu('+index+')">签退 </a>'
}
/*员工签到  */
function qiandaoYonghu(index){
	var y_id=$("#dg").datagrid('getData').rows[index].y_id;
	var yq_state=$("#dg").datagrid('getData').rows[index].yq_state; 
	if(yq_state == 2){ 
		$.post("qiandao",{y_id:y_id,yq_state:1},function(res){
			if(res>0){
				$('#dg').datagrid('reload');  
				$.messager.alert("提示","上班喽！签到成功");
			}else{
				$.messager.alert("提示","该用户签到失败");
			}
		})
	}else{
		alert("今天已经签到了哦！")
	}
}
/*员工签退  */
function qiantuiYonghu(index){
	var y_id=$("#dg").datagrid('getData').rows[index].y_id;
	var yq_state=$("#dg").datagrid('getData').rows[index].yq_state;
	if(yq_state==1){
		$.post("qiandao",{y_id:y_id,yq_state:2},function(res){
			if(res>0){
				$('#dg').datagrid('reload');  
				$.messager.alert("提示","下班啦，签退成功！");
			}else{
				$.messager.alert("提示","签退失败");
			}
		})
	}else{
		alert("不能重复签退哦，亲！")
	}
}