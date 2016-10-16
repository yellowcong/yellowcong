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
 <script type="text/javascript" name="baidu-tc-cerfication" data-appid="8085176" src="http://apps.bdimg.com/cloudaapi/lightapp.js"></script> 
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
		
		$(".nav_page_left").navPage2({
			
			title:"全部分类",
			//大的菜单名称,多级菜单 name访问的url
			menus:[{name:"前端开发",url:"#",
				//二级子标题 name ,访问的url
				   sub:[[{name:"前端基础",url:"#",title:true},{name:"HTML",url:"#"}, {name:"CSS",url:"#"},{name:"JavaScript",url:"#"}],
				        [{name:"前端进阶",url:"#",title:true},{name:"jQuery",url:"#"}, {name:"BootStrap",url:"#"},	 {name:"Ztree",url:"#"},{name:"Three.js",url:"#"},{name:"Raphael",url:"#"},{name:"EasyUI",url:"#"},{name:"Extjs",url:"#"}],
				       ]
					},
					{name:"后端开发",url:"#",
						//二级子标题 name ,访问的url
						   sub:[[{name:"后端基础",url:"#",title:true},{name:"Java",url:"#"}, {name:"Python",url:"#"},{name:"PHP",url:"#"},{name:"NodeJs",url:"#"}],
						        [{name:"后端进阶",url:"#",title:true},{name:"Mysql",url:"#"}, {name:"Hibernate",url:"#"},	 {name:"Mybatis",url:"#"},{name:"JavaWeb",url:"#"},{name:"Struts1.x",url:"#"},{name:"Struts2.x",url:"#"},{name:"Springmvc",url:"#"},{name:"Spring",url:"#"}],
						        [{name:"后端高级",url:"#",title:true},{name:"Luence",url:"#"}, {name:"Hadoop",url:"#"},	 {name:"WebService",url:"#"},{name:"Moongodb",url:"#"},{name:"Redis",url:"#"},{name:"Memcache",url:"#"},{name:"Git",url:"#"},{name:"Maven",url:"#"}],
						       ]
				  },
				  {name:"大数据",url:"#",
						//二级子标题 name ,访问的url
						   sub:[[{name:"大数据基础",url:"#",title:true},{name:"Linux",url:"#"}, {name:"SSH",url:"#"},{name:"Shell",url:"#"}],
						        [{name:"大数据进阶",url:"#",title:true},{name:"Openstack",url:"#"}, {name:"Docker",url:"#"},{name:"虚拟机",url:"#"}],
						       ]
				  },
				  {name:"虚拟化",url:"#",
						//二级子标题 name ,访问的url
						   sub:[[{name:"后端基础",url:"#",title:true},{name:"Java",url:"#"}, {name:"Python",url:"#"},{name:"PHP",url:"#"},{name:"NodeJs",url:"#"}],
						        [{name:"后端进阶",url:"#",title:true},{name:"Mysql",url:"#"}, {name:"Hibernate",url:"#"},	 {name:"Mybatis",url:"#"},{name:"JavaWeb",url:"#"},{name:"Struts1.x",url:"#"},{name:"Struts2.x",url:"#"},{name:"Springmvc",url:"#"},{name:"Spring",url:"#"}],
						        [{name:"后端高级",url:"#",title:true},{name:"Luence",url:"#"}, {name:"Hadoop",url:"#"},	 {name:"WebService",url:"#"},{name:"Moongodb",url:"#"},{name:"Redis",url:"#"},{name:"Memcache",url:"#"},{name:"Git",url:"#"},{name:"Maven",url:"#"}],
						       ]
				  },
				  {name:"讨论",url:"#",
						//二级子标题 name ,访问的url
						   sub:[[{name:"后端基础",url:"#",title:true},{name:"Java",url:"#"}, {name:"Python",url:"#"},{name:"PHP",url:"#"},{name:"NodeJs",url:"#"}],
						        [{name:"后端进阶",url:"#",title:true},{name:"Mysql",url:"#"}, {name:"Hibernate",url:"#"},	 {name:"Mybatis",url:"#"},{name:"JavaWeb",url:"#"},{name:"Struts1.x",url:"#"},{name:"Struts2.x",url:"#"},{name:"Springmvc",url:"#"},{name:"Spring",url:"#"}],
						        [{name:"后端高级",url:"#",title:true},{name:"Luence",url:"#"}, {name:"Hadoop",url:"#"},	 {name:"WebService",url:"#"},{name:"Moongodb",url:"#"},{name:"Redis",url:"#"},{name:"Memcache",url:"#"},{name:"Git",url:"#"},{name:"Maven",url:"#"}],
						       ]
				  },
				  {name:"关于",url:"#",
						//二级子标题 name ,访问的url
						   sub:[[{name:"后端基础",url:"#",title:true},{name:"Java",url:"#"}, {name:"Python",url:"#"},{name:"PHP",url:"#"},{name:"NodeJs",url:"#"}],
						        [{name:"后端进阶",url:"#",title:true},{name:"Mysql",url:"#"}, {name:"Hibernate",url:"#"},	 {name:"Mybatis",url:"#"},{name:"JavaWeb",url:"#"},{name:"Struts1.x",url:"#"},{name:"Struts2.x",url:"#"},{name:"Springmvc",url:"#"},{name:"Spring",url:"#"}],
						        [{name:"后端高级",url:"#",title:true},{name:"Luence",url:"#"}, {name:"Hadoop",url:"#"},	 {name:"WebService",url:"#"},{name:"Moongodb",url:"#"},{name:"Redis",url:"#"},{name:"Memcache",url:"#"},{name:"Git",url:"#"},{name:"Maven",url:"#"}],
						       ]
				  },
			]
		});
		
		//文章显示
		$(".nav_pages_right").psgsShow({
			//导航栏目菜单
			navsMenu:{title:"移动开发",
					navs:[[{name:"最新",url:"#",select:true},{name:"最热",url:"#"},{name:"最新",url:"#"},{name:"最火",url:"#"}],
                          [{name:"查看次数",url:"#",select:true},{name:"查看最多",url:"#"},{name:"查看最多",url:"#"}],
                          [{name:"评分",url:"#",select:true},{name:"查看最多",url:"#"},{name:"评论最多",url:"#"}],
                    ]},
                    //文章 psgUrl是路径， title 是日期，imgUrl是图片地址，date是日期， see 查看次数  useranme 名称  disc描述  good 好  bad 差
			 psgs:[{psgUrl:"#",title:"绘制专业的产品原型应用示例：猿题库 App 产品原型设计",imgUrl:"/yellowcong/resources/img/demo/56eb5e43e9b52.jpg",date:"2016-10-10",see:100,username:"yellowcong",disc:"本课程通过猿题库产品原型设计，来讲解如何绘制专业的产品原型设计，如何绘制好专业的产品原型，如何写好产品原型的",reply:100,good:100,bad:100},
			       {psgUrl:"#",title:"绘制专业的产品原型应用示例：猿题库 App 产品原型设计",imgUrl:"/yellowcong/resources/img/demo/56eb5e43e9b52.jpg",date:"2016-10-10",see:100,username:"yellowcong",disc:"本课程通过猿题库产品原型设计，来讲解如何绘制专业的产品原型设计，如何绘制好专业的产品原型，如何写好产品原型的",reply:100,good:100,bad:100},
			       {psgUrl:"#",title:"绘制专业的产品原型应用示例：猿题库 App 产品原型设计",imgUrl:"/yellowcong/resources/img/demo/56eb5e43e9b52.jpg",date:"2016-10-10",see:100,username:"yellowcong",disc:"本课程通过猿题库产品原型设计，来讲解如何绘制专业的产品原型设计，如何绘制好专业的产品原型，如何写好产品原型的",reply:100,good:100,bad:100},
			       {psgUrl:"#",title:"绘制专业的产品原型应用示例：猿题库 App 产品原型设计",imgUrl:"/yellowcong/resources/img/demo/56eb5e43e9b52.jpg",date:"2016-10-10",see:100,username:"yellowcong",disc:"本课程通过猿题库产品原型设计，来讲解如何绘制专业的产品原型设计，如何绘制好专业的产品原型，如何写好产品原型的",reply:100,good:100,bad:100},
			       {psgUrl:"#",title:"绘制专业的产品原型应用示例：猿题库 App 产品原型设计",imgUrl:"/yellowcong/resources/img/demo/56eb5e43e9b52.jpg",date:"2016-10-10",see:100,username:"yellowcong",disc:"本课程通过猿题库产品原型设计，来讲解如何绘制专业的产品原型设计，如何绘制好专业的产品原型，如何写好产品原型的",reply:100,good:100,bad:100},
			       {psgUrl:"#",title:"绘制专业的产品原型应用示例：猿题库 App 产品原型设计",imgUrl:"/yellowcong/resources/img/demo/56eb5e43e9b52.jpg",date:"2016-10-10",see:100,username:"yellowcong",disc:"本课程通过猿题库产品原型设计，来讲解如何绘制专业的产品原型设计，如何绘制好专业的产品原型，如何写好产品原型的",reply:100,good:100,bad:100},
			       {psgUrl:"#",title:"绘制专业的产品原型应用示例：猿题库 App 产品原型设计",imgUrl:"/yellowcong/resources/img/demo/56eb5e43e9b52.jpg",date:"2016-10-10",see:100,username:"yellowcong",disc:"本课程通过猿题库产品原型设计，来讲解如何绘制专业的产品原型设计，如何绘制好专业的产品原型，如何写好产品原型的",reply:100,good:100,bad:100},
			       {psgUrl:"#",title:"绘制专业的产品原型应用示例：猿题库 App 产品原型设计",imgUrl:"/yellowcong/resources/img/demo/56eb5e43e9b52.jpg",date:"2016-10-10",see:100,username:"yellowcong",disc:"本课程通过猿题库产品原型设计，来讲解如何绘制专业的产品原型设计，如何绘制好专业的产品原型，如何写好产品原型的",reply:100,good:100,bad:100},
			       {psgUrl:"#",title:"绘制专业的产品原型应用示例：猿题库 App 产品原型设计",imgUrl:"/yellowcong/resources/img/demo/56eb5e43e9b52.jpg",date:"2016-10-10",see:100,username:"yellowcong",disc:"本课程通过猿题库产品原型设计，来讲解如何绘制专业的产品原型设计，如何绘制好专业的产品原型，如何写好产品原型的",reply:100,good:100,bad:100}
			 ]                            
		});	
		
		//脚步数据
	 	
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
</div>

</div>
<div class="my_foot"></div>
</body>
</html>
