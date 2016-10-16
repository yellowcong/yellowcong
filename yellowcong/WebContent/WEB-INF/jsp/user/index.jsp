<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>yellowcongの网站</title>
<meta name="viewport" content="width=device-width,inittial-scale=1.0"></meta>
<!--[if lt IE 9]>
	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![end if]-->
<!-- bootstrap 的样式 -->
<link rel="stylesheet"  type="text/css" href="<%=request.getContextPath()%>/resources/css/bootstrap.css"/>
<link rel="stylesheet"  type="text/css" href="<%=request.getContextPath()%>/resources/css/yellowcong.easyui.css"/>
<link type="image/x-icon"
		href="<%=request.getContextPath()%>/resources/img/login/logo.jpg"
		rel="shortcut icon" />
		<!-- 字符的样式 -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/font/css/font-awesome.css" type="text/css" /> 

<!-- 加载js -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery.yellowcong.easyui.js"></script>
<!-- 加载js -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function(){
		var projectName = $("#pathNow").val();
		//定义一个navtop
		/**
		前台可可以定义
		*/
		$(".my_head").navTop({names:[{href:'#',title:'首页',select:true},
	             				{href:'#',title:'前端开发'},
	            				{href:'#',title:'后端开发'},
	            				{href:'#',title:'云计算'},
	            				{href:'#',title:'大数据'},
	            				{href:'#',title:'虚拟化'},
	            				{href:'#',title:'登录',tips:true},
	            				{href:projectName+'/jianli.jsp',title:'站长>>',tips:true}],
	            		logo:projectName+"/resources/img/login/logo.jpg",
	            		cname:"yellowcongの博客"});
		
		$(".nav_page_left").navPage2({
			
			title:"全部分类",
			//大的菜单名称,多级菜单 name访问的url
			menus:[{name:"个人主页",url:"#"},
					{name:"消息中心",url:"#"},
					{name:"我的关注",url:"#"}
			]
		});
		
		//脚步数据
	 	/*
	 		
	 	*/
	 	/* $(".my_foot").psgsFoot({
			
			infos:[
			  [{name:"关于yellowcong",url:"#",title:true},{name:"关于站长",url:"#"},{name:"联系站长",url:"#"},{name:"关于站长",url:"#"},{name:"关于站长",url:"#"}],
			  [{name:"网站服务",url:"#",title:true},{name:"关于站长",url:"#"},{name:"联系站长",url:"#"},{name:"关于站长",url:"#"},{name:"关于站长",url:"#"}],
			  [{name:"网站服务",url:"#",title:true},{name:"关于站长",url:"#"},{name:"联系站长",url:"#"},{name:"关于站长",url:"#"},{name:"关于站长",url:"#"}]
			],
			address:"黑龙江科技大学",
			company:"黑龙江科技大学",
			phone:"18604600631",
			email:"717350389@qq.com",
			codeImg:"/yellowcong/resources/img/qq_code.jpg"
		}); */
		
	});
</script>

