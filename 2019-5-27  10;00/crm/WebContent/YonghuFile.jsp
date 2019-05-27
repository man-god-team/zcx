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
<script type="text/javascript" src="js/JSPjs/YonghuFile.js"></script>
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