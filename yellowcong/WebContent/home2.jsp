<%--原始的home的  html数据 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- bootstrap 的样式 -->
<link rel="stylesheet"  type="text/css" href="<%=request.getContextPath()%>/resources/css/bootstrap.css"/>
<!-- 字符的样式 -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/font/css/font-awesome.css" type="text/css" /> 
<!-- 网站的样式 -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style.css" type="text/css" /> 

<!-- 设定图标 -->   
<link type="image/x-icon" href="<%=request.getContextPath() %>/resources/img/login/logo.jpg" rel="shortcut icon"/>


<!-- 加载js -->
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.nanoscroller.min.js"></script>    
<title>我的首页</title>

<style type="text/css">
.content_nav{
		float:left;
		height:50px;
		color:#777;
		width:100%;
		margin-top:-10px;
		line-height:50px;
		background-color: #fff;
		box-shadow:0px 2px 2px rgba(0, 0, 0, 0.05), 0px 1px 0px rgba(0, 0, 0, 0.05);
	}
	.content_nav .content_navs_list{
		list-style: outside none none;
		display: inline;
		float: right;
		margin-right: 20px;
	}
	
	.content_nav .content_navs_list li{
		display: block;
		float: left;
	}
	.content_nav .content_navs_list li a{
		color: #777;
		transition: all 0.2s ease-in-out 0s;
	}
	.content_nav .content_navs_list li a:HOVER{
		color:#E74C3C;
	}
	.content_nav span{
	margin-left: 270px;
	font-size: 25px;
	}
	
	.content_bodys{
		float: left;
		background: yellow;
		width: 100%;
		padding-left: 270px;
	}
</style>