<!-- 这个是中间数据显示样式 -->
<style type="text/css">
	body{
	}
	.nav_page_left{
		float: left;
		margin-top: 20px;
	}
	.nav_pages_right{
		margin-top:20px;
		margin-left: 20px;
		width: 770px;
		float:left;
	}
	/*整体类容的颜色*/
	.body_content{
		background: #eee;
		/*高度带回改*/
		height: 1000px;
	}
	/*用户显示的部分*/
	.user_info{
		margin-top:20px;
		background: #eee;
	}
	.user_head{
		float: left;
	}
	.user_head .user_img:HOVER{
		webkit-transform: rotateZ(360deg);
		-moz-transform: rotateZ(360deg);
		-o-transform: rotateZ(360deg);
		-ms-transform: rotateZ(360deg);
		transform: rotateZ(360deg);
		cursor: pointer;
	}
	
	.user_head .user_img{
		height: 150px;
		width: 150px;
		border-radius: 75px 75px 75px 75px;
		box-shadow: 3px 3px 3px rgba(0, 0, 0, 0.22);
		transition: all 1s ease-in-out 0s;
	}
	.user_date{
		float: left;
		margin-left: 20px;
	}
	.user_date_name{
		font-size: 20px;
		font-weight: bolder;
	}
	/*数据显示*/
	.user_date p{
		line-height: 20px;
	}
	.user_date a{
		text-decoration:  none;
		color:blue;
	}
	.user_date .user_date_other{
		color: gray;	
	}
	
	.user_option{
		float: right;
		height: 150px;
	}
	
	.user_option a{
		text-decoration: none;	
		line-height: 150px;
		text-align: center;
		color: #FFF;
	}
	
	.user_option a span{
		background: #35c4fd;
		padding:5px 10px 5px 10px;
	}
	
	.user_option a span:hover{
		background: #5A9EFA;
		transition: all 0.5s ease-in-out 0s;
	}
	
	/*用户里面的数据类容*/
	.user_content_date{
		height: 400px;
		margin-top:20px;
		background:#FFF;
		box-shadow: 3px 3px 3px rgba(0, 0, 0, 0.22);
	}
	
	.user_content_body{
		/* padding: 20px 20px 0px 20px; */
		width: 70%;
		float: left;
	}
	
	.user_content_body_right{
		float: left;
	}
	/*用户的菜单*/	
	.user_content_menu{
		height:48px;
		border-bottom: #CCC solid 1px;
	}
	
	.user_content_menu ul{
		padding-top:20px;
		list-style: none;
		padding-left:0px;
	}
	
	.user_content_menu ul li{
		list-style: none;
		float: left;
	}
	
	.user_content_menu ul li a{
		color: gray;
		text-align:center;
		text-decoration: none;
		margin-left: 30px;
		font-size: 15px;
		padding-bottom: 7px;
	}
	
	/*
	menu点击后的显示样式
	*/
	.user_content_menu ul li a:HOVER{
		color: #000;
		border-bottom: #000 solid 1px;
	}
	
	.user_content_menu ul li:HOVER{
			
	}
	
	
</style>

</head>
<body>
<input type="hidden" id="pathNow" value="<%=request.getContextPath()%>"/>	
<!-- 这个是我们的首页导航栏目 -->
<!-- 两种显示风格的后台都做出来 -->
<div class="my_head"></div>
<div class="body_content"><div class="container">
	<div class="user_info">
		<div class="user_head">
			<img class="user_img" src="<%=request.getContextPath() %>/resources/img/login/yellowcong.gif" />
		</div>
		<div class="user_date">
		
			<p><span class="user_date_name">yellowcong</span>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#"><i class="fa fa-edit fa-fw"></i>管理</a></p>
			<p><span class="user_date_other">TA害羞没有介绍自己</span></p>
			<p><span class="user_date_other">社区积分:2</span></p>
			<p><span class="user_date_other">关注:2</span></p>
			<p><span class="user_date_other">被关注:2</span></p>
		</div>
		<div class="user_option">
			<a href=""><span>写文章</span></a>
			<a href=""><span>提问题</span></a>
		</div>
	</div>
	<!-- 去掉左右飘动 -->
	<div style="clear: both;"></div>
	<!-- 用户中的内容 -->
	<div class="user_content_date">
		<div class="user_content_body">
			<div class="user_content_menu">
				<ul>
					<li><a href="#">&nbsp;&nbsp;动态&nbsp;&nbsp;</a></li>
					<li><a href="#">&nbsp;&nbsp;问答&nbsp;&nbsp;</a></li>
					<li><a href="#">&nbsp;&nbsp;评论&nbsp;&nbsp;</a></li>
					<li><a href="#">&nbsp;&nbsp;收藏&nbsp;&nbsp;</a></li>
					<li><a href="#">&nbsp;&nbsp;推送&nbsp;&nbsp;</a></li>
				</ul>	
			</div>
			<!-- 数据提示显示 -->			
			<div class="user_content_result">
				<!-- <ul>
					<li>
						<div></div>
					</li>
				</ul> -->
			</div>
		</div>	
		<div class="user_content_body_right">
			<div class="user_content_code">
				<div class="user_content_menu">
				<ul>
					<li><a href="#">动态</a></li>
				</ul>	
			</div>
			</div>
		</div>
	</div>
</div></div>
</body>
</html>
