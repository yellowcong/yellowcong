<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>聪哥的简历</title>
	<!--pagepiling 的样式，这个必须导入进来 -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/jquery.pagepiling.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/font/css/font-awesome.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/jianli.css" />
	
	<link type="image/x-icon"
		href="<%=request.getContextPath()%>/resources/img/login/logo.jpg"
		rel="shortcut icon" />
     <!-- 必须添加2个必要的js文件 -->
	<script src="<%=request.getContextPath()%>/resources/js/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.pagepiling.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/raphael-min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/jquery.yellowcong.easyui.js"></script>
	
	<script type="text/javascript">

		$(document).ready(function() {
	    	$('#pagepiling').pagepiling({
	    		menu: null,
	    		//anchors: ['page1', 'page2', 'page3'],
	    		//设定颜色
			    //sectionsColor: ['#F5F5F5', '#FFFFFF','#F5F5F5', '#FFFFFF','#F5F5F5', '#FFFFFF','#F5F5F5', '#FFFFFF'],
			   sectionsColor: ['#22C3AA', '#22C3AA', '#22C3AA', '#22C3AA','#22C3AA', '#22C3AA'],
			   //导航栏目 
			   navigation: {
		            'textColor': '#000',
		            'bulletsColor': '#000',
		            'position': 'right',
		            //项目技能教育求职联系
		            'tooltips': ['首页', '项目', '技能', '教育','求职','联系']
		        },
		        //加载后的方法函数
			    afterLoad: function(anchorLink, index){
			    	//在加载后发生的事情
					 if(index == 2){
						 //去掉数据重复数据，然后画图
						$("#experienceTimeLine").html("");
						//写经验图            	
		            	$("#experienceTimeLine").drawExperienceTimeLine({
		            		font:{
					 			//标题点的字体样式
					 			"title":{ 
					 				"font-size": 16,
					 				 fill: "#FFF",
					 				"font-family":"Hiragino Sans GB, Microsoft YaHei, sans-serif",
					 				"text-anchor": "start"
					 			},
					 			//日期数据的字符
					 			"date":{
					 				"font-size": 14,
					 				 fill: "#9F3",
					 				"font-family":"Hiragino Sans GB, Microsoft YaHei, sans-serif",
					 				"text-anchor": "start"
					 			},
					 			//后面的备注，所写得数据
					 			"blank":{
					 				"font-size": 14,
					 				 fill: "#EEF3F0",
					 				"font-family": "Hiragino Sans GB, Microsoft YaHei, sans-serif",
					 				"text-anchor": "start"
					 			}
					 		},
					 		info:"1994年10月，出生",
				 			//var n = [["#97BE0D", 400, "学习"], ["#88B8E6", 530, "开发经历"]];
				 			//legend可以输入几排的数据，大概15个标签
				 			legend:[{color:"#97BE0D",title:"学习你妹"},{color:"#88B8E6",title:"开发经历"},{color:"red",title:"工作"}],
			 		 		/*
			 		 		t = [[130, 15, "#97BE0D", "2012.09 - 2014.09","学习JAVA&android和前台网页制作", ""],
							      [180, 20, "#88B8E6", "2014.09 - 2014.11", "个人网站开发", "Spring+Struts+Hibernate"], 
							      [250, 25, "#88B8E6", "2015.01 - 2015.05", "环境与化工学院网站开发(java/python)", "Spring+SpringMVC+Hibernate/django"], 
							      [380, 20, "#88B8E6", "2015.06 - 2015.10", "环境工程专业网站开发", "Spring+SpringMVC+Hibernate"], 
							      [480, 20, "#F74848", "2015.10 - 至今", "找工作ing", ""]];
			 		 		*/
			 		 		//weight 可以是小数
				 			exp:[[{date:"2012.09 - 2014.09",title:"学习JAVA&android和前台网页制作",blank:""}],
				 			     [
									{date:"2014.09 - 2014.11",weight:"2",title:"个人网站开发",blank:"Spring+Struts+Hibernate"},
									{date:"2015.01 - 2015.05",weight:"1.4",title:"环境与化工学院网站开发(java/python)",blank:"Spring+Struts+Hibernate"},
									{date:"2015.06 - 2015.10",title:"环境工程专业网站开发",blank:"Spring+Struts+Hibernate"},
				 			      ],[{date:"2015.10 - 至今",weight:"2.5",title:"找工作ing",blank:""}]]		 			
				 		});
						
					}
					console.log("当前页面\t"+index);
					//section 3
					if(index == 3){
						$(".skills_date").drawSkillsArc({
							showTitle:false,
		            		info:"{3年}\r\njava开发经历",
		            		menu:[
		            		      {title: "前台",score: "90",color: "#97BE0D",
		            				subtitle:[{title:"HTML&CSS",score:300},{title:"jQuery",score:200},{title:"Extjs",score:100},{title:"BootStrap",score:200},{title:"EasyUI",score:200}]
		            			   },
		            			   {title: "后台",score: "90",color: "#D84F5F",
		            					subtitle:[{title:"Srping",score:300},{title:"Springmvc",score:300},{title:"Struts",score:200},
		            					          {title:"Hibernate",score:300},{title:"Mybatis",score:300},{title:"Luence",score:300},
		            					          {title:"Webservice",score:300},]
		            			   },
		            			   {title: "数据库",score: "95",color: "#88B8E6",
		            				   subtitle:[{title:"Mysql",score:300},{title:"Oracle",score:300},{title:"Mongodb",score:200},{title:"Redis",score:100},{title:"Memcache",score:100}]},
		            			   {title: "Java&Python",score: "83",color: "#BEDBE9",subtitle:[{title:"Java",score:300},{title:"Python",score:200},{title:"Nodejs",score:100}]},
		            			   {title: "其他",score: "45",color: "pink",subtitle:[{title:"Android",score:200},{title:"SEO",score:100},{title:"LOL",score:300},{title:"打酱油",score:200}]}
		            		]
		            	});
					}
			    }
			});
	    	
    		
	    	$(".social-connect").socialConnect({
	    		menus:[{iconCls:"fa-envelope",href:"mailto:me@zhangwenli.com"},
	    		       {iconCls:"fa-qq",href:"#"},
	    		       {iconCls:"fa-github",href:"https://github.com/yellowcong"},
	    		       {iconCls:"fa-weixin",href:"#"},
	    		       {iconCls:"fa-weibo",href:"http://weibo.com/xiaophai1314/home"},
	    		 ]	
	    	});
	    	$("#section5 .call_me").socialConnect({
	    		menus:[{iconCls:"fa-phone",href:"186-0460-0631"}],
	    		style:{"fa-phone":"#169209"}
	    	});
	    });
    </script>
	
