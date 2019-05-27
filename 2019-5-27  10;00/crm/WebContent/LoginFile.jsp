<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>用戶登錄頁面</title>
</head> 
 <link rel="stylesheet" media="screen" href="js/style.css">
  <link rel="stylesheet" type="text/css" href="js/reset.css"/>
  <script type="text/javascript"
    src="${pageContext.request.contextPath}/js/jquery-easyui-1.4.3/jquery.min.js"></script>
<body>

	<div id="particles-js">
		<div class="login">
			<div class="login-top">
				登录
			</div>
			<!--  <form action="login" method="post"> -->
				<div class="login-center clearfix">
					<div class="login-center-img"><img src="img/name.png"/></div>
					<div class="login-center-input">
						<input type="text" id="name" name="name" value="" placeholder="请输入您的用户名" onfocus="this.placeholder=''" onblur="this.placeholder='请输入您的用户名'"/>
						<div class="login-center-input-text">用户名</div>
					</div>
				</div>
				<div class="login-center clearfix">
					<div class="login-center-img"><img src="img/password.png"/></div>
					<div class="login-center-input">
						<input type="password" id="password" name=""value="" placeholder="请输入您的密码" onfocus="this.placeholder=''" onblur="this.placeholder='请输入您的密码'"/>
						<div class="login-center-input-text">密码</div>
					</div>
				</div>
			 <div>
			 <div class="login-center clearfix">
					<div class="login-center-img"><img src="img/password.png"/></div>
					<div class="login-center-input">
						<input type="text" id="code" name="code" value="" placeholder="请输入验证码" onfocus="this.placeholder=''" onblur="this.placeholder='请输入验证码'"/>
						<div class="login-center-input-text">验证码</div>
					</div>
				</div> 
				<div style="text-align: center;">
					<a href="#" onclick="changeImg()">  <img id="imgObj" alt="验证码"  style="width:200px"  src="getCode">
					   </a> 
					   <!-- <input         type="submit" value="提交" /> -->
	            </div>
            </div>
    
			<div  style="padding-left: 40px;" >
			<input     class="login-button"  onclick="dengluyanzheng()"   type="submit" value="登陆">	</input>        
			</div>
			
			<!-- </form> -->
		</div>
		<div class="sk-rotating-plane"></div>
	</div>	
</body>
<script src="js/particles.min.js"></script>
<script src="js/app.js"></script>
<script type="text/javascript"  src="js/JSPjs/LoginFile.js">    </script>
</html>