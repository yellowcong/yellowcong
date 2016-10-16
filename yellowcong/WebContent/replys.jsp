<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<!-- 导入按钮样式-->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery-1.10.2.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/font/css/font-awesome.css" type="text/css" /> 

<script>

</script>
	
<style type="text/css">
	.input-text
        {
            
        }
        
        		.button {
    position: relative;
    overflow: visible;
    display: inline-block;
    padding: 0.5em 1em;
    border: 1px solid #d4d4d4;
    margin: 0;
    text-decoration: none;
    text-align: center;
    text-shadow: 1px 1px 0 #fff;
    font:11px/normal sans-serif;
    color: #333;
    white-space: nowrap;
    cursor: pointer;
    outline: none;
    background-color: #ececec;
    background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#f4f4f4), to(#ececec));
    background-image: -moz-linear-gradient(#f4f4f4, #ececec);
    background-image: -ms-linear-gradient(#f4f4f4, #ececec);
    background-image: -o-linear-gradient(#f4f4f4, #ececec);
    background-image: linear-gradient(#f4f4f4, #ececec);
    -moz-background-clip: padding; /* for Firefox 3.6 */
    background-clip: padding-box;
    border-radius: 0.2em;
    /* IE hacks */
    zoom: 1;
    display: inline;
}

.button:hover,
.button:focus,
.button:active,
.button.active {
    border-color: #3072b3;
    border-bottom-color: #2a65a0;
    text-decoration: none;
    text-shadow: -1px -1px 0 rgba(0,0,0,0.3);
    color: #fff;
    background-color: #3c8dde;
    background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#599bdc), to(#3072b3));
    background-image: -moz-linear-gradient(#599bdc, #3072b3);
    background-image: -o-linear-gradient(#599bdc, #3072b3);
    background-image: linear-gradient(#599bdc, #3072b3);
}

.reply_btn {
	margin-top: 10px;
}   
        
 .reply_title{
 	margin-bottom: 10px;
 }       
</style>

<style type="text/css">
			 .ds-avatar {
				top: 15px;
				left: -20px;
				padding: 5px;
				width: 36px;
				height: 36px;
				box-shadow: -1px 0px 1px rgba(0, 0, 0, 0.15) inset;
				border-radius: 46px;
				background: #FAFAFA none repeat scroll 0% 0%;
			}

			.ds-avatar a {
				cursor: pointer;
				text-decoration: none;
				color: #999;
				background-color: transparent;
				transition: color 0.15s linear 0s;
			}

			.ds-avatar a {
				display: inline-block;
				padding: 1px;
				width: 32px;
				height: 32px;
				border: 1px solid #B9BAA6;
				border-radius: 50%;
				background-color: #FFF !important;
			}

		.ds-avatar img {
			width: 32px !important;
			height: 32px !important;
			border-radius: 32px;
			/*盒子颜色*/
			box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.22);
			/*设定变化时间*/
			transition: all 1s ease-in-out 0s;
		}

		.ds-avatar img:hover {
			-webkit-transform: rotateZ(360deg);
			-moz-transform: rotateZ(360deg);
			-o-transform: rotateZ(360deg);
			-ms-transform: rotateZ(360deg);
			transform: rotateZ(360deg);
		}
		
		
		/*定义回复显示数据,显示回复的类容的宽度*/
		.reply_content{
			position: relative;
			 width: 700px;
			 padding-left: 13px;
		}
		.reply_panel:hover{
			background: #F0F0F0;
		}
		.reply_icon{
			position: absolute;
			left: -10px;
			top:10px;
		}
	
		.reply_panel{
			background: #FDFDFD none repeat scroll 0% 0%;
			margin-top: 30px;
			padding: 15px 15px 15px 30px;
			border-radius: 5px;
			box-shadow: 0px 1px 3px #B8B9B9;
			border: 1px solid #eee;
			padding-bottom: 25px;
			
		}
		
		.reply_panel a{
			text-decoration: none;
			color: #999;
		}
		.reply_panel a:HOVER{
			color: #35b558;
		}
		
		.reply_panel .user_info{
			font-size: 12px;
		}
		.reply_panel .user_info_day{
			margin-left: 10px;
		}
		.reply_panel .user_info_lou{
			float: right;
		}
		.reply_input_text{
			border: 1px solid #C3CED9;
            border-radius: 5px 5px 5px 5px;
            font-size: 14px;
            height: 31px;
            line-height: 31px;
            margin-right: 10px;
            padding: 0;
            width:80%;
            padding-left:10px;
            height:100px;
            font-family: "微软雅黑";
            color:#gggggg;
		}
		
		.user_info{
			color: #999;
		}
		
		.reply_body{
			color: #787968;
			margin-top: 10px;
			margin-left: -5px;
		}
		.reply_option{
			float: right;
		}
		.reply_option ul{
			
			list-style: none;
			padding-left: 0px;
			margin-top: 0px;
			float: left;
		}
		.reply_option ul li{
			list-style: none;
			padding-left: 10px;
			float: left;
			color: #999;
		}
		
		.reply_option ul li:HOVER {
			cursor: default;			
		}
		</style>
		<script type="text/javascript">
			$(function(){
				
				//设定事件
				//两个标签的点击事件
				$(".reply_zhan").hover(function(){
					$(this).find("i").removeClass("fa-thumbs-o-up").addClass("fa-thumbs-up");
				},function(){
					$(this).find("i").removeClass("fa-thumbs-up").addClass("fa-thumbs-o-up");
				}).click(function(){
					var val = $(this).find(".zhan_count").html();
					//
					val = val.replace('<span id="transmark"></span>','');
					$(this).find(".zhan_count").html(parseInt(val)+1);
				});
				$(".reply_down").hover(function(){
					$(this).find("i").removeClass("fa-thumbs-o-down").addClass("fa-thumbs-down");
				},function(){
					$(this).find("i").removeClass("fa-thumbs-down").addClass("fa-thumbs-o-down");
				}).click(function(){
					var val = $(this).find(".down_count").html();
					val = val.replace('<span id="transmark"></span>','');
					//
					$(this).find(".down_count").html(parseInt(val)+1);
				});
				
				
				//回复点击事件
			});
		</script>
</head>
<body>
	
		<div  id="exam_analyse" class="exam">
		<div class="exam_head"><h1>考试分析</h1></div>
		<div class="reply_input">
			<div class="reply_icon_input">
					 <div class="ds-avatar" data-user-id="12917619">
					<a onclick="this.href='http://zqxt.duoshuo.com/user-url/?user_id=12917619';" href="http://zqxt.duoshuo.com/user-url/?user_id=12917619" target="_blank" rel="nofollow author">
						<img alt="yellowcong" src="<%=request.getContextPath()%>/resources/img/login/logo.jpg"></img>
					</a>
					</div>
			</div>
			<div></div>
		</div>
		
		<div class="reply_content">
			<div class="reply_icon">
					 <div class="ds-avatar" data-user-id="12917619">
					<a onclick="this.href='http://zqxt.duoshuo.com/user-url/?user_id=12917619';" href="http://zqxt.duoshuo.com/user-url/?user_id=12917619" target="_blank" rel="nofollow author">
						<img alt="yellowcong" src="<%=request.getContextPath()%>/resources/img/login/logo.jpg"></img>
					</a>
					</div>
			</div>
			<div class="reply_panel">
				<div class="user_info"><span class="user_info_username">
					<a href="#">yellowcong</a></span>
					<span  class="user_info_day">2012年10月10日</span>
					<span  class="user_info_lou">#1楼</span>
				</div>
				<div class="reply_body">
					涂老师,我有个困扰了很久的问题。了很久的问题。了很久的问题。了很久的问题。我在models.py里面用了ImageField，通过看文档我知道这时要指定MEDIA_ROOT和MEDIA_URL，后台上传成功了，但是我应该怎么在前端网页里去用呢？在views.py里面也是把他当成一个普通的字段吗？
				</div>
				<div class="reply_option">
					<ul>
						<li class="reply_zhan"><i class="fa fa-thumbs-o-up fa-fw"></i><span class="zhan_count">100</span></li>
						<li class="reply_down"><i class="fa fa-thumbs-o-down fa-fw"></i><span class="down_count">100</span></li>
						<li><i class="fa fa-comments fa-fw"></i></li>
					</ul>
				</div>
			</div>
			<!-- 
			<div class="reply_input">
				<textarea class="reply_input_text"  rows="3"></textarea>
				<div class="reply_btn"><a href="#" class="button">提交</a></div>
			</div> -->
		</div>
		
	</div>
	
	</body>
</html>