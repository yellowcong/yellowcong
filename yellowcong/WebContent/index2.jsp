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
	src="<%=request.getContextPath()%>/resources/js/jquery.yellowcong.easyui.min.js"></script>
<!-- 
jquery.yellowcong.easyui.min.js
 -->
<!-- 加载js -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function(){
		var projectName = $("#pathNow").val();
		//定义一个navtop
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
		
		
		$(".nav_page_left").navPage({title:"全部分类",
		    //大的菜单名称
			menus:[{name:"前端开发",url:"#",
				//二级子标题
				   sub:[{name:"前端基础",url:"#",
					    //三级子标题
					   	sub:[
					   	     {name:"HTML",url:"#"},
				   	 		 {name:"CSS",url:"#"},
				   	 	 	 {name:"JavaScript",url:"#"},
					   	]},
					   	{name:"前端进阶",url:"#",
						    //三级子标题
						   	sub:[
						   	     {name:"jQuery",url:"#"},
					   	 		 {name:"BootStrap",url:"#"},
					   	 	 	 {name:"Ztree",url:"#"},
					   	 	 	 {name:"Three.js",url:"#"},
					   	 	 	 {name:"Raphael",url:"#"},
						   	 	 {name:"EasyUI",url:"#"},
						   	 	{name:"Extjs",url:"#"},
						   	]},
						   	{name:"前端进阶",url:"#",
							    //三级子标题
							   	sub:[
							   	     {name:"jQuery",url:"#"},
						   	 		 {name:"BootStrap",url:"#"},
						   	 	 	 {name:"Ztree",url:"#"},
						   	 	 	 {name:"Three.js",url:"#"},
						   	 	 	 {name:"Raphael",url:"#"},
							   	 	 {name:"EasyUI",url:"#"},
							   	 	{name:"Extjs",url:"#"},
							   	]},
					   	]},
				{name:"后端开发",url:"#",
							//二级子标题
							   sub:[{name:"后端基础",url:"#",
								    //三级子标题
								   	sub:[
								   	     {name:"Java",url:"#"},
							   	 		 {name:"Python",url:"#"},
							   	 	 	 {name:"Nodejs",url:"#"},
								   	]},
								   	{name:"后端进阶",url:"#",
									    //三级子标题
									   	sub:[
									   	     {name:"Mysql",url:"#"},
								   	 		 {name:"Hibernate",url:"#"},
								   	 		 {name:"Mybatis",url:"#"},
								   	 	 	 {name:"JavaWeb",url:"#"},
								   	 	 	 {name:"Struts1.x",url:"#"},
								   	 	 	 {name:"Struts2.x",url:"#"},
								   	 		 {name:"SpringMVC",url:"#"},
								   	 		 {name:"Spring",url:"#"},
									   	]},
									   	{name:"后端高级",url:"#",
										    //三级子标题
										   	sub:[
										   	     {name:"Luence",url:"#"},
									   	 		 {name:"Hadoop",url:"#"},
									   	 		 {name:"WebService",url:"#"},
									   	 	 	 {name:"Moongodb",url:"#"},
									   	 	 	 {name:"Redos",url:"#"},
									   	 		 {name:"Memcache",url:"#"},
									   	 		 {name:"Git",url:"#"},
									   	 		 {name:"Maven",url:"#"},
										   	]}
								   	]},
								   	{name:"云计算",url:"#",
										//二级子标题
										   sub:[{name:"前端基础",url:"#",
											    //三级子标题
											   	sub:[
											   	     {name:"HTML",url:"#"},
										   	 		 {name:"CSS",url:"#"},
										   	 	 	 {name:"JavaScript",url:"#"},
											   	]}]
								   	},
									{name:"大数据",url:"#",
										//二级子标题
										   sub:[{name:"前端基础",url:"#",
											    //三级子标题
											   	sub:[
											   	     {name:"HTML",url:"#"},
										   	 		 {name:"CSS",url:"#"},
										   	 	 	 {name:"JavaScript",url:"#"},
											   	]}]
								   	},
								   	{name:"虚拟化",url:"#",
										//二级子标题
										   sub:[{name:"前端基础",url:"#",
											    //三级子标题
											   	sub:[
											   	     {name:"Openstack",url:"#"},
										   	 		 {name:"Docker",url:"#"},
										   	 	 	 {name:"虚拟机",url:"#"},
											   	]}]
								   	},
								   	{name:"讨论",url:"#",
										//二级子标题
										   sub:[{name:"前端基础",url:"#",
											    //三级子标题
											   	sub:[
											   	     {name:"Openstack",url:"#"},
										   	 		 {name:"Docker",url:"#"},
										   	 	 	 {name:"虚拟机",url:"#"},
											   	]}]
								   	},
									{name:"关于",url:"#",
										//二级子标题
										   sub:[{name:"前端基础",url:"#",
											    //三级子标题
											   	sub:[
											   	     {name:"Openstack",url:"#"},
										   	 		 {name:"Docker",url:"#"},
										   	 	 	 {name:"虚拟机",url:"#"},
											   	]}]
								   	},
					   	
					   	
			]
			});
	});
