<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 加载js -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery-1.10.2.min.js"></script>
	
<!-- 加载js -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
	
	<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery.yellowcong.easyui.js"></script>
	
<!-- bootstrap 的样式 -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/bootstrap.css" />
<!-- 字符的样式 -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/font/css/font-awesome.css"
	type="text/css" />
<!-- pretty 好看的显示样式 -->
<link rel="stylesheet"  type="text/css" href="<%=request.getContextPath()%>/resources/css/yellowcong.easyui.css"/>
<!-- 加载js -->
<script type="text/javascript">
$(function(){
	
	var projectName = $("#projectName").val();
	
	
	//通过自定义的插件快速生成表
	$(".user_list").datagrid({
		url:projectName +'/user/list',
		idField:"id",
		//rownumbers:true,
		columns:[
			{field:'id',title:'编号',width:50,hidden:false,checkbox:true},
			{field:'username',title:'用户名'},
			{field:'phone',title:'手机号'},
			{field:'email',title:'邮箱'},
			{field:'createDate',title:'创建日期'},
			{field:"isActive",title:"激活",formatter: function(value,row,index){
				if(value >0){
					//<span class="label label-danger">未激活</span>
					return '<span class="label label-success">激活</span>';
				}else{
					return '<span class="label label-danger">未激活</span>';
				}
			}}
		],
	});
	
	//设定search
	var menu=[{title:"男人",iconCls:"fa-search"},{title:"女人"},{title:"外星人",iconCls:"fa-cog"},];
	//查找的案例
	$(".table_search_menu").searchbox({prompt:"总有刁民想害朕",height:50,width:500,menu:menu});
	
	//文档的高度
	//console.log($(document).height());
	//console.log($(this).height());
	//console.log(document.documentElement.clientHeight  );	
	$.setDocHeight(this);
});
</script>
</head>
<body>
<div class="date_content">
	
	<input id="projectName" type="hidden" value="<%=request.getContextPath()%>"/>
	
	
	<div class="search_content">
		
		<div class="table_search_menu">
		</div>
		<!-- pull-right 就是float-left -->
		<div class="tb-group-actions pull-right">
			<span>10条被选中记录</span>
			<select name="" class=" form-control input_small input-sm ">
				<option value="">选择操作...</option>
				<option value="">删除</option>
				<option value="">拉黑</option>
				<option value="">激活</option>
			</select>		
			<button class="btn btn-search btn-danger"><i class="fa fa-check fa-fw"></i>提交</button>
		</div>
	</div>
	<!-- 表单中的类容 -->
	<div class="user_list">
	</div>
</div>
</body>
</html>