</head>
<body>
	<div id="pagepiling" class="content">
	    <div class="section" id="section1">
	  	  <!--评论者图标-->
				<div class="reply_icon">
					<div class="user_logo">
					<a title="黄聪"  target="_blank" href="#" rel="nofollow author">
						<img alt="狂飙のyellowcong" src="<%=request.getContextPath() %>/resources/img/login/yellowcong.gif"></img>
					</a>
					</div>
				</div>
	    	<h1>黄聪</h1>
			<p class="subtitle">最可怕的是，比我优秀的人比我还努力</p>
			<h3>Java工程师</h3>
			<p class="subtitle"><a class="highlight" href="mailto:me@zhangwenli.com">717350389@qq.com</a></p>
			<br />
	    </div>
	    <div class="section" id="section2">
	    		<h1>项目经验</h1>
	    		<div id="experienceTimeLine" ></div>
	    </div>
	    <div class="section" id="section3">
	    		<h1>工作学习经历</h1>
	    		<div class="skills_date" ></div>
	    </div>
	    <!-- <div class="section" id="section3">
	    		<h1>技能</h1>
	    		<div class="tags"><span class="tag expert">Java</span><span class="tag family">Python</span></div>
	    		<div class="tags"><span class="tag expert">html</span><span class="tag expert">css</span><span class="tag expert">Jquery</span><span class="tag expert">Ajax</span><span class="tag expert">BootStrap</span><span class="tag expert">EasyUI</span><span class="tag family">Extjs</span></div>
	    		<div class="tags"><span class="tag expert">Spring</span><span class="tag family">Struts1.x</span><span class="tag family">Struts2.x</span><span class="tag expert">SpringMVC</span></div>
	    		<div class="tags"><span class="tag expert">Hibernate</span><span class="tag family">Mybatis</span><span class="tag expert">Luence</span><span class="tag family">webservice</span><span class="tag family">android</span><span class="tag family">大数据</span></div>
	    		<div class="tags"><span class="tag expert">Mysql</span><span class="tag family">Oracle</span><span class="tag expert">Mongodb</span><span class="tag family">redis</span><span class="tag family">Memacache</span></div>
	    		<div class="tags"><span class="tag expert">SEO</span><span class="tag family">Photoshop</span><span class="tag expert">LOL</span></div>
	    </div> -->
	     <div class="section" id="section4">
	    	<div class="intro">
	    		<h1>求职意向</h1>
	    		<h2>Java工程师</h2>
	    		<p>做和Java相关的网站开发以及大数据开发</p>
	    		<h3>工作地点</h3>
	    		<p>个人比较随性,对于工作地点要求不高，对网速和妹子要求高</p>
	    		<h4>喜欢我的，赶快看我的联系方式吧!!!</h4>
	    	</div>
	    </div>
	     <div class="section" id="section5">
	    		<h1>联系方式</h1>
	    		<p class="call_me"></p><p>186-0460-0631</p>
	    		<h2>了解更多</h2>
	    		<div class="social-connect">
	    		</div>
	    		<h2><a href="#" class="highlight">下载简历</a></h2>
	    		<h2><a href="#" class="highlight">个人网站</a></h2>
	    </div>
	</div>
</body>
</html>