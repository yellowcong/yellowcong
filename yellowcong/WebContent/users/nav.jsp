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
	
	<%-- <script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery.yellowcong.easyui.js"></script>
	 --%>
<!-- bootstrap 的样式 -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/bootstrap.css" />

<!-- 加载js -->
<script type="text/javascript">
$(function(){
	
	var projectName = $("#projectName").val();
	
	
});
</script>
</head>
<body>
<div class="date_content">
	
	<input id="projectName" type="hidden" value="<%=request.getContextPath()%>"/>
	nav数据
	<div class="container">
		<h1 class="page-header">Bootstrap<small>选项卡</small></h1>
		
		<!--
		
		nav-tabs 设定数据显示是以选项卡显示
		nav-stacked 将数据，像堆栈一样显示
		nav-pills 将数据以堆栈的方式显示，但是没有框
		-->
		<ul class="nav nav-tabs" class="">
			<li class="active"><a href="#tab1" data-toggle="tab">Java</a></li>
			<li><a href="#tab2" data-toggle="tab">English</a></li>
			<li><a href="#tab3" data-toggle="tab">Wife</a></li>
		</ul>
		<!--
		通过添加fade来添加事件效果
		-->
		<div class="tab-content">
			<div class="tab-pane active fade in" id="tab1"><p>Java 是我们必须学习的</p></div>
			<div class="tab-pane fade " id="tab2"><p>English 必须过8级</p></div>
			<div class="tab-pane fade" id="tab3"><p>外国老婆是必须滴</p></div>
		</div>
	 </div>
</body>
</html>