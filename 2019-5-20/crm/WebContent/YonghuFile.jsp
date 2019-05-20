<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>用户管理中心</title>
<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.4.3/themes/icon.css">   
<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.4.3/themes/default/easyui.css">   
<script type="text/javascript" src="js/jquery-easyui-1.4.3/jquery.min.js"></script>   
<script type="text/javascript" src=js/jquery-easyui-1.4.3/jquery.easyui.min.js></script>  
<script type="text/javascript" src="js/jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>  
<script type="text/javascript">
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
			$.messager.alert("提示","删除失败");
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
					$.messager.alert("提示","新增失败");
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
</script>
</head>
<body>

<table id="dg" class="easyui-datagrid">   
    <thead>   
        <tr>  
            <th data-options="field:'y_id'">用户id</th>   
            <th data-options="field:'y_name'">用户名称</th>   
            <th data-options="field:'y_password'">用户密码</th>  
            <th data-options="field:'y_email'">用户邮箱</th>  
            <th data-options="field:'y_lastLoginTime'">最后一次登录时间</th>  
            <th data-options="field:'y_tel'">用户电话</th>  
            <th data-options="field:'y_createTime'">用户创建时间</th>  
            <th data-options="field:'y_pasdWrongShu'">账号登录错误次数</th>  
            <th data-options="field:'y_isLockout',formatter:suodingy_isLockout">是否锁定</th>
          <!--   <th data-options="field:'y_resetPassword'">重置密码</th>   -->
            <th data-options="field:'y_weight'">权重（权限）</th> 
             
          <!--   <th data-options="field:'yq_state',formatter:formatShow">签到状态</th> 
            <th data-options="field:'yq_startTime'">签到时间</th> 
            <th data-options="field:'yq_endTime'">签退时间</th>  -->
           <!--  <th data-options="field:'y_yanzhengma'">登录验证码</th>  -->  
            <th data-options="field:'caozuo',formatter:caozuo">操作</th> 
            <th data-options="field:'suoding',formatter:suoding">账号锁定</th> 
          <!--   <th data-options="field:'qiandao',formatter:qiandao">签到操作</th> -->
            <th data-options="field:'shezhi',formatter:shezhi">設置角色</th>  
        </tr>   
    </thead>    
</table>  
<div id="tb">
	<form id="FormTb">
	<!-- 用户名、创建起止时间、创建结束时间、是否锁定（1：是；2：否）、排序（创建时间、最后登录时间) -->
		<label for="y_name">用户名称:</label> 
		<input class="easyui-validatebox" type="text" name="y_name" id="y_name"  />
		
		<label for="y_createTime">创建起止时间:</label> 
		<input   type= "text" class= "easyui-datebox" id="y_createStartTime" /> 
		 ~<input  type= "text" class= "easyui-datebox" id="y_createEndTime" />
		
		<label for="y_isLockout">是否锁定:</label> 
		 <select  name="y_isLockout" class="easyui-combobox" id="y_isLockout" style="width:130px;">   
		    <option value=""  selected="selected">-----请选择-----</option>   
		    <option value="1">锁定</option>   
		    <option value="2">未锁定</option> 
		</select>  
		
		<!--  <label for="name">签到状态:</label>   
         <select id="yq_state" class="easyui-combobox" name="dept" style="width: 200px;">
				<option value="">---请选择---</option>
				<option value="1">已签到</option>
				<option value="2">未签到</option> 
			</select> 
        -->
         <label for="name">排序:</label>   
         <select id="orderByTime" class="easyui-combobox" name="dept" style="width: 150px;">
				<option value="">---请选择---</option>
				<option value="1">创建时间排序</option>
				<option value="2">最后登录时间排序</option> 
			</select> 
        
      <!--   <label for="name">签到开始时间:</label>   
        <input class="easyui-datetimebox" type="text"  id="minTime" data-options="required:false" />
     
        <label for="name">签到结束时间:</label>   
        <input class="easyui-datetimebox" type="text"  id="maxTime" data-options="required:false" /> -->
       
	</form> 
	 
<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onclick="init()">检索</a>
<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="addFrom()">新增用户</a>
</div>

