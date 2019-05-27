$(function() {
		$("#tt").tree({
			url: 'showmodel', //数据接口的地址
			lines: true, 
			onContextMenu: function(e, node) {
				e.preventDefault();
				$("#tt").tree("select", node.target);
				$("#mm").menu("show", {
					left: e.pageX,
					top: e.pageY
				});
			}
		});
	});

	function menuHandler(item) {
		if(item.name == "add") {
			addModuleInfo();
		} else if(item.name == "edit") {
			updateModuleInfo();
		} else if(item.name == "del") {
			deleteModuleInfo();
		}
	}

	function addModuleInfo() {
		var nodes = $('#tt').tree('getSelected'); // get checked nodes
		/*var parent = $('#tt').tree('getParent', nodes.target);*/
		// alert(nodes.text);//获取
		//alert(nodes.id);//获取节点id
		/*alert(parent.id);*/
		if(nodes != null) {
			//将当前行数据填入表单
			$("#ename_1").text(nodes.text);
			$("#updateuser_window").window("open");
		} else {
			alert("请选择父节点！");
		}
	}

	function closeUserForm(){
		$("#updateuser_window").window("close");
	}
	//点击新增保存按钮
	function submitModuleForm() {
		var nodes = $('#tt').tree('getSelected');
		var flag = $("#updateuserForm").form("validate");
		var moduleName = $("#modulename").val();
		var weight = $("#weight").val();
		var path = $("#path").val();
		if(flag) {
			/* private Integer m_id;
			private String m_name;
			private Integer m_parentId;
			private String m_path;
			private Integer m_weight; */
			$.post("insertModules", {
				m_name: moduleName,
				m_parentId: nodes.id,
				m_path: path,
				m_weight: weight
				},
				function(res) {
					if(res>0) {
						$.messager.alert("提示信息", "新增成功");
						$("#updateuser_window").window("close");
						$("#tt").tree("reload");
					}else{
						$.messager.alert("提示信息",  "模块名称重复");
					}
				}, "json");
		}
	}

	
	function updateModuleInfo() {
		var nodes = $('#tt').tree('getSelected'); 
		 
		if(nodes != null) { 
			$.post("selectModuleById", {
				m_id: nodes.id
			}, function(res) {
				if(res) {
					//将当前行数据填入表单
					 $("#updatename").textbox("setValue",res.m_name);
					$("#updatepath").textbox("setValue", res.m_path);
					$("#updateweight").textbox("setValue", res.m_weight);
					$("#updateuser_window1").window("open");   
				}
			}, "json"); 
		} else {
			alert("请选择节点！");
		} 
	}

	function closeUserForm1(){
		$("#updateuser_window1").window("close");
	}
	function submitModuleForm1() {
		var nodes = $('#tt').tree('getSelected');
		var parent = $('#tt').tree('getParent', nodes.target);
		var flag = $("#updateuserForm1").form("validate");
		var updatename = $("#updatename").val();
		var updatepath = $("#updatepath").val();
		var updateweight = $("#updateweight").val();
		if(flag) { 
			$.post("updateModules", {
				m_id: nodes.id,
				m_name: updatename,
				m_parentId: parent.id,
				m_path: updatepath,
				m_weight: updateweight
				},
				function(res) {
					if(res>0) {
						$.messager.alert("提示信息", "修改成功", "error");
						$("#updateuser_window1").window("close");
						$("#tt").tree("reload");
					} else {
						$.messager.alert("提示信息", res.msg, "error");
					}
				}, "json");
		}
	}

	function deleteModuleInfo() {
		var nodes = $('#tt').tree('getSelected');
		$.messager.confirm('确认信息', '您确认想要删除吗？', function(r) {
			if(r) {
				if(nodes != null) {
					$.post("deleteModules", {
						m_id: nodes.id,
						},
						function(res) {
							if(res>0) {
								$.messager.alert("提示信息", "删除成功", "ok");
								$("#tt").tree("reload");
							} else {
								$.messager.alert("提示信息", "该模块存在角色关联不能删除", "error");
							}
						}, "json");
				} else {
					$.messager.alert("提示信息", "请选择节点", "error");
				}
			}

		});

	}