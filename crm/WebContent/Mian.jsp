<%@ page language="java" contentType="text/html; charset=utf-8" import="com.crm.entity.Yonghu"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>學生管理系統</title>
 <%Yonghu yonghu=(Yonghu)session.getAttribute("yonghu"); %>
<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.4.3/themes/icon.css">   
<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.4.3/themes/default/easyui.css">   
<script type="text/javascript" src="js/jquery-easyui-1.4.3/jquery.min.js"></script>   
<script type="text/javascript" src=js/jquery-easyui-1.4.3/jquery.easyui.min.js></script>  
<script type="text/javascript" src="js/jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>  
<script type="text/javascript">
$(function() {				
			$("#menuTree").tree({
				url:"showmain",
				onClick: function(node){  
					 if (node.id) {
						 look(node.text,node.path); 
	                    }
				}
	            });				
			   function look(text, path) {
				  
	                var content = '<iframe scrolling="auto" frameborder="0"  src="'+path+'" style="width:100%;height:800px;"></iframe>';
	                if ($("#tt").tabs('exists', text)) {
	                    $('#tt').tabs('select', text);
	                } else {
	                    $('#tt').tabs('add', {
	                        title : text,
	                        closable : true,
	                        content : content,	                       
	                    });
	                }
	            }  
			 
				function navTab(re, path) {
	            	
					var flag = $("#tt").tabs('exists', re);
					$('#treeUlId').tree({ //和前边加载数据的代码中的"treeUIId"参数,保持一致即可 
						onSelect: function(node) {
							alert(1)
							var isLeaf = $('#treeUlId').tree('isLeaf', node.target); //是否是叶子节点
							if(isLeaf) { //只有叶子节点才会在选项卡中创建选项页（每个选项页对应1个功能）
								if(!flag) {
									$('#tt').tabs('add', { //在选项卡中，创建1个选项页
										title: re, //选项卡中，选项页的标题（在同一个选项卡中，选项页需要保持一致）。
										closable: true,
										content: "<iframe href='YanzhengmaFile.jsp' style='width:100%;height:540px'/>", //此处做了调整，推荐使用iframe的方式实现
									});
								} else {
									$("#tt").tabs('select', re); //直接选中title对应的选项卡
								}
							}
						}
					});
				}
				
	});
  
function tuichu(){ 
		$.post("tuichu",{},
				function(res){
			if(res==1){
				window.location.href='LoginFile.jsp';
			}else{
				$.messager.alert("提示","服务器繁忙,请稍后退出");
			}
		})
	}

function updatePassword(){
	$('#win').window('open'); 
}
function updateYonghuPassword(){ 
	if($("#y_newpassword").val()==$("#y_Renewpassword").val()){ 
					$.post("updateYonghuPassword",{y_id:$("#y_id").val(), 
							y_password:$("#y_password").val(),
							y_newpassword:$("#y_newpassword").val()},function(res){
					if(res>0){ 
						$("#ff").form("clear");
						$('#win').window('close'); 
						$.messager.alert("提示","密码修改成功");
						window.location.href="LoginFile"
						/* 退出重新登录 */
						}else{
							$.messager.alert("提示","修改密码失败");
							}
					})
	}else{
		alert("亲，两次密码输入不一样！")
	} 
}
function closeAddTable(){
	$('#win').window('close'); 
}
function yuangongqiandao(y_id){
 	 
 		$.post("qiandao",{y_id:y_id,yq_state:1},function(res){
 			if(res>0){
 				$('#showBook').datagrid('reload');  
 				$.messager.alert("提示","上班喽！签到成功");
 				$("#a").hide();
				$("#b").toggle();
 			}else{
 				$.messager.alert("提示","该用户签到失败");
 			}
 		})
 	 
}
function yuangongqiantui(y_id){ 
 	 
 		$.post("qiandao",{y_id:y_id,yq_state:2},function(res){
 			if(res>0){
 				$('#showBook').datagrid('reload');  
 				$.messager.alert("提示","下班喽！签退成功");
 				$("#b").hide();
				$("#a").toggle();
 			}else{
 				$.messager.alert("提示","该用户签到失败");
 			}
 		})
  
}



</script>