</script>

<style type="text/css">
	body{
		height: 1000px;
	}
	.nav_page_left{
		float: left;
	}
	.nav_pages_right{
		margin-top:20px;
		margin-left: 20px;
		width: 770px;
		float:left;
	}
	.nav_page_left{
		margin-top: 20px;
		
	}
	.wrap_content{
		box-sizing: content-box;
		height: 36px;
		border: 1px solid #e4e4e4;
		background: #f5f5f5;
		color: #666;
		line-height: 36px;
	}
	.wrap_info{
		background: #FFF;
		font-size: 12px;
		font-weight: 400;
		float:left;
		cursor: default;
		line-height: 36px;
		padding-left:30px;
		padding-right:30px;
		display: inline-block;
		/* border-right: 1px solid #e4e4e4; */
	}
	
	.wrap_select_options{
		float: left;
		height: 36px;
	}
	.wrap_select_options dl{
		list-style: none;
		margin-top: 0px;
		padding-left: 0px;
		float: left;
		position: relative;
	}
	
	.wrap_select_options dl dt{
		list-style: none;
		margin-top: 0px;
		padding-left: 0px;
		line-height:36px;
		text-align:center;
		display:inherit;
		padding-left:20px;
		padding-right:20px;
		border-right: 1px solid #f5f5f5;
		border-left: 1px solid #f5f5f5;
		float:left;
		font-weight: 400;
	}
	.wrap_select_options .optioins_first dt{
		border-left: 1px solid #e4e4e4;
	}
	.wrap_select_options dl dt:HOVER {
		cursor: default;
		background: #fff;
		border-right: 1px solid #e4e4e4;
		border-left: 1px solid #e4e4e4;
	}
	
	/*子菜单*/
	.wrap_select_options dl dd{
		position:absolute;
		text-align: center;
		display: none;
		background: #fff;
		
	}
	
	.wrap_select_options dl dd a{
		text-decoration: none;
		display:block;
		color: #666;
	}
	
	.wrap_select_options dl dd a:hover{
		color: #35b558;
	}
	
	.wrap_select_options_hover{
		margin-top:36px;
		padding-top:10px;
		border-left:1px solid #e4e4e4;
		border-bottom:1px solid #e4e4e4;
		border-right:1px solid #e4e4e4;
		z-index: 100;
	}
	/*左边显示效果*/
	.wrap_select_style{
		float: right;
	}
	.wrap_select_style ul{
		list-style: none;
		padding-left: 0px;
	}
	.wrap_select_style ul li{
		list-style: none;
		margin-top:0px;
		padding-left: 0px;
		font-size:16px;
		float: left;
		border-left: 1px solid #e4e4e4;
		color: #999999;
	}
	.wrap_select_style ul li i{
		width:36px;
	}
	.wrap_select_style ul li:HOVER {
		cursor: pointer	;	
		background: #FFF;
	}
	.nav_pages_listbox{
	}
	/*列表显示数据*/
	.nav_pages_listbox ul{
	 list-style: none;
	 margin-left: 0px;
	 padding-left: 0px;
	}
	/*设定我们的nav的边框*/
	.nav_pages_listbox ul li{
		 list-style: none;
		 margin-left: 0px;
		 padding-left: 0px;
		 width:240px;
		 height:220px;
		 /*设定边框*/
		webkit-box-shadow: 2px 2px 4px rgba(0,0,0,.1);
		-moz-box-shadow: 2px 2px 4px rgba(0,0,0,.1);
		box-shadow: 1px 2px 4px rgba(0,0,0,.1);
		border: 1px solid #e4e4e4;
		float: left;
		margin-right: 16px;
		margin-top: 18px;
		position: relative;
	}
	
	/*显示我们的数据，添加点击到上面有一种缓慢变化的效果*/
	.listbox_img{
		position: relative;
		z-index: 10;
	}
	
	.listbox_img .listbox_see{
		position: absolute;
		background: #000;
		background: rgba(0,0,0,.4);
		width: 100%;
		height: 100%;
		z-index: 100;
		position: absolute;
		left: 0;
		top: 0;
		opacity: 0;
		transition: all 0.6s ease 0s;
	}
	.list_img_info{
		width: 238px;
		height: 129px;
	}
	.nav_pages_listbox .listbox_img  i{
		width: 100%;
		height: 100%;
		padding-top: 45px;
	}
	.nav_pages_listbox .listbox_img a:hover{
		color: #EEE;
		/*#35b558*/
	}
	
	.lesson-info-h2, .lesson-list .lesson-infor h5 {
	    font-size: 14px;
	    color: #333;
	    line-height: 18px;
	    margin-bottom: 12px;
	    height: 36px;
	    overflow: hidden;
	}
	.listbox_info a{
		color: #000;
		text-decoration: none;
	}
	.listbox_info .lesson-info-h2 a:hover{
		color:#35b558;
	}
	
	.listbox_info{
		margin-top:-10px;
		padding-left: 5px;
		padding-right: 5px;
		color:gray;
	}
	.listbox_info .listbox_info_desc{
		display: none;
	}
	
	.listbox_info .listbox_info_desc span{
		cursor: default;
	}
	
	/*设定选中后的显示效果*/
	.listbox_info .listbox_info_desc span::selection{
		background:#35b558;
			color: #FFF;
	}
	.listbox_info .listbox_info_desc span::-moz-selection {
		background:#35b558;
		color: #FFF;
	}
	
