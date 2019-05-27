$(function() {
		init();
		showSetColumn();
	})
	function init() {
	
		$("#showBook").datagrid({
			url : 'selectStudent',
			method : 'post',
			pagination : true,
			toolbar : '#tb',
			queryParams:{
				stu_name:$("#stu_name").val(),
				stu_tel:$("#stu_tel").val(), 
				y_name:$("#y_name").val(),
				w_id:$("#stu_wid").val(), 
				stu_qq:$("#stu_qq").val(),
				p_isPay:$("#p_isPay").combobox("getValue"),
				p_validity:$("#p_validity").combobox("getValue"),
				p_isReturn:$("#p_isReturn").combobox("getValue"),
				stu_loadTime:$("#stu_loadTime").datebox("getValue"),
				p_firstReturnTime:$("#p_firstReturnTime").datebox("getValue"),
				p_timeTheDoor:$("#p_timeTheDoor").datebox("getValue"),
				p_payTime:$("#p_payTime").datebox("getValue"),
				p_classTime:$("#p_classTime").datebox("getValue") 
				}

		});
		$("#tl").form("clear");

	}

	 function formatterssss(value, row, index) {
		return "<a href='javascript:void(0)' onclick='chakan("
				+ index
				+ ")'>查看</a>  <a href='javascript:void(0)' onclick='xiugai("
				+ index
				+ ")'>修改</a>  <a href='javascript:void(0)' onclick='shanchu("
				+ index
				+ ")'>删除</a>";
	} 
	

	 function chakan(index){
			var arr=$("#showBook").datagrid("getData");
			var row=arr.rows[index];
			
			//填充表单
			$("#updatefrm").form("load",row);
			
			//打开弹窗
			$("#update-dialog").dialog("open")
			
			
		}
	 function xiugai(index){
			var arr=$("#showBook").datagrid("getData");
			var row=arr.rows[index];
			
			//填充表单
			$("#addfrm1").form("load",row);
			
			//打开弹窗
			$("#add-dialog1").dialog("open")
			
			
		}
	 function shanchu(index) {
			var arr = $("#showBook").datagrid("getData");
			var row = arr.rows[index];
			$.messager.confirm('确认删除', '确认删除吗？', function(r) {
				if (r) {
					$.post("deleteStudent", {
						stu_id : row.stu_id,
						y_id : row.y_id
					}, function(res) {
						if (res > 0) {
							$("#showBook").datagrid("reload");
							$.messager.alert("提示", "删除成功");
						}else{
							$.messager.alert("提示", "该学生已经分配不能删除");
						}
					}, "json")
				}
			});

		}
	function tianjia(index) {

		//打开弹窗
		$("#add-dialog").dialog("open")
	}
	function close() {
		$("#update-dialog").dialog("close")
		$("#add-dialog").dialog("close")
	}
	function close1() {
		$("#update-dialog1").dialog("close")
		$("#add-dialog1").dialog("close")
	}

	function saveadd1() {
		//获取弹窗中的所有的数据 
		
		$.post("updateStudent", {
			
			stu_id : $("#addstu_id1").val(),
			stu_name : $("#addstu_name1").val(),
			stu_sex : $("#addstu_sex1").combobox("getValue"),
			stu_age : $("#addstu_age1").val(),
			stu_tel : $("#addstu_tel1").val(),
			stu_xueli : $("#addstu_xueli1").combobox("getValue"),
			stu_State : $("#addstu_State1").combobox("getValue"),
			stu_sourcer : $("#addstu_sourcer1").combobox("getValue"),
			stu_site : $("#addstu_site1").combobox("getValue"),
			stu_qq : $("#addstu_qq1").val(),
			stu_weiXin : $("#addstu_weiXin1").val(),
			stu_reported : $("#addstu_reported1").combobox("getValue"),
			
			stu_note : $("#addstu_note1").val()

		}, function(res) {
			if (res > 0) {
				//修改成功
				$("#showBook").datagrid("reload");
				$("#add-dialog1").dialog("close")
				$.messager.alert("提示", "修改成功");
			} else {
				//修改失败
				$.messager.alert("提示", "修改失败");
			}

		}, "json") 

	}
	function saveadd() {
		//获取弹窗中的所有的数据
		

		$.post("addStudent", {

			stu_id : $("#addid").val(),
			stu_name : $("#addstu_name").val(),
			stu_sex : $("#addstu_sex").combobox("getValue"),
			stu_age : $("#addstu_age").val(),
			stu_tel : $("#addstu_tel").val(),
			stu_xueli : $("#addstu_xueli").combobox("getValue"),
			stu_State : $("#addstu_State").combobox("getValue"),
			stu_sourcer : $("#addstu_sourcer").combobox("getValue"),
			stu_site : $("#addstu_site").combobox("getValue"),
			stu_qq : $("#addstu_qq").val(),
			stu_weiXin : $("#addstu_weiXin").val(),
			stu_reported : $("#addstu_reported").combobox("getValue"),
			w_id : $("#addw_id").val(),

			stu_note : $("#addstu_note").val()

		}, function(res) {

			if (res > 0) {
				//添加成功
				$("#showBook").datagrid("reload");
				$("#add-dialog").dialog("close");
				
				$.post("selectAllByZidongfenpei",{},function(res){
					 data = eval('(' + res + ')')
					 if(data=="是"){  
					 	 $.post("updateStudentByzidongfenpei",{},
							function(res){
					 		 if(res>0){
					 		/* 	$.messager.alert("提示", "自动分配成功"); */
					 		 }else{
					 			$.messager.alert("提示", "未自动分配");
					 		 }
					 	 })
					 }else{
						  
					 }
				})
				$.messager.alert("提示", "添加成功");
			}else{//添加失败
				$.messager.alert("提示", "添加失败");
			}

		}, "json")
		$("#addfrm").form("clear");

	}
	
	function formatShow(value, row, index) {
		var res = '';
		switch (value) {
		case 0:
			res = '<font style="color:red;">是</font>'
			break;
		case 1:
			res = '<font style="color:red;">否</font>'
			break;
		case 2:
			res = '<font style="color:red;">待定</font>'
			break;
		default:
			break;
		}
		return res;
	}
	 function formatShow1(value, row, index) {
		var res = '';
		switch (value) {
		case 0:
			res = '<font style="color:red;">未知</font>'
			break;
		case 1:
			res = '<font style="color:red;">待业</font>'
			break;
		case 2:
			res = '<font style="color:red;">在职</font>'
			break;
		case 3:
			res = '<font style="color:red;">在读</font>'
			break;
		
		}
		return res;
	} 

	
	 function shezhi(){
			$("#showColumn").window("open");
		}
		function showSetColumn(){
			$("#disColumn").find("input[name=check]").change(function(res) {
				if (this.checked == true) {
					$("#showBook").datagrid("showColumn", this.value);
				} else {
					$("#showBook").datagrid("hideColumn", this.value);
				}
			});
		}
		