</head>
<body>
<div style="margin:20px 0;"></div>
		<div class="easyui-layout" style="width:100%;height:700px;">
			<!-- 定义一个div，这个div生成的布局对象宽度为100%，高度为700px。设置class为easyui-layout，这个div就成为一个布局对象-->
			<div data-options="region:'north'" style="height:50px">
				 
				 <%if(yonghu!=null){ %>
					 CRM系统&nbsp;&nbsp;&nbsp;<span id="dlname"></span>
					 欢迎${yonghu.getY_id()}
					<a href="javascript:void(0)" onclick="tuichu()">安全退出</a>
					 <a href="javascript:void(0)" onclick="updatePassword()">修改密码</a>
					<%if(yonghu.getYq_state()==2 || yonghu.getYq_state() == null){ %>
						<a href="javascript:void(0)" id="a" onclick="yuangongqiandao(${yonghu.getY_id()})">未签到</a>
						<a href="javascript:void(0)" id="b" style="display: none;" onclick="yuangongqiantui(${yonghu.getY_id()})">已签到</a>
						
					<%}else{ %>
						<a href="javascript:void(0)" id="b" onclick="yuangongqiantui(${yonghu.getY_id()})">已签到</a>
						<a href="javascript:void(0)" id="a" style="display: none;"  onclick="yuangongqiandao(${yonghu.getY_id()})">未签到</a>
						<%} %>
				<%} %>
			</div>
			<!--设置北部区域，高度为50px-->
			<div data-options="region:'south',split:true" style="height:50px;"></div>
			<!--设置南部区域，设置可以通过分割栏改变面板大小，高度为50px-->
			<div data-options="region:'west',split:true" title="导航应用" style="width:150px;">
				<!--设置西部区域，设置可以通过分割栏改变面板大小，标题为导航应用，宽度为50px-->
				<div id="menuTree">
					<!--这个地方显示树状结构-->
						 
				</div>
			</div>
			<div id="centerTabs" data-options="region:'center',iconCls:'icon-ok'" style="width: 530px;">
				<!--设置中部区域，并设置一个图标宽度为530px-->
				<div id="tt" class="easyui-tabs">
					<!--这个地方采用tabs控件进行布局-->

				</div>
			</div>
		</div>
		
		<!-- 修改密碼 -->
		<div id="win" class="easyui-window" title="My Window" style="width:400px;height:300px"   
        data-options="iconCls:'icon-save',modal:true,closed:true"> 
  
		   <form id="ff" >   
		   		<table style="padding-left:20px;text-align:center" >
		   			<tr style="display: none;"> 
		   				<td><label for="y_id">用戶id:</label> </td>
		   				<td> <input class="easyui-validatebox" type="text"  value="${yonghu.y_id }" name="y_id" id="y_id"  /> </td>
		   			</tr> 
		   			<tr>  
		   				<td><label for="y_name">用戶名:</label> </td>
		   				<td> <input class="easyui-validatebox" type="text" disabled="disabled" value="${yonghu.y_name }" name="y_name" id="y_name"  /> </td>
		   			</tr> 
		   			<tr>
		   				<td><label for="y_password">请输入原密码:</label> </td>
		   				<td> <input class="easyui-validatebox" type="password" name="y_password" id="y_password"  /> </td>
		   			</tr> 
		   			<tr>
		   				<td><label for="y_newpassword">请输入新密码:</label> </td>
		   				<td> <input class="easyui-validatebox" type="password" name="y_newpassword" id="y_newpassword"  /> </td>
		   			</tr> 
		   			<tr>
		   				<td><label for="y_Renewpassword">确认输入新密码:</label> </td>
		   				<td> <input class="easyui-validatebox" type="password" name="y_Renewpassword" id="y_Renewpassword"  /> </td>
		   			</tr> 
		   		<tr>
		   		<td></td>
		   				<td> <a href="javascript:void(0)" class="easyui-linkbutton"   onclick="updateYonghuPassword()">保存</a> 
				  <a href="javascript:void(0)" class="easyui-linkbutton"  onclick="closeAddTable()">关闭</a> </td>	</tr> 
		   		</table>
		    
				
							    
		       
			</form>   
</div>  
</body>
</html>