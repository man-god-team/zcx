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
	$('#tt').tree({    
	    url: "showmodel",
	    method:"post",
	   /*  loadFilter: function(data){    
	        if (data.d){    
	            return data.d;    
	        } else {    
	            return data;    
	        }    
	    }  */   
	});  
}
</script>
</head>
<body>
<div>

<ul id="tt"  ></ul>  
</div>



</body>
</html>