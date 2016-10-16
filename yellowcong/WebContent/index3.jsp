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

<!-- 这个是中间数据显示样式 -->
<style type="text/css">
	body{
		height: 1000px;
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
	
</style>

<script type="text/javascript">



	$(function(){
	 	$(".nav_pages_right").psgsShow({
			//导航栏目菜单
			navsMenu:{title:"移动开发",
					navs:[[{name:"最新",url:"#",select:true},{name:"最热",url:"#"}],
                          [{name:"查看次数",url:"#",select:true},{name:"查看最多",url:"#"},{name:"查看最多",url:"#"}],
                          [{name:"评分",url:"#",select:true},{name:"查看最多",url:"#"},{name:"评论最多",url:"#"}],
                    ]},
                    //文章 psgUrl是路径， title 是日期，imgUrl是图片地址，date是日期， see 查看次数  useranme 名称  disc描述  good 好  bad 差
			 psgs:[{psgUrl:"#",title:"绘制专业的产品原型应用示例：猿题库 App 产品原型设计",imgUrl:"/yellowcong/resources/img/demo/56eb5e43e9b52.jpg",date:"2016-10-10",see:100,username:"yellowcong",disc:"本课程通过猿题库产品原型设计，来讲解如何绘制专业的产品原型设计，如何绘制好专业的产品原型，如何写好产品原型的",good:100,bad:100},
			       {psgUrl:"#",title:"绘制专业的产品原型应用示例：猿题库 App 产品原型设计",imgUrl:"/yellowcong/resources/img/demo/56eb5e43e9b52.jpg",date:"2016-10-10",see:100,username:"yellowcong",disc:"本课程通过猿题库产品原型设计，来讲解如何绘制专业的产品原型设计，如何绘制好专业的产品原型，如何写好产品原型的",good:100,bad:100},
			       {psgUrl:"#",title:"绘制专业的产品原型应用示例：猿题库 App 产品原型设计",imgUrl:"/yellowcong/resources/img/demo/56eb5e43e9b52.jpg",date:"2016-10-10",see:100,username:"yellowcong",disc:"本课程通过猿题库产品原型设计，来讲解如何绘制专业的产品原型设计，如何绘制好专业的产品原型，如何写好产品原型的",good:100,bad:100},
			       {psgUrl:"#",title:"绘制专业的产品原型应用示例：猿题库 App 产品原型设计",imgUrl:"/yellowcong/resources/img/demo/56eb5e43e9b52.jpg",date:"2016-10-10",see:100,username:"yellowcong",disc:"本课程通过猿题库产品原型设计，来讲解如何绘制专业的产品原型设计，如何绘制好专业的产品原型，如何写好产品原型的",good:100,bad:100},
			       {psgUrl:"#",title:"绘制专业的产品原型应用示例：猿题库 App 产品原型设计",imgUrl:"/yellowcong/resources/img/demo/56eb5e43e9b52.jpg",date:"2016-10-10",see:100,username:"yellowcong",disc:"本课程通过猿题库产品原型设计，来讲解如何绘制专业的产品原型设计，如何绘制好专业的产品原型，如何写好产品原型的",good:100,bad:100},
			       {psgUrl:"#",title:"绘制专业的产品原型应用示例：猿题库 App 产品原型设计",imgUrl:"/yellowcong/resources/img/demo/56eb5e43e9b52.jpg",date:"2016-10-10",see:100,username:"yellowcong",disc:"本课程通过猿题库产品原型设计，来讲解如何绘制专业的产品原型设计，如何绘制好专业的产品原型，如何写好产品原型的",good:100,bad:100},
			       {psgUrl:"#",title:"绘制专业的产品原型应用示例：猿题库 App 产品原型设计",imgUrl:"/yellowcong/resources/img/demo/56eb5e43e9b52.jpg",date:"2016-10-10",see:100,username:"yellowcong",disc:"本课程通过猿题库产品原型设计，来讲解如何绘制专业的产品原型设计，如何绘制好专业的产品原型，如何写好产品原型的",good:100,bad:100},
			       {psgUrl:"#",title:"绘制专业的产品原型应用示例：猿题库 App 产品原型设计",imgUrl:"/yellowcong/resources/img/demo/56eb5e43e9b52.jpg",date:"2016-10-10",see:100,username:"yellowcong",disc:"本课程通过猿题库产品原型设计，来讲解如何绘制专业的产品原型设计，如何绘制好专业的产品原型，如何写好产品原型的",good:100,bad:100},
			       {psgUrl:"#",title:"绘制专业的产品原型应用示例：猿题库 App 产品原型设计",imgUrl:"/yellowcong/resources/img/demo/56eb5e43e9b52.jpg",date:"2016-10-10",see:100,username:"yellowcong",disc:"本课程通过猿题库产品原型设计，来讲解如何绘制专业的产品原型设计，如何绘制好专业的产品原型，如何写好产品原型的",good:100,bad:100}
			 ]                            
			
		});	 
	 	
	 	
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
		 $(".nav_pages_listbox .listbox_lager li").hover(function(){
			$(this).find(".listbox_see").show("slow").css("opacity","1");
		},function(){
			$(this).find(".listbox_see").css("opacity","0");
		}); 
		
		//大小变化操作
		$(".nav_pages_listbox .listbox_lager li").hover(function(){
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
		
		//设定我们的样式切换操作
		$(".wrap_select_style li:first").css("background","#fff");
		$(".wrap_select_style li").click(function(){
			$(this).css("background","#fff").siblings("li").css("background","#f5f5f5");
			//$(".listbox_list")
			//listbox_lager
		});
		$(".wrap_select_style li:first").click(function(){
			$(".nav_pages_listbox .listbox_list").hide();
			$(".nav_pages_listbox .listbox_lager").show();
		});
		$(".wrap_select_style li:last").click(function(){
			$(".nav_pages_listbox .listbox_lager").hide();
			$(".nav_pages_listbox .listbox_list").show();
		});
		
		//设定横排的显示
		 $(".listbox_list_img a").hover(function(){
				$(this).find(".listbox_list_see").css("opacity","1");
		},function(){
			$(this).find(".listbox_list_see").css("opacity","0");
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
			<ul class="listbox_list">
				<li>
					<div>
						<div class="listbox_list_img"><a href="#">
						<img src="<%=request.getContextPath() %>/resources/img/demo/56eb5e43e9b52.jpg"/>
							<div class="listbox_list_see"><i class="fa fa-play-circle-o fa-fw" style="font-size: 40px;"></i></div>
						</a>
						</div>
						<div class="listbox_list_info">
							<h2 ><a href="#">绘制专业的产品原型应用示例：猿题库 App 产品原型设计</a></h2>
							<p class="listbox_list_dicr">本课程通过猿题库产品原型设计，来讲解品原型设计，来讲解品原型设计，来讲解品原型设计，来讲解如何绘制专业的产品原型设计，如何绘制好专业的产品原型，如何写好产品原型的交互说明，介绍一些绘制原型的注意事项。 </p>
							<p><span><i class="fa fa-clock-o fa-fw"></i>2015-10-12</span>
							<span><i class="fa fa-user fa-fw"></i>admin</span>
							<span><i class="fa fa-eye fa-fw"></i>2015</span>
							<span><i class="fa fa-comments fa-fw"></i>20</span>
							<span style="float: right;" class="listbox_zhan"><i class="fa fa-thumbs-o-up fa-fw"></i>2000</span>
							<span style="float: right;"   class="listbox_down"><i class="fa fa-thumbs-o-down fa-fw"></i>2000</span>
							</p>
						</div>
						<div style="clear:both;"></div>
						
					</div>
				</li>
				<li>
					<div>
						<div class="listbox_list_img"><a href="#">
						<img src="<%=request.getContextPath() %>/resources/img/demo/56eb5e43e9b52.jpg"/>
							<div class="listbox_list_see"><i class="fa fa-play-circle-o fa-fw" style="font-size: 40px;"></i></div>
						</a>
						</div>
						<div class="listbox_list_info">
							<h2 ><a href="#">绘制专业的产品原型应用示例：猿题库 App 产品原型设计</a></h2>
							<p class="listbox_list_dicr">本课程通过猿题库产品原型设计，来讲解品原型设计，来讲解品原型设计，来讲解品原型设计，来讲解如何绘制专业的产品原型设计，如何绘制好专业的产品原型，如何写好产品原型的交互说明，介绍一些绘制原型的注意事项。 </p>
							<p><span><i class="fa fa-clock-o fa-fw"></i>2015-10-12</span>
							<span><i class="fa fa-user fa-fw"></i>admin</span>
							<span><i class="fa fa-eye fa-fw"></i>2015</span>
							<span><i class="fa fa-comments fa-fw"></i>20</span>
							<span style="float: right;" class="listbox_zhan"><i class="fa fa-thumbs-o-up fa-fw"></i>2000</span>
							<span style="float: right;"   class="listbox_down"><i class="fa fa-thumbs-o-down fa-fw"></i>2000</span>
							</p>
							
							
						</div>
						<div style="clear:both;"></div>
						
					</div>
				</li>
			</ul> 
			<ul class="listbox_lager">
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
<div style="clear: both"></div>
</div>
</div>
<style type="text/css">
	.page_foot_beifeng{
	 	background: #343434; 
		color: #9B9B9B;
	}
	.page_foot_border{
		height:7px;
		background-image: url("<%=request.getContextPath()%>/resources/img/footBg.png");
		background-repeat: repeat-x;
	}
	
	.page_foot_beifeng dl{
		width: 185px;
		padding-left: 30px;
		margin: 25px 0;
		float: left;
		min-height: 175px;
	}
	.page_foot_beifeng dl a{
		text-decoration: none;
		color: gray;
		font-size:14px;
		font-family: "Verdana,"Lantinghei SC","Hiragino Sans GB","Microsoft Yahei",Helvetica,arial,宋体,sans-serif"
		font-weight: 400;
		
	}
	.page_foot_beifeng dl a:hover{
		color:#35b558;
		transition: all 0.2s ease 0s;
	}
	
	.page_foot_beifeng dl dt a{
		font-size: 16px;
		font-weight: 500;
	}
	.page_foot_beifeng dl dd{
		font-size: 14px;
		margin-top: 10px;
	}
	.page_foot_beifeng dl dd img{
		margin-top: -20px;
	}
	.page_foot_daohang{
		height: 270px;
	}
</style>
<script type="text/javascript">
$(function(){
	$(".my_info").socialConnect({
		background:"gray",
		menus:[{iconCls:"fa-envelope",href:"mailto:me@zhangwenli.com"},
		       {iconCls:"fa-qq",href:"#"},
		       {iconCls:"fa-github",href:"#"},
		       {iconCls:"fa-weixin",href:"#"},
		       {iconCls:"fa-weibo",href:"#",blank:false},
		       //来自己定义颜色
		       {iconCls:"fa-phone",href:"186-0460-0631"}
		 ],
		 //设定样好似 这个是根据自己需要的样式来,一下子定义多个，但是这个比较的麻烦不建议，我觉得自己设计得还是不错的
		 //style:{'fa-qq':'yellow',}
			
	});
	
});
</script>
<div class="page_foot_border"></div>
<div class="page_foot_beifeng">

	<div class="container">
	<div >
		<div class="page_foot_daohang">
			<dl>
			<dt><a href="#">关于yellowcong</a></dt>
			<dd>&bull;&nbsp;<a href="#">关于站长</a></a></dd>
			<dd>&bull;&nbsp;<a href="#">联系站长</a></dd>
			<dd>&bull;&nbsp;<a href="#">关于站长</a></dd>
			<dd>&bull;&nbsp;<a href="#">关于站长</a></dd>
		</dl>
		
		<dl>
			<dt><a href="#">网站服务</a></dt>
			<dd>&bull;&nbsp;<a href="#">关于站长</a></dd>
			<dd>&bull;&nbsp;<a href="#">关于站长</a></dd>
			<dd>&bull;&nbsp;<a href="#">关于站长</a></dd>
			<dd>&bull;&nbsp;<a href="#">关于站长</a></dd>
		</dl>
		<dl>
			<dt><a href="#">网站服务</a></dt>
			<dd>&bull;&nbsp;<a href="#">关于站长</a></dd>
			<dd>&bull;&nbsp;<a href="#">关于站长</a></dd>
			<dd>&bull;&nbsp;<a href="#">关于站长</a></dd>
			<dd>&bull;&nbsp;<a href="#">关于站长</a></dd>
		</dl>
		<dl style="width: 200px;">
			<dt><a href="#">联系我们</a></dt>
			<dd>公司:黑龙江科技大学</dd>
			<dd>地址:黑龙江科技大学</dd>
			<dd>电话:18604600631</dd>
			<dd>邮箱:717350389@qq.com</dd>
			<dd><div class="my_info"></div></dd>
		</dl>
		
		<dl style="width: 200px;">
			<dd><img style="width: 200px;" src="<%=request.getContextPath() %>/resources/img/qq_code.jpg"></img></dd>
		</dl>
	</div>
</div>
</div>
</div>
</body>
</html>
