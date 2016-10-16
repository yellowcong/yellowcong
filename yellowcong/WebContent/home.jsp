<%--
	测试我们的navs编写,我们的 以前写的那个插件可以作废了
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- bootstrap 的样式 -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/bootstrap.css" />
<!-- 字符的样式 -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/font/css/font-awesome.css"
	type="text/css" />
<!-- 网站的样式 -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/style.css"
	type="text/css" />

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/yellowcong.easyui.css"
	type="text/css" />

<!-- 设定图标 -->
<link type="image/x-icon"
	href="<%=request.getContextPath()%>/resources/img/login/logo.jpg"
	rel="shortcut icon" />


<!-- 加载js -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery-1.10.2.min.js"></script>
<%-- <script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery.nanoscroller.min.js"></script --%>>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/yellowcong.all.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery.yellowcong.easyui.js"></script>

<script type="text/javascript">
	$(function() {
		//隐藏我们的 标签头的方法
		//其中传入的参数有{hideElement,speed}
		$("#news-ticker-close").hideInfo();

		//显示栏目
		//$(".nav_list_navs a").showNav();
		$("body").rsetIframe();
		$(".nav_left_my").navs({
			menu:[{href:'',iconCls:'fa-user ',title:'我的信息',subMenu:[{iconCls:"fa-envelope-o ",title:"最新消息",href:""}]},
			      {href:'',iconCls:'fa-users ',title:'用户管理',subMenu:[{iconCls:"fa-edit ",title:"用户编辑",href:""},{iconCls:"fa-edit ",title:"用户组管理",href:""},{iconCls:"fa-rocket ",title:"权限管理",href:""},{iconCls:"fa-tachometer ",title:"用户分析",href:""},]},
			      {href:'',iconCls:'fa-tasks ',title:'栏目管理',},
			      {href:'',iconCls:'fa-file-text-o ',title:'文章管理',},
			      {href:'',iconCls:'fa-file-o ',title:'日记管理',},
			      {href:'',iconCls:'fa-cloud ',title:'天气管理',},
			      {href:'',iconCls:'fa-question ',title:'问卷管理',},
			      {href:'',iconCls:'fa-comments-o ',title:'聊天机器人',},
			      {href:'',iconCls:'fa-desktop ',title:'文档在线',},
			      {href:'',iconCls:'fa-search ',title:'搜索分析',},
			      {href:'',iconCls:'fa-picture-o ',title:'相册管理',},
			      {href:'',iconCls:'fa-picture-o ',title:'图片工具',},
			      {href:'',iconCls:'fa-picture-o ',title:'文档工具',},
			      {href:'',iconCls:'fa-music ',title:'音乐管理',},
			      {href:'',iconCls:'fa-play-circle-o ',title:'视屏管理',},
			      {href:'',iconCls:'fa-play-circle-o ',title:'数据字典',},
			      {href:'',iconCls:'fa-file ',title:'文件管理',},
			      {href:'',iconCls:'fa-code ',title:'代码仓库',},
			      {href:'',iconCls:'fa-envelope-o ',title:'每周邮件',},
			      {href:'',iconCls:'fa-weixin ',title:'微信推送',},
			      {href:'',iconCls:'fa-globe ',title:'接口管理',},
			      {href:'',iconCls:'fa-money ',title:'支付管理',},
			      {href:'',iconCls:'fa-database ',title:'数据分析',},
			      {href:'',iconCls:'fa-gears  ',title:'网站设置',
			    	  subMenu:[
			    	      {iconCls:"fa-envelope-o ",title:"网站建议",href:""},
			    	      {iconCls:"fa-tachometer ",title:"流量分析",href:""},
			    	      {iconCls:"fa-bug ",title:"网站错误",href:""},
			    	      {iconCls:"fa-refresh ",title:"更新历史",href:""},
			    	      {iconCls:"fa-info ",title:"网站信息",href:""},
			    	      {iconCls:"fa-qrcode ",title:"网站二维码",href:""}]
			      }]
		});
	});
</script>
<title>我的首页</title>

<style type="text/css">

</style>

</head>
<body>
	<div>
		<!-- 消息提醒 -->
		<div class="news_ticker bg_orange">
			<div class="container">
				<ul id="news-ticker-content" class="list-unstyled mbn">
					<li><a href='http://yellowcong.com/' target='_blank'>This
							is HTML app version of this template. To see Angular app version,
							please click here</a></li>
				</ul>
				<a id="news-ticker-close" href="javascript:;"><i
					class="fa fa-times"></i></a>
			</div>
		</div>
		<!-- 导航栏 -->
		<div class="head_navbar">
			<!-- logo -->
			<div class="navbar_logo">
				<a href=" "><span>yellowcong</span></a>
			</div>
			<div class="navbar_main">
				xx
				<!-- 菜单缩放 -->
				<a class="head_navbar_menu" href=""> <i class="fa fa-bars"></i>
				</a>
				<!-- 搜索菜单 -->
				<a class="head_navbar_menu" href=""> <i class="fa fa-search"></i>
				</a>
			</div>

			<!-- 用户退出等 的 右边菜单了 -->
			<div class="head_nav_right">
				<!-- 右边的菜单数据了 -->
				<ul class="head_navbar_right">
					<li><a class="head_navbar_menu" href=""> <i
							class="fa fa-bell fa-fw"></i></a></li>
					<li><a class="head_navbar_menu" href=""> <i
							class="fa fa-envelope fa-fw"></i></a></li>
					<li><a class="head_navbar_menu" href=""> <i
							class="fa fa-cog"></i> <span class="count">6</span>

					</a></li>
					<li><a class="head_navbar_menu" href=""> <img
							src="<%=request.getContextPath()%>/resources/img/login/head.jpg" />
							<span>yellowcong</span> <span class="caret"></span>
					</a></li>
					<li><a class="head_navbar_menu" href=""> <i
							class="fa fa-power-off"></i></a></li>
				</ul>
			</div>
		</div>
		<div class="content_body">
			<!-- 左边工具栏 -->
			<div class="content_nav_left_content">
				<div class="content_nav_left">
					<div class="nav_left_user">
						<img
							src="<%=request.getContextPath()%>/resources/img/login/head.jpg">
						<div class="nav_left_user_statu">
							<span>yellowcong</span><br /> <span class="statu_icon"><i
								class="fa fa-circle"></i></span><span class="statu_info">在线</span>
						</div>
					</div>
					<div class="nav_left_my">
					</div>
					<!-- <div class="nano-pane" style="opacity: 1; visibility: visible;">
						<div class="nano-slider"
							style="height: 50px; transform: translate(0px, 0px);"></div>
					</div> -->
				</div>
			</div>
			<!-- 右边数据显示 -->
			<div class="content_body_right">
				<!-- 顶部导航栏  -->
				<div class="content_nav">
					<span><i class="fa fa-edit"></i>用户编辑</span>
					<ul class="content_navs_list">
						<li><i class="fa fa-home"></i> <a href="">主页</a> <i
							class="fa fa-angle-right"></i></li>
						<li><a href="">人员管理</a> <i class="fa fa-angle-right"></i></li>
						<li><a href="">用户编辑</a></li>
					</ul>
				</div>
				<!-- 顶部导航栏结束 -->
				<div class="content_bodys">
				<%-- 	<iframe src="<%=request.getContextPath()%>/users/list.jsp"
						class="iframe_conent" id="iframe_content"  ></iframe>
				 --%>
				  	<iframe src="<%=request.getContextPath()%>/users/list.jsp"
						class="iframe_conent" id="iframe_content"  ></iframe>
				 </div>
			</div>
		</div>
	</div>
</body>
</html>