</style>

<script type="text/javascript">
	$(function(){
		
		//设定横向导航栏显示效果
		$(".wrap_select_options dl").hover(function(){
			//$(this).find("dd").css({"padding-top":"40px","display":"block","border-left":"1px solid #e4e4e4","border-bottom":"1px solid #e4e4e4","border-right":"1px solid #e4e4e4"});
			//对于多个显示的数据先显示了，然后再添加class
			$(this).find("dd").show().addClass("wrap_select_options_hover");
			var width = $(this).width();
			$(this).find("dd").css("width",width);
			$(this).find(".optioins_head").css("background","#fff");
		},function(){
			$(this).find("dd").hide();
			$(this).find(".optioins_head").css("background","#f5f5f5");
		});
		
		
		//设定我们的点击的显示的效果，透明
		//opacity: 1;
		//设定显示数据
		 $(".nav_pages_listbox li").hover(function(){
			$(this).find(".listbox_see").show("slow").css("opacity","1");
		},function(){
			$(this).find(".listbox_see").css("opacity","0");
		}); 
		
		//大小变化操作
		$(".nav_pages_listbox li").hover(function(){
			//显示我们的desc
			$(this).find(".listbox_info_desc").show();
			//box-shadow: 1px 2px 4px rgba(0,0,0,.1);
			//$(".listbox_info")
			//listbox_info
			//
			$(this).find(".listbox_info").css({"z-index":"100","position":"relative","height":"200px","border":"1px solid #e4e4e4","background":"#FFF"});
		},function(){
			$(this).find(".listbox_info_desc").hide();
			//{"z-index":"100","position":"relative","height":"200px","border":"1px solid #e4e4e4","background":"#FFF"}
		    $(this).find(".listbox_info").css({"z-index":"10","position":"relative","height":"20px","border":"none",});
		});
		
		
		//赞的点击
		$(".listbox_zhan").hover(function(){
			$(this).find("i").removeClass("fa-thumbs-o-up").addClass("fa-thumbs-up");
		},function(){
			$(this).find("i").removeClass("fa-thumbs-up").addClass("fa-thumbs-o-up");
		});
		$(".listbox_down").hover(function(){
			$(this).find("i").removeClass("fa-thumbs-o-down").addClass("fa-thumbs-down");
		},function(){
			$(this).find("i").removeClass("fa-thumbs-down").addClass("fa-thumbs-o-down");
		});
		
		
		
	});