</head>
<body>
<div>
<!-- 消息提醒 -->
	<div class="news_ticker bg_orange">
            <div class="container">
                <ul id="news-ticker-content" class="list-unstyled mbn">
                    <li><a href='http://madmin.swlabs.co/' , target='_blank'>This is HTML app version of this template. To see Angular app version, please click here</a>
                    </li>
                </ul>
                <a id="news-ticker-close" href="javascript:;"><i class="fa fa-times"></i></a>
            </div>
        </div>
       <!-- 导航栏 --> 
       <div class="head_navbar">
       		<!-- logo -->
       		<div class="navbar_logo">
       			<a href = " "><span>yellowcong</span></a> 
       		</div>	
       		<div class="navbar_main">xx
       			<!-- 菜单缩放 -->
      			 <a class="head_navbar_menu" href="">
      				<i class="fa fa-bars"></i>
      			</a>
  				<!-- 搜索菜单 -->
		      	<a class="head_navbar_menu" href="">
  				 	<i class="fa fa-search"></i>
  				 </a>
       		</div> 		
       		
       		<!-- 用户退出等 的 右边菜单了 -->
       		<div class="head_nav_right">
       			<!-- 右边的菜单数据了 -->	 
      			<ul class="head_navbar_right">
      				<li> 	<a class="head_navbar_menu" href="">
      				 <i class="fa fa-bell fa-fw"></i></a>
      			</li><li> 	<a class="head_navbar_menu" href="">
      				 <i class="fa fa-envelope fa-fw"></i></a>
      			</li>
      			<li> 
      				<a class="head_navbar_menu" href="">
      				 <i class="fa fa-cog"></i>
      				 <span class="count">6</span>
      				 
      				 </a>
      			</li>
      			<li> <a class="head_navbar_menu" href="">
      				 <img src="<%=request.getContextPath() %>/resources/img/login/head.jpg"/>
      				 <span>yellowcong</span>
      				 <span class="caret"></span>
      			</a></li>
      			<li> 	
      			<a class="head_navbar_menu" href="">
      				 <i class="fa fa-power-off"></i></a>
      			</li>
      			</ul>
       		</div>
       </div>
       <div class="content_body" >
	       <!-- 左边工具栏 -->
	       <div class="content_nav_left_content">
       		<div class="content_nav_left">
       			<div class="nav_left_user">
       				<img src="<%=request.getContextPath() %>/resources/img/login/head.jpg">
       				<div class="nav_left_user_statu">
       					<span>yellowcong</span><br/>
       					<span class="statu_icon"><i class="fa fa-circle"></i></span><span class="statu_info">在线</span>
       				</div>
       			</div>
       			<div class="nav_left_list">
       				<ul class="nav_list_navs">
       					<li>
       						<a href="">
       							<i class="fa fa-user fa-fw nav_icon"></i>
       							<span class="nav_text">我的信息</span>
       							<i class="fa fa-chevron-circle-right drop-icon"></i>
       						</a>
       						
       						<!-- 子菜单 -->
       						<ul class="sub_navs">
       							
       							<li><a href="#">
       								<i class="fa fa-envelope-o fa-fw"></i>
       									<span>最新消息</span>
       								</a>
       							</li>
       						</ul>
       					</li>
       					<li>
       						<a href="">
       							<i class="fa fa-users fa-fw nav_icon"></i>
       							<span>用户管理</span>
       							<i class="fa fa-chevron-circle-right drop-icon"></i>
       						</a>
       						<!-- 子菜单 -->
       						<ul class="sub_navs">
       							
       							<li><a href="#">
       								<i class="fa fa-edit fa-fw"></i>
       								<span>用户编辑</span>
       								</a>
       							</li>
       							<li><a href="#">
       								<i class="fa fa-edit fa-fw"></i>
       								<span>用户组管理</span>
       								</a>
       							</li>
       							<li><a href="#">
       								<i class="fa fa-rocket fa-fw"></i>
       								<span>权限管理</span>
       								</a>
       							</li>
       							<li><a href="#">
       								<i class="fa fa-tachometer fa-fw"></i>
       								<span>用户分析</span>
       								</a>
       							</li>
       						</ul>
       					</li>
       					<li>
       						<a href="">
       							<i class="fa fa-tasks fa-fw nav_icon"></i>
       							<span>栏目管理</span>
       							<i class="fa fa-chevron-circle-right drop-icon"></i>
       						</a>
       					</li>
       					<li>
       						<a href="">
       							<i class="fa fa-file-text-o fa-fw nav_icon"></i>
       							<span>文章管理</span>
       							<i class="fa fa-chevron-circle-right drop-icon"></i>
       						</a>
       					</li>
       					<li>
       						<a href="">
       							<i class="fa fa-file-o fa-fw nav_icon"></i>
       							<span>日记管理</span>
       							<i class="fa fa-chevron-circle-right drop-icon"></i>
       						</a>
       					</li>
       					<li>
       						<a href="">
       							<i class="fa fa-cloud fa-fw nav_icon"></i>
       							<span>天气管理</span>
       							<i class="fa fa-chevron-circle-right drop-icon"></i>
       						</a>
       					</li>
       					<li>
       						<a href="">
       							<i class="fa fa-question fa-fw nav_icon"></i>
       							<span>问卷管理</span>
       							<i class="fa fa-chevron-circle-right drop-icon"></i>
       						</a>
       					</li>
       					<li>
       						<a href="">
       							<i class="fa fa-comments-o fa-fw nav_icon"></i>
       							<span>聊天机器人</span>
       							<i class="fa fa-chevron-circle-right drop-icon"></i>
       						</a>
       					</li>
       					<li>
       						<a href="">
       							<i class="fa fa-desktop fa-fw nav_icon"></i>
       							<span>文档在线</span>
       							<i class="fa fa-chevron-circle-right drop-icon"></i>
       						</a>
       					</li>
       					<li>
       						<a href="">
       							<i class="fa fa-search fa-fw nav_icon"></i>
       							<span>搜索分析</span>
       							<i class="fa fa-chevron-circle-right drop-icon"></i>
       						</a>
       					</li>
       					<li>
       						<a href="">
       							<i class="fa fa-picture-o fa-fw nav_icon"></i>
       							<span>相册管理</span>
       							<i class="fa fa-chevron-circle-right drop-icon"></i>
       						</a>
       						
       					</li>
       					<li>
       						<a href="">
       							<i class="fa fa-music fa-fw  nav_icon"></i>
       							<span>音乐管理</span>
       							<i class="fa fa-chevron-circle-right drop-icon"></i>
       						</a>
       					</li>
       					<li>
       						<a href="">
       							<i class="fa fa-play-circle-o fa-fw  nav_icon"></i>
       							<span>视屏管理</span>
       							<i class="fa fa-chevron-circle-right drop-icon"></i>
       						</a>
       					</li>
       					<li>
       						<a href="">
       							<i class="fa fa-file fa-fw  nav_icon"></i>
       							<span>文件管理</span>
       							<i class="fa fa-chevron-circle-right drop-icon"></i>
       						</a>
       					</li>
       					<li>
       						<a href="">
       							<i class="fa fa-code fa-fw  nav_icon"></i>
       							<span>代码仓库</span>
       							<i class="fa fa-chevron-circle-right drop-icon"></i>
       						</a>
       					</li>
       					<li>
       						<a href="">
       							<i class="fa fa-envelope-o fa-fw  nav_icon"></i>
       							<span>每周邮件</span>
       							<i class="fa fa-chevron-circle-right drop-icon"></i>
       						</a>
       					</li>
       					<li>
       						<a href="">
       							<i style="background: none;" class="fa fa-weixin fa-fw nav_icon"></i>
       							<span>微信推送</span>
       							<i class="fa fa-chevron-circle-right drop-icon"></i>
       						</a>
       					</li>
       					<li>
       						<a href="">
       							<i style="background: none;" class="fa fa-globe fa-fw nav_icon"></i>
       							<span>接口管理</span>
       							<i class="fa fa-chevron-circle-right drop-icon"></i>
       						</a>
       					</li>
       					<li>
       						<a href="">
       							<i style="background: none;" class="fa fa-money fa-fw nav_icon"></i>
       							<span>支付管理</span>
       							<i class="fa fa-chevron-circle-right drop-icon"></i>
       						</a>
       					</li>
       					<li>
       						<a href="">
       							<i style="background: none;" class="fa fa-database fa-fw nav_icon"></i>
       							<span>数据分析</span>
       							<i class="fa fa-chevron-circle-right drop-icon"></i>
       						</a>
       					</li>
       					<li>
       						<a href="">
       							<i class="fa fa-gears  fa-fw nav_icon"></i>
       							<span>网站设置</span>
       							<i class="fa fa-chevron-circle-right drop-icon nav_show"></i>
       						</a>
       						
       						<!-- 子菜单 -->
       						<ul class="sub_navs">
       							
       							<li><a href="#">
       								<i class="fa fa-envelope-o fa-fw"></i>
       								<span>网站建议</span>
       								</a>
       							</li>
       							<li><a href="#">
       								<i class="fa fa-tachometer fa-fw"></i>
       								<span>流量分析</span>
       								</a>
       							</li>
       							<li><a href="#">
       								<i class="fa fa-bug fa-fw"></i>
       								<span>网站错误</span>
       								</a>
       							</li>
       							<li><a href="#">
       								<i class="fa fa-refresh fa-fw"></i>
       								<span>更新历史</span>
       								</a>
       							</li>
       							<li><a href="#">
       								<i class="fa fa-info fa-fw"></i>
       								<span>网站信息</span>
       								<i class="fa fa-chevron-circle-right drop-icon"></i>
       								</a>
       							</li>
       							<li><a href="#">
       								<i class="fa fa-qrcode fa-fw"></i>
       								<span>网站二维码</span>
       								<i class="fa fa-chevron-circle-right drop-icon"></i>
       								</a>
       							</li>
       							
       							
       						</ul>
       						
       					</li>
       				</ul>
       				
       			</div>
       			<div class="nano-pane" style="opacity: 1; visibility: visible;">
       					<div class="nano-slider" style="height: 50px; transform: translate(0px, 0px);"></div>
       			</div>
       		</div>
			</div>
			<!-- 右边数据显示 -->
			<div class="content_body_right">
				<!-- 顶部导航栏  -->
				<div class="content_nav">
					<span ><i class="fa fa-edit"></i>用户编辑</span>
					<ul class="content_navs_list">
						<li>
							<i class="fa fa-home"></i>
							<a  href="">主页</a>
							<i class="fa fa-angle-right"></i>
						</li>
						<li>
							<a  href="">人员管理</a>
							<i class="fa fa-angle-right"></i>
						</li>
						<li>
							<a  href="">用户编辑</a>
						</li>
					</ul>							
				</div>
				<!-- 顶部导航栏结束 -->
				<div class="content_bodys">
				ccc
				</div>
			</div>
       </div>
</div>

</body>
</html>