<!-- 新增用户信息 -->
<div id="win" class="easyui-window" title="My Window" style="width:600px;height:400px"   
        data-options="iconCls:'icon-save',modal:true,closed:true"> 
  <!--       登录名、密码、邮箱、手机号码
        y_name,y_password,y_email,y_tel -->
		   <form id="ff" >   
		   		<table style="padding-left:20px;text-align:center" >
		   			<tr>
		   				<td><label for="y_name">用户名称:</label> </td>
		   				<td> <input class="easyui-validatebox" type="text" name="y_name" id="y_name1"  /> </td>
		   			</tr>
		   			<tr>
		   				<td><label for="y_password">用户密码:</label> </td>
		   				<td> <input class="easyui-validatebox" type="text" name="y_password" id="y_password1"/> </td>
		   			</tr>
		   			<tr>
		   				<td><label for="y_email">用户邮箱:</label> </td>
		   			<td> <input class="easyui-validatebox" type="text" name="y_email" id="y_email1" data-options="required:true,validType:'email'"    /> </td>
		   			</tr>
		   			<tr>
		   				<td><label for="y_tel">用户电话:</label> </td>
		   				<td> <input class="easyui-validatebox"   name="y_tel" id="y_tel1"/> </td>
		   			</tr> 
		   			<tr></tr>
		   			<tr><td></td>
		   			<td>
		   			<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-ok',plain:true"   onclick="addYonghu()">保存</a>
	
					<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-no',plain:true"  onclick="closeAddTable()">关闭</a>
					</td></tr>
		   		</table>
		    
	
				    
		       
			</form>   
</div>  
<!-- 修改页面 -->
  
<div id="win1" class="easyui-window" title="My Window" style="width:600px;height:400px"   
        data-options="iconCls:'icon-save',modal:true,closed:true"> 
  <!--       登录名（只能显示不能编辑）、邮箱、手机号码
        y_name,y_email,y_tel -->
		   <form id="ff1" >   
		   		<table style="padding-left:20px;text-align:center" >
		   			<tr style="display: none">
		   				<td><label for="y_id">用户id:</label> </td>
		   				<td> <input class="easyui-validatebox" type="text" name="y_id" id="y_id2"  /> </td>
		   			</tr>
		   			<tr>
		   				<td><label for="y_name">用户名称:</label> </td>
		   				<td> <input class="easyui-validatebox" disabled="disabled" type="text" name="y_name" id="y_name2"  /> </td>
		   			</tr>
		   			
		   			<tr>
		   				<td><label for="y_email">用户邮箱:</label> </td>
		   				<td> <input class="easyui-validatebox" type="text" name="y_email" id="y_email2" data-options="required:true,validType:'email'"    /> </td>
		   			</tr>
		   			<tr>
		   				<td><label for="y_tel">用户电话:</label> </td>
		   				<td> <input class="easyui-validatebox" type="text" name="y_tel" id="y_tel2"/> </td>
		   			</tr>
		   			<tr></tr>
		   			 <tr>
		   			 <td></td>
		   			 <td>
		   			 <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-ok',plain:true"  onclick="editYonghu1()">保存</a>
	
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-no',plain:true"  onclick="closeeditTable()">关闭</a>
				    
		
		   			 </td>
		   			 </tr>
		   		
		   		</table>
		    
	       
			</form>   
</div>  

 
<!--  角色的添加与删除的window弹框-->		
		<div id="win2" class="easyui-window" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:500px;height:500px;padding:10px;">
			<table>
				<tr>
					<td width="200px">
						<table id="yhRoles" title="系统所有角色" class="easyui-datagrid" data-options="rownumbers:true,singleSelect:true,method:'post'">
							<thead>
								<tr>  
									<th data-options="field:'r_id',width:80,hidden:true">角色ID</th>
									<th data-options="field:'r_name',width:100">角色名</th>
								</tr>
							</thead>
						</table>
					</td>
					<td width="100px">
						<input type="button" value=">>" onclick="addRoles()" /></br> 
						<input type="button"   value="&lt;&lt;" onclick="deleteyonghuByRoles()" /> 
					</td>
					<td width="200px" valign="top">
						<table id="myRoles" title="当前用户所有角色" class="easyui-datagrid" data-options="rownumbers:true,singleSelect:true,method:'post'">
							<thead>
								<tr>  
									<th data-options="field:'r_id',width:80,hidden:true">角色ID</th>
									<th data-options="field:'r_name',width:100">角色名</th>
								</tr>
							</thead>
						</table>
					</td>
				</tr>
			</table>
		</div>



</body>
</html>