</script>
</head>
<body>
<input type="hidden" id="pathNow" value="<%=request.getContextPath()%>"/>	
<!-- 这个是我们的首页导航栏目 -->
<div class="my_head"></div>
<div class="container">
	<div class="nav_page_demo">
	</div>
<div class="nav_page_left"></div>

<div class="nav_pages_right">
	<div class="wrap_content">
		<div class="wrap_info">
			<span>移动开发</span>
		</div>
		<div class="wrap_select_options">
			<dl class="optioins_first">
				<dt class="optioins_head">最新<i class="fa fa-angle-down fa-fw"></i></dt>
				<dd>
					<p><a href="#">最新<i>&nbsp;&nbsp;&nbsp;&nbsp;</i></a></p>
					<p><a href="#">最热<i>&nbsp;&nbsp;&nbsp;&nbsp;</i></a></p>
				</dd>
			</dl>
			<dl>
				<dt class="optioins_head">查看次数<i class="fa fa-angle-down fa-fw"></i></dt>
				<dd>
					<p><a href="#">查看最多<i>&nbsp;&nbsp;&nbsp;&nbsp;</i></a></p>
					<p><a href="#">评论最多<i>&nbsp;&nbsp;&nbsp;&nbsp;</i></a></p>
				</dd>
			</dl>
			<dl>
				<dt class="optioins_head">评分<i class="fa fa-angle-down fa-fw"></i></dt>
				<dd>
					<p><a href="#">查看最多</a></p>
					<p><a href="#">评论最多</a></p>
				</dd>
			</dl>
		</div>
		<div class="wrap_select_style">
			<ul>
				<li><i class="fa fa-th-large fa-fw"></i></li>
				<li><i class="fa  fa-th-list  fa-fw"></i></li>
			</ul>
		</div>
	</div>
	<div style="clear: both;"></div>
	<!-- 显示列表 -->
	<div class="nav_pages_listbox">
		<!-- 240*220 -->
		<div>
			<ul>
			<li>
				<div class="listbox_img">
				<a href="">
					<img class="list_img_info" src="<%=request.getContextPath() %>/resources/img/demo/56eb5e43e9b52.jpg"  />
					<div class="listbox_see"><i class="fa fa-play-circle-o fa-fw" style="font-size: 40px;"></i></div>
				</a>
				</div>			
				<div class="listbox_info">
						<h2 class="lesson-info-h2"><a href="#">绘制专业的产品原型应用示例：猿题库 App 产品原型设计</a></h2>
						<div class="listbox_info_desc">
							<span>本课程通过猿题库产品原型设计，来讲解如何绘制专业的产品原型设计，如何绘制好专业的产品原型，如何写好产品原型的</span>
							<br/><span><i class="fa fa-user fa-fw"></i>admin</span>
							<span class="listbox_zhan"><i class="fa fa-thumbs-o-up fa-fw"></i>2000</span>
							<span class="listbox_down"><i class="fa fa-thumbs-o-down fa-fw"></i>2000</span>
							
						</div>
						<div><span><i class="fa fa-clock-o fa-fw"></i>2015-10-12</span>
							<span><i class="fa fa-eye fa-fw"></i>2015</span>
							<span style="float: right"><i class="fa fa-comments fa-fw"></i>20</span>
						</div>
				</div>
			</li>
			<li>
				<div class="listbox_img">
				<a href="">
					<img class="list_img_info" src="<%=request.getContextPath() %>/resources/img/demo/56eb5e43e9b52.jpg"  />
					<div class="listbox_see"><i class="fa fa-play-circle-o fa-fw" style="font-size: 40px;"></i></div>
				</a>
				</div>			
				<div class="listbox_info">
						<h2 class="lesson-info-h2"><a href="#">绘制专业的产品原型应用示例：猿题库 App 产品原型设计</a></h2>
						<div class="listbox_info_desc">
							<span>本课程通过猿题库产品原型设计，来讲解如何绘制专业的产品原型设计，如何绘制好专业的产品原型，如何写好产品原型的</span>
							<br/><span><i class="fa fa-user fa-fw"></i>admin</span>
							<span class="listbox_zhan"><i class="fa fa-thumbs-o-up fa-fw"></i>2000</span>
							<span class="listbox_down"><i class="fa fa-thumbs-o-down fa-fw"></i>2000</span>
							
						</div>
						<div><span><i class="fa fa-clock-o fa-fw"></i>2015-10-12</span>
							<span><i class="fa fa-eye fa-fw"></i>2015</span>
							<span style="float: right"><i class="fa fa-comments fa-fw"></i>20</span>
						</div>
				</div>
			</li>
			<li>
				<div class="listbox_img">
				<a href="">
					<img class="list_img_info" src="<%=request.getContextPath() %>/resources/img/demo/56eb5e43e9b52.jpg"  />
					<div class="listbox_see"><i class="fa fa-play-circle-o fa-fw" style="font-size: 40px;"></i></div>
				</a>
				</div>			
				<div class="listbox_info">
						<h2 class="lesson-info-h2"><a href="#">绘制专业的产品原型应用示例：猿题库 App 产品原型设计</a></h2>
						<div class="listbox_info_desc">
							<span>本课程通过猿题库产品原型设计，来讲解如何绘制专业的产品原型设计，如何绘制好专业的产品原型，如何写好产品原型的</span>
							<br/><span><i class="fa fa-user fa-fw"></i>admin</span>
							<span class="listbox_zhan"><i class="fa fa-thumbs-o-up fa-fw"></i>2000</span>
							<span class="listbox_down"><i class="fa fa-thumbs-o-down fa-fw"></i>2000</span>
							
						</div>
						<div><span><i class="fa fa-clock-o fa-fw"></i>2015-10-12</span>
							<span><i class="fa fa-eye fa-fw"></i>2015</span>
							<span style="float: right"><i class="fa fa-comments fa-fw"></i>20</span>
						</div>
				</div>
			</li>
			<li>
				<div class="listbox_img">
				<a href="">
					<img class="list_img_info" src="<%=request.getContextPath() %>/resources/img/demo/56eb5e43e9b52.jpg"  />
					<div class="listbox_see"><i class="fa fa-play-circle-o fa-fw" style="font-size: 40px;"></i></div>
				</a>
				</div>			
				<div class="listbox_info">
						<h2 class="lesson-info-h2"><a href="#">绘制专业的产品原型应用示例：猿题库 App 产品原型设计</a></h2>
						<div class="listbox_info_desc">
							<span>本课程通过猿题库产品原型设计，来讲解如何绘制专业的产品原型设计，如何绘制好专业的产品原型，如何写好产品原型的</span>
							<br/><span><i class="fa fa-user fa-fw"></i>admin</span>
							<span class="listbox_zhan"><i class="fa fa-thumbs-o-up fa-fw"></i>2000</span>
							<span class="listbox_down"><i class="fa fa-thumbs-o-down fa-fw"></i>2000</span>
							
						</div>
						<div><span><i class="fa fa-clock-o fa-fw"></i>2015-10-12</span>
							<span><i class="fa fa-eye fa-fw"></i>2015</span>
							<span style="float: right"><i class="fa fa-comments fa-fw"></i>20</span>
						</div>
				</div>
			</li>
			<li>
				<div class="listbox_img">
				<a href="">
					<img class="list_img_info" src="<%=request.getContextPath() %>/resources/img/demo/56eb5e43e9b52.jpg"  />
					<div class="listbox_see"><i class="fa fa-play-circle-o fa-fw" style="font-size: 40px;"></i></div>
				</a>
				</div>			
				<div class="listbox_info">
						<h2 class="lesson-info-h2"><a href="#">绘制专业的产品原型应用示例：猿题库 App 产品原型设计</a></h2>
						<div class="listbox_info_desc">
							<span>本课程通过猿题库产品原型设计，来讲解如何绘制专业的产品原型设计，如何绘制好专业的产品原型，如何写好产品原型的</span>
							<br/><span><i class="fa fa-user fa-fw"></i>admin</span>
							<span class="listbox_zhan"><i class="fa fa-thumbs-o-up fa-fw"></i>2000</span>
							<span class="listbox_down"><i class="fa fa-thumbs-o-down fa-fw"></i>2000</span>
							
						</div>
						<div><span><i class="fa fa-clock-o fa-fw"></i>2015-10-12</span>
							<span><i class="fa fa-eye fa-fw"></i>2015</span>
							<span style="float: right"><i class="fa fa-comments fa-fw"></i>20</span>
						</div>
				</div>
			</li>
			<li>
				<div class="listbox_img">
				<a href="">
					<img class="list_img_info" src="<%=request.getContextPath() %>/resources/img/demo/56eb5e43e9b52.jpg"  />
					<div class="listbox_see"><i class="fa fa-play-circle-o fa-fw" style="font-size: 40px;"></i></div>
				</a>
				</div>			
				<div class="listbox_info">
						<h2 class="lesson-info-h2"><a href="#">绘制专业的产品原型应用示例：猿题库 App 产品原型设计</a></h2>
						<div class="listbox_info_desc">
							<span>本课程通过猿题库产品原型设计，来讲解如何绘制专业的产品原型设计，如何绘制好专业的产品原型，如何写好产品原型的</span>
							<br/><span><i class="fa fa-user fa-fw"></i>admin</span>
							<span class="listbox_zhan"><i class="fa fa-thumbs-o-up fa-fw"></i>2000</span>
							<span class="listbox_down"><i class="fa fa-thumbs-o-down fa-fw"></i>2000</span>
							
						</div>
						<div><span><i class="fa fa-clock-o fa-fw"></i>2015-10-12</span>
							<span><i class="fa fa-eye fa-fw"></i>2015</span>
							<span style="float: right"><i class="fa fa-comments fa-fw"></i>20</span>
						</div>
				</div>
			</li>
			<li>
				<div class="listbox_img">
				<a href="">
					<img class="list_img_info" src="<%=request.getContextPath() %>/resources/img/demo/56eb5e43e9b52.jpg"  />
					<div class="listbox_see"><i class="fa fa-play-circle-o fa-fw" style="font-size: 40px;"></i></div>
				</a>
				</div>			
				<div class="listbox_info">
						<h2 class="lesson-info-h2"><a href="#">绘制专业的产品原型应用示例：猿题库 App 产品原型设计</a></h2>
						<div class="listbox_info_desc">
							<span>本课程通过猿题库产品原型设计，来讲解如何绘制专业的产品原型设计，如何绘制好专业的产品原型，如何写好产品原型的</span>
							<br/><span><i class="fa fa-user fa-fw"></i>admin</span>
							<span class="listbox_zhan"><i class="fa fa-thumbs-o-up fa-fw"></i>2000</span>
							<span class="listbox_down"><i class="fa fa-thumbs-o-down fa-fw"></i>2000</span>
							
						</div>
						<div><span><i class="fa fa-clock-o fa-fw"></i>2015-10-12</span>
							<span><i class="fa fa-eye fa-fw"></i>2015</span>
							<span style="float: right"><i class="fa fa-comments fa-fw"></i>20</span>
						</div>
				</div>
			</li>
			<li>
				<div class="listbox_img">
				<a href="">
					<img class="list_img_info" src="<%=request.getContextPath() %>/resources/img/demo/56eb5e43e9b52.jpg"  />
					<div class="listbox_see"><i class="fa fa-play-circle-o fa-fw" style="font-size: 40px;"></i></div>
				</a>
				</div>			
				<div class="listbox_info">
						<h2 class="lesson-info-h2"><a href="#">绘制专业的产品原型应用示例：猿题库 App 产品原型设计</a></h2>
						<div class="listbox_info_desc">
							<span>本课程通过猿题库产品原型设计，来讲解如何绘制专业的产品原型设计，如何绘制好专业的产品原型，如何写好产品原型的</span>
							<br/><span><i class="fa fa-user fa-fw"></i>admin</span>
							<span class="listbox_zhan"><i class="fa fa-thumbs-o-up fa-fw"></i>2000</span>
							<span class="listbox_down"><i class="fa fa-thumbs-o-down fa-fw"></i>2000</span>
							
						</div>
						<div><span><i class="fa fa-clock-o fa-fw"></i>2015-10-12</span>
							<span><i class="fa fa-eye fa-fw"></i>2015</span>
							<span style="float: right"><i class="fa fa-comments fa-fw"></i>20</span>
						</div>
				</div>
			</li>
			<li>
				<div class="listbox_img">
				<a href="">
					<img class="list_img_info" src="<%=request.getContextPath() %>/resources/img/demo/56eb5e43e9b52.jpg"  />
					<div class="listbox_see"><i class="fa fa-play-circle-o fa-fw" style="font-size: 40px;"></i></div>
				</a>
				</div>			
				<div class="listbox_info">
						<h2 class="lesson-info-h2"><a href="#">绘制专业的产品原型应用示例：猿题库 App 产品原型设计</a></h2>
						<div class="listbox_info_desc">
							<span>本课程通过猿题库产品原型设计，来讲解如何绘制专业的产品原型设计，如何绘制好专业的产品原型，如何写好产品原型的</span>
							<br/><span><i class="fa fa-user fa-fw"></i>admin</span>
							<span class="listbox_zhan"><i class="fa fa-thumbs-o-up fa-fw"></i>2000</span>
							<span class="listbox_down"><i class="fa fa-thumbs-o-down fa-fw"></i>2000</span>
							
						</div>
						<div><span><i class="fa fa-clock-o fa-fw"></i>2015-10-12</span>
							<span><i class="fa fa-eye fa-fw"></i>2015</span>
							<span style="float: right"><i class="fa fa-comments fa-fw"></i>20</span>
						</div>
				</div>
			</li>
			<li>
				<div class="listbox_img">
				<a href="">
					<img class="list_img_info" src="<%=request.getContextPath() %>/resources/img/demo/56eb5e43e9b52.jpg"  />
					<div class="listbox_see"><i class="fa fa-play-circle-o fa-fw" style="font-size: 40px;"></i></div>
				</a>
				</div>			
				<div class="listbox_info">
						<h2 class="lesson-info-h2"><a href="#">绘制专业的产品原型应用示例：猿题库 App 产品原型设计</a></h2>
						<div class="listbox_info_desc">
							<span>本课程通过猿题库产品原型设计，来讲解如何绘制专业的产品原型设计，如何绘制好专业的产品原型，如何写好产品原型的</span>
							<br/><span><i class="fa fa-user fa-fw"></i>admin</span>
							<span class="listbox_zhan"><i class="fa fa-thumbs-o-up fa-fw"></i>2000</span>
							<span class="listbox_down"><i class="fa fa-thumbs-o-down fa-fw"></i>2000</span>
							
						</div>
						<div><span><i class="fa fa-clock-o fa-fw"></i>2015-10-12</span>
							<span><i class="fa fa-eye fa-fw"></i>2015</span>
							<span style="float: right"><i class="fa fa-comments fa-fw"></i>20</span>
						</div>
				</div>
			</li>
			<li>
				<div class="listbox_img">
				<a href="">
					<img class="list_img_info" src="<%=request.getContextPath() %>/resources/img/demo/56eb5e43e9b52.jpg"  />
					<div class="listbox_see"><i class="fa fa-play-circle-o fa-fw" style="font-size: 40px;"></i></div>
				</a>
				</div>			
				<div class="listbox_info">
						<h2 class="lesson-info-h2"><a href="#">绘制专业的产品原型应用示例：猿题库 App 产品原型设计</a></h2>
						<div class="listbox_info_desc">
							<span>本课程通过猿题库产品原型设计，来讲解如何绘制专业的产品原型设计，如何绘制好专业的产品原型，如何写好产品原型的</span>
							<br/><span><i class="fa fa-user fa-fw"></i>admin</span>
							<span class="listbox_zhan"><i class="fa fa-thumbs-o-up fa-fw"></i>2000</span>
							<span class="listbox_down"><i class="fa fa-thumbs-o-down fa-fw"></i>2000</span>
							
						</div>
						<div><span><i class="fa fa-clock-o fa-fw"></i>2015-10-12</span>
							<span><i class="fa fa-eye fa-fw"></i>2015</span>
							<span style="float: right"><i class="fa fa-comments fa-fw"></i>20</span>
						</div>
				</div>
			</li>
		</ul>
		</div>
	</div>
</div>
</div>
</body>
</html>
