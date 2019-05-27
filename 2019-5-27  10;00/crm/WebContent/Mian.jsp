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
<script type="text/javascript" src="js/JSPjs/Main.js"></script>

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