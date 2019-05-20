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
					<a href="#" onclick="changeImg()">  <img id="imgObj" alt="验证码"  style="width:200px"  src="${pageContext.request.contextPath}/getCode">
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
<script type="text/javascript">
$(function() {

	changeImg();
});
function changeImg() {        
    var imgSrc = $("#imgObj");    
    var src = imgSrc.attr("src");        
    imgSrc.attr("src", chgUrl(src));
}

// 时间戳
// 为了使每次生成图片不一致，即不让浏览器读缓存，所以需要加上时间戳
function chgUrl(url) {
    var timestamp = (new Date()).valueOf();
    url = url.substring(0, 20);
    if ((url.indexOf("&") >= 0)) {
        url = url + "×tamp=" + timestamp;
    } else {
        url = url + "?timestamp=" + timestamp;
    }
    return url;
}

	function hasClass(elem, cls) {
	  cls = cls || '';
	  if (cls.replace(/\s/g, '').length == 0) return false; //当cls没有参数时，返回false
	  return new RegExp(' ' + cls + ' ').test(' ' + elem.className + ' ');
	}
	 
	function addClass(ele, cls) {
	  if (!hasClass(ele, cls)) {
	    ele.className = ele.className == '' ? cls : ele.className + ' ' + cls;
	  }
	}
	 
	function removeClass(ele, cls) {
	  if (hasClass(ele, cls)) {
	    var newClass = ' ' + ele.className.replace(/[\t\r\n]/g, '') + ' ';
	    while (newClass.indexOf(' ' + cls + ' ') >= 0) {
	      newClass = newClass.replace(' ' + cls + ' ', ' ');
	    }
	    ele.className = newClass.replace(/^\s+|\s+$/g, '');
	  }
	}
	
	function dengluyanzheng(){
		var code=$("#code").val();
		 var password=$("#password").val();
		 var name=$("#name").val(); 
			 $.post("login",{
				 code:code,
				 password:password,
				 name:name
			 },function(res){
				 data = eval('(' + res + ')')
				 if(data=="登录成功"){ 
					  alert(data);  
					window.location.href="Mian";
				 }else{
					  
					 alert(data)
				 }
					
				  
			 }) 
	}
	
	 
    function click(e) {
        if (document.all) {
            if (event.button == 2 || event.button == 3) {
                alert("1");
                oncontextmenu = 'return false';
            }
        }
        if (document.layers) {
            if (e.which == 3) {
                oncontextmenu = 'return false';
            }
        }
    }
    if (document.layers) {
        document.captureEvents(Event.MOUSEDOWN);
    }
    document.onmousedown = click;
    document.oncontextmenu = new Function("return false;")
    document.onkeydown = document.onkeyup = document.onkeypress = function() {
        if (window.event.keyCode == 123) {
            window.event.returnValue = false;
            return (false);
        }
    }

	 

	 
</script>
</html>