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

	 

	