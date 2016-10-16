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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/simditor-2.3.6/styles/simditor.css" />

<!-- 加载js -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery.yellowcong.easyui.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/simditor-2.3.6/scripts/module.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/simditor-2.3.6/scripts/hotkeys.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/simditor-2.3.6/scripts/uploader.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/simditor-2.3.6/scripts/simditor.js"></script>
	
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
		
		$(".my_foot").psgsFoot({
			
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
		});
		
		
		
		
		
		//文章的分享
		$(".my_passage_share").socialConnect({
			background:"gray",
			menus:[
			       {iconCls:"fa-qq",href:"#"},
			       // 腾讯微博
			       {iconCls:"fa-tencent-weibo",href:"#",color:"#0A90D3"},
			       //人人fa-renren
			       {iconCls:"fa-renren",href:"#",color:"#0B51AF"},
			       {iconCls:"fa-weixin",href:"#"},
			       {iconCls:"fa-weibo",href:"#",blank:false},
			       //来自己定义颜色
			 ],
			 //设定样好似 这个是根据自己需要的样式来,一下子定义多个，但是这个比较的麻烦不建议，我觉得自己设计得还是不错的
			 //style:{'fa-qq':'yellow',}
				
		});
	});
</script>

<!-- ------------------------------------编辑器数据显示 -->
<script type="text/javascript">
	$(function(){
		 var sm_toolbar = ['italic','bold', 'underline', 'strikethrough', '|', 'blockquote', 'code', 'link', 'image'];
		   
		var editor = new Simditor({
			
			  textarea: $('#passage_repaly_my_input'),
			  //显示的菜单
			  toolbar: sm_toolbar,
			  //是否可以直接粘贴图片,默认为false
			  pasteImage: false,
			  //optional options
			  //默认粘贴的图片
			  defaultImage : '/yellowcong/resources/img/login/logo.jpg',
			  //默认的数据
			  placeholder: '看帖肿么可以不回复呢?',
		      //隐藏工具栏，默认false
			  toolbarHidden: false,
			  //自动漂浮，默认为true,如果我们是回复啥的，可以直接使用这个
		      toolbarFloat: false,  
			  //上传的地址 ,返回的图片
			  /*
			  完成后需要返回的 json数据
				{
				  "success": true/false,
				  "msg": "error message", # optional
				  "file_path": "[real file path]"
				}
			  */
			  upload: {
				        //删除的地址
			            url: "/image/upload",
			            params: null,
			            //上传的文件名称
			            fileKey: 'upload_file',
			            //上传连接次数
			            connectionCount: 1,
			            //离开验证
			            leaveConfirm: '正在上传文件，如果离开上传会自动取消'
		       } 
		
		
			});
	});
</script>
<!-- 主页显示的数据--------------------------------------------------------------------- -->
<style type="text/css">
	body{
	 background: #F0F0F0; 
	}
	
	.passage_page_left{
		height: 300px;
		width:15%;
		float:left;
		position: relative;
		/*设置右边显示数据*/
		/* box-shadow:  1px 0 0 #aaa; 
		border-right: 1px solid #aaa; 
		border-top: none;
		border-left: none;
		border-bottom: none; */
	}
	
	
	.passage_page_left dl{
		float:right;
		text-align:right;
		list-style: none;
		margin-top: 40px;
		padding-left: 0px;
		font-size:12px;
		color: #828282;
	}
	
	.passage_page_left dl dd,.passage_page_left dl dt{
		list-style: none;
		margin-top: 10px;
		margin-right:30px;
		padding-left: 0px;
	}
	/*设定年月日的数据*/
	.passage_page_left .page_year{
		padding-right:50px;
		display: block;
	}
	.passage_page_left .page_month{
		padding-right:50px;
		display: block;
	}
	.passage_page_left .page_day{
		line-height: 40px;
		font-size: 40px;
		display: block;
		margin-top: -38px;
	}
	
	.passage_page_left .passage_page_img{
		display: block;
		top: 60px;
		right:-12px;
		position:absolute;
		float: right;
	}
	
	.passage_page_right{
		background: #FFF;
		height: 3000px;
		margin-left: 15%;
		box-shadow:  -1px 0 0 #aaa; 
		border-left: 1px solid #aaa; 
		
		padding-left:40px;
		padding-right:40px;
	}
	.passage_page_right .title{
		margin-top: 0px;
		font-size: 32px;
		
		padding-top: 45px;
	}
	
	.page_code{
		display: inline;
		border-radius: .25em;
		color: #999;
		border: 1px solid #DBDBDB;
		padding: 0 10px;
		text-align: center;
		line-height: 23px;
		padding-top: 3px;
		padding-bottom: 3px;
	}
	.passage_page_right .passage_content{
		padding-bottom: 30px;
	}
	
	
	.passage_page_right .passage_share{
	
	}
</style>



<!-- -------------------------评论的CSS--------------------------------------------------------- -->

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
			 width: 100%;
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
		
		
<style type="text/css">
     /*解决图标距离顶部过近的问题,编辑器问题*/
	.simditor .simditor-toolbar ul li a{
	 	margin-top: 20px;
	}
	
	/* .simditor .simditor-body{
		min-height: 300px;
	}
	.simditor .simditor-body, .editor-style{
		height: 300px;
	} */
	
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
<input type="hidden" id="pathNow" value="<%=request.getContextPath()%>"/>	
<!-- 这个是我们的首页导航栏目 -->
<div class="my_head"></div>
<div class="passage_page_content">

<div class="container">
	<div class="passage_page_left">
		<dl>
			<dt><span  class="page_year">12月</span><span  class="page_month">2012</span><span class="page_day">15</span><img class="passage_page_img" src="<%=request.getContextPath()%>/resources/img/meta_right.png" /></dt>
			<dd>狂飙のyellowcong<i class="fa fa-user fa-fw"></i></dd>
			<dd><span class="page_code">大数据</span>、<span class="page_code">java</span><i class="fa fa-tags fa-fw"></i></dd>
			<dd>2015<i class="fa fa-eye fa-fw"></i></dd>
			<dd>2015<i class="fa fa-comments fa-fw"></i></dd>
			<dd>2000<i class="fa fa-thumbs-o-up fa-fw"></i></dd>
			<dd>2000<i class="fa fa-thumbs-o-down fa-fw"></i></dd>
			<dd>2000<i class="fa fa-star fa-fw"></i></dd>
		</dl>
	</div>
	<div class="passage_page_right">
		<div class="passage_title">
			<h1 class="title page-header">安装 OpenLiteSpeed 1.4 ＋ PHP 7.0 设置篇 </h1>
		</div>
		<div class="passage_content">
		<!-- 内容 用代码来填充 -->
		
		简介<br>
<br>
对于想要利用ZooKeeper的协调服务来创建一个分布式应用的开发人员来说，这篇文章提供了指导。包含了一些概念和实际性操作的信息。<br>
<br>
这篇文章的前四个章节介绍了各种ZooKeeper的概念，这对理解ZooKeeper是怎么工作的是必须的。没有包含源代码，但是它假设你对分布式处理有关的问题比较熟悉。这四个章节是：<br>
<br>
&nbsp;&nbsp;&nbsp; ZooKeeper数据模型<br>
&nbsp;&nbsp;&nbsp; ZooKeeper 会话<br>
&nbsp;&nbsp;&nbsp; ZooKeeper Watches<br>
&nbsp;&nbsp;&nbsp; 一致性保证<span id="transmark"></span>
		</div>
		<!-- 分享-->
		<div class="passage_share">
			<div class="my_passage_share"></div>
		</div>
		
		<div class="passage_reply">
			<div class="passage_reply_input" id="passage_repaly_my_input" ></div>
			
			<!-- Reply Content 所有的类容需要包装在一起 ul li标签来解决 -->
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
		</div>
		</div>
	</div>
</div>
</div>
<div class="my_foot"></div>
</body>
</html>
