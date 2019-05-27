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