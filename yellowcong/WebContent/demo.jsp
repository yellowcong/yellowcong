<!-- 
	插件的源码显示
	@author yellowcong
	@date 2016-2-25
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>yellowcongの插件</title>
<link type="image/x-icon"
		href="<%=request.getContextPath()%>/resources/img/login/logo.jpg"
		rel="shortcut icon" />

<!-- bootstrap 的样式 -->
<link rel="stylesheet"  type="text/css" href="<%=request.getContextPath()%>/resources/css/bootstrap.css"/>

<!-- pretty 好看的显示样式 -->
<link rel="stylesheet"  type="text/css" href="<%=request.getContextPath()%>/resources/css/prettify.css"/>


<!-- pretty 好看的显示样式 -->
<link rel="stylesheet"  type="text/css" href="<%=request.getContextPath()%>/resources/css/yellowcong.easyui.css"/>
<%-- <link rel="stylesheet"  type="text/css" href="<%=request.getContextPath()%>/resources/css/style.css"/>
 --%>

<style type="text/css">
	body{
		/* overflow-y: hidden; */
	}
	.plugin_description{
		margin-top: 20px;
	}
	.plugin_demo{
		margin-bottom: 20px;
		width: 100%;
	}
	
	/*
	标签的样式
	*/
	.note{
		border-color: #5BC0DE;
		background: #D9EDF7 none repeat scroll 0% 0%;	
	}
	.note-info{
		margin: 0px 0px 20px;
		padding: 15px 30px 15px 15px;
		border-left: 3px solid #5BC0DE;
		border-radius: 0px !important;
	}
</style>
<!-- 加载js -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery.yellowcong.easyui.js"></script>
<!-- 加载js -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
	<!-- 倒入prettify 的js文件 -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/prettify.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/raphael-min.js"></script>

		<!-- 字符的样式 -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/font/css/font-awesome.css" type="text/css" /> 

<script type="text/javascript">
$(function(){
	
	var projectName = $("#projectName").val();
	/*
	id
major
createDate
class
user_code
username
	*/
	//定义的表格使用的插件代码，我们的命名规范是 页面名称_内容
	$(".yellowcong_datagrid").datagrid({
		url:projectName +'/data.jsp',
		idField:"id",
		rownumbers:true,
		pagination:true,
		columns:[
			{field:'id',title:'编号',width:50,hidden:false,checkbox:true},
			{field:'user_code',title:'学号',width:150,align:"right"},
			{field:'username',title:'用户名',align:"center",
				formatter: function(value,row,index){
					if(value == "yellowcong"){
						return "我是你大锅";
					}else{
						return value;
					}
				}	
			},
			{field:'createDate',title:'创建日期'},
		{field:'major',
		title:'专业',
		width:200,
		hidden:false,
		styler:function(value,row,index){
			if(row.id >2){
				return 'color:red;';
			}else{
				return "color:#000;";
			}
		}
		},
		{field:'class',title:'班级',
		styler:function(value,row,index){
			if(row.id >0){
				return 'color:red;';
			}
		},
		hidden:false,
		formatter: function(value,row,index){
			if(row.id>1){
				//<span class="label label-danger">未激活</span>
				return '<span class="label label-success">'+value+"</span>";
			}else{
				return '<span class="label label-danger">'+value+"</span>";
			}
		}},
			
		],
	});
	
	/**
	styler:function(value,row,index){
	//这个地方获取的是原先的数据
	if (!row.majorClass){
		return 'color:red;';
	}
}
	
	*/
	
	//查找的案例
	$(".search_demo").searchbox({prompt:"总有刁民想害朕",height:50,width:500,menu:[{title:"男人",iconCls:"fa-search"},{title:"女人"},{title:"外星人",iconCls:"fa-cog"},]});
	//下拉menu的案例
	$(".dropmenu_demo").dropmenu({menu:[{title:"男人",iconCls:"fa-search"},{title:"女人"},{title:"外星人",iconCls:"fa-cog"},],menuWidth:50});
	
	//分页显示
	//pagination 和我们的dategrid 耦合性太强，分开使用，我们需要根据dategrid传递参数
	//$(".pagination_demo").pagination({url:"dd"});
	
	
	//导航栏目的数据
	$(".navs_demo").navs({
		//menu数据
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
	
	//时间经验的数据
	$("#experienceTimeLine_demo").drawExperienceTimeLine({
		info:"1994年10月，出生",
			//legend可以输入几排的数据，大概15个标签
			//color 第一组数据的颜色 ，title 数据的标题
			legend:[{color:"#97BE0D",title:"学习"},{color:"RED",title:"LOL"},{color:"#88B8E6",title:"开发经历"}],
	 		//weight 可以是小数
	 		//exp 经验数据  date 是日期，title 是我们的标题  blank 是备注
			exp:[[{date:"2012.09 - 2014.09",title:"学习JAVA&android和前台网页制作"}],
			     [
			      {date:"2012.09 - 2014.09",title:"学习JAVA&android和前台网页制作",blank:""},
			     {date:"2012.09 - 2014.09",title:"学习JAVA&android和前台网页制作",blank:""},
			     {date:"2012.09 - 2014.09",weight:3,title:"学习JAVA&android和前台网页制作",blank:""}
			     ],
			     [
				{date:"2014.09 - 2014.11",weight:"2",title:"个人网站开发",blank:"Spring+Struts+Hibernate"},
				{date:"2015.01 - 2015.05",weight:"1.4",title:"环境与化工学院网站开发(java/python)",blank:"Spring+Struts+Hibernate"},
				{date:"2015.06 - 2015.10",title:"环境工程专业网站开发",blank:"Spring+Struts+Hibernate"},
				{date:"2015.10 - 至今",title:"找工作ing",blank:""},
				{date:"2015.10 - 至今",title:"找工作ing",blank:""},
			      ]]		 			
		});
	
	//skill_demo
	//添加skill 的案例
	$(".skill_demo").drawSkillsArc({
		//右边的小框框
		info:"{3年}\r\njava开发经历",
		showTitle:true, //是否显示标题，默认显示
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
	
	
	//联系别人的那种按钮的制作
	$(".connect_demo").socialConnect({
		background:"gray",
		menus:[{iconCls:"fa-envelope",href:"mailto:me@zhangwenli.com"},
		       {iconCls:"fa-qq",href:"#"},
		       {iconCls:"fa-github",href:"#"},
		       {iconCls:"fa-weixin",href:"#"},
		       {iconCls:"fa-weibo",href:"#",blank:false},
		       //来自己定义颜色
		       {iconCls:"fa-user",href:"#",color:"red"},
		       {iconCls:"fa-phone",href:"186-0460-0631"}
		 ],
		 //设定样好似 这个是根据自己需要的样式来,一下子定义多个，但是这个比较的麻烦不建议，我觉得自己设计得还是不错的
		 //style:{'fa-qq':'yellow',}
			
	});
	
	//定义一个navtop
	$(".nav_top_demo").navTop({names:[{href:'#',title:'首页',select:true},
	             				{href:'#',title:'前端开发'},
	            				{href:'#',title:'后端开发'},
	            				{href:'#',title:'云计算'},
	            				{href:'#',title:'大数据'},
	            				{href:'#',title:'虚拟化'},
	            				{href:'#',title:'登录',tips:true},
	            				{href:'#',title:'站长',tips:true}],
	            		logo:"/yellowcong/resources/img/login/logo.jpg",
	            		cname:"yellowcongの博客"});
	
	
	//定义导航左边栏目
	$(".nav_page_demo").navPage({title:"全部分类",
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
									   	]},{name:"后端开发",url:"#",
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
															   	]},
												   	]}]
							});
	
	
	//文章数据显示
	
	//文章显示
	$(".nav_page_show_demo").psgsShow({
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

	//底部导航栏的使用
	$(".nav_page_foot_demo").psgsFoot({
		
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
	
	
	//左侧导航栏数据的更新
	$(".nav_Page2_demo").navPage2({
		
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
	
});
</script>
<script type="text/javascript">
$(function () {
	$("body").prettify({selectors:[".nav_Page2_code",".nav_page_foot_code",".nav_page_show_code",".nav_page_code",".nav_top_code",".connect_use",".skill_use",".timeline_use",".navs_use",".dropmenu_use",".search_use",".pagination_use",".dategrid_js",".dategrid_code",".dategrid_use",
	                               ".prefitty_use",".prefitty_demo",".prefitty_code",".prefitty_js"]});
	//格式化输出代码样式，将数据格式化输出
	//window.clipboardData.setData("Text","yellowcong");
	
	//复制数据,在不同的浏览器中还是有问题点的
	//new Date().toLocalString()
	//获取浏览器的地址
	//var date = this.location.href;
	//console.log(date);
	//toLocalString("hehe");
	//$.toLocalString("你是三炮");
	//console.log(typeof true);
	
	//String测试 是否相等
	//console.log("String是否相等"+new String("yeq").equals("yeq"));
	
	//String测试 是否相等 不计较大小写
	//console.log("String是否相等"+new String("yellow").equalsIgnoreCase(new String("YELLOW")));
	
	//ip数据测试 
	//console.log($.isString(false));
	//console.log("Ip测试结果"+"129.212.212.222".isIP());
	
	//email测试
	//console.log("Email测试"+"yellowcong@qq.com".isEmail());
	
	//url测试
	//console.log("URL测试"+"https://yellowcong.com".isUrl());
	
	//num 测试
	//console.log("num测试"+"fdadfad".isNum());
	
	//Date日期测试
	//console.log("Date测试"+(new Date()+"").isDate());
	
	
	//手机号测定
	//match(/1[3,5,8][0-9]{9}+/g)
	//console.log("13337619492".isPhone());
	
	
	//Date转换 String类型的数据
	//console.log("Date转换测试"+);
	
	//日期格式化工具
	/* console.log("日期格式化测试"+(("2015-02-21 20:20:20").dateParse()).formate("yyyy-mm-dd"));
	console.log("日期格式化测试"+(("2015-02-21 20:20:20").dateParse()).formate("hh:mm:ss"));
	console.log("日期格式化测试"+(("2015-02-21 20:20:20").dateParse()).formate("yyyy-mm-dd hh:mm:ss"));
	console.log(new Date().formate("yyyy/mm/dd"));
	 */
	
//	var bool = /\d{1,4}\W\d{1,2}\W\d{1,2} \d{1,2}\W\d{1,2}\W\d{1,2}/.test("2015-02-21 20:20:20");
	//console.log(bool);
	//"".equal("");
});
</script>
</head>
<body>
	<input id="projectName" type="hidden" value="<%=request.getContextPath()%>"/>
	<div class="container">
	
	<div class="content_head_page">
		<h1 class="head-pager">14、nav左侧导航<small>的使用</small></h1>
		<div class="plugin_description">
			<blockquote class="note note-info">
				<p>简化导航栏目的配置操作</p>
				<small>
					<cite>狂飙のyellowcong</cite><br/>
					<cite>2016-3-23</cite>
				</small>
			</blockquote>
		</div>
		<h3>使用方法</h3>
<div class="nav_Page2_code">
//将多个的sub嵌套转换为多维数组来解决数据嵌套问题，一般用二维数组，过多的嵌套，头疼
$(".nav_Page2_demo").navPage2({
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
</div>
	<h3>案例</h3><br/>
			<div  class="nav_Page2_demo">
	</div>		
		
	</div>
	<div class="content_head_page">
		<h1 class="head-pager">13、文章底部数据<small>显示</small></h1>
		<div class="plugin_description">
			<blockquote class="note note-info">
				<p>底部的数据显示</p>
				<small>
					<cite>狂飙のyellowcong</cite><br/>
					<cite>2016-3-22</cite>
				</small>
			</blockquote>
		</div>
		<h3>使用方法</h3>
<div class="nav_page_foot_code">

$(".nav_page_foot_demo").psgsFoot({
	
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
</div>
	<h3>案例</h3><br/>
			<div  class="nav_page_foot_demo">
	</div>		
		
	</div>
	
	<div class="content_head_page">
		<h1 class="head-pager">12、文章数据条例<small>显示</small></h1>
		<div class="plugin_description">
			<blockquote class="note note-info">
				<p>文章数据显示,搞定我们的数据显示</p>
				<small>
					<cite>狂飙のyellowcong</cite><br/>
					<cite>2016-3-22</cite>
				</small>
			</blockquote>
		</div>
		<h3>使用方法</h3>
<div class="nav_page_show_code">
$(".nav_page_show_demo").psgsShow({
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
</div>
	<h3>案例</h3><br/>
			<div  class="nav_page_show_demo">
	</div>		
		
	</div>
	
	<div class="content_head_page">
		<h1 class="head-pager">11、左侧极客学院的导航栏目<small>的使用</small></h1>
		<div class="plugin_description">
			<blockquote class="note note-info">
				<p>左侧导航栏目,模仿 了我们的极客学院</p>
				<small>
					<cite>狂飙のyellowcong</cite><br/>
					<cite>2016-3-17</cite>
				</small>
			</blockquote>
		</div>
		<h3>使用方法</h3>
<div class="nav_page_code">

$(".nav_page_demo").navPage({title:"全部分类",
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
			   	]},
		   	]},
		   	{name:"后端开发",url:"#",
				//二级子标题
				 sub:[{name:"后端基础",url:"#",
				    //三级子标题
				   	sub:[
				   	     {name:"Java",url:"#"},
			   	 		 {name:"Python",url:"#"},
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
					   ]},
	]}]
});
</div>
	<h3>案例</h3><br/>
			<div  class="nav_page_demo">
	</div>		
		
	</div>
	
	<div class="content_head_page">
		<h1 class="head-pager">10、顶部导航栏目<small>的使用</small></h1>
		<div class="plugin_description">
			<blockquote class="note note-info">
				<p>顶部导航栏目</p>
				<small>
					<cite>狂飙のyellowcong</cite><br/>
					<cite>2016-3-16</cite>
				</small>
			</blockquote>
		</div>
		<h3>使用方法</h3>
<div class="nav_top_code">

$(".nav_top_demo").navTop({
    //名称，
	/*
		href 是连接地址
		title 是导航栏标题
		select  是否选中
		tips 左侧的小东西
	*/
	names:[{href:'#',title:'首页',select:true},
			{href:'#',title:'前端开发'},
			{href:'#',title:'后端开发'},
			{href:'#',title:'云计算'},
			{href:'#',title:'大数据'},
			{href:'#',title:'虚拟化'},
			{href:'#',title:'登录',tips:true},
			{href:'#',title:'站长',tips:true}],
		//logo地址
		logo:"/yellowcong/resources/img/login/logo.jpg",
		//中文标题
		cname:"yellowcongの博客",
		//英文标题
		ename:"xxx"});
</div>
	<h3>案例</h3><br/>
			<div  class="nav_top_demo">
	</div>		
		
	</div>
	
	<div class="content_skill">
		<h1 class="head-pager">9、connect<small>的使用</small></h1>
		<div class="plugin_description">
			<blockquote class="note note-info">
				<p>用来做联系和分享用，可以自己定义默写数据的颜色</p>
				<small>
					<cite>狂飙のyellowcong</cite><br/>
					<cite>2016-1-27</cite>
				</small>
			</blockquote>
		</div>
		<h3>使用方法</h3>
<div class="connect_use">
$(".connect_demo").socialConnect({
		//设定背景色
		background:"#eee",
		//设定字体颜色
		//color:"",
		//设定菜单
		//color 设定hover上去的颜色
		//联系别人的那种按钮的制作
		menus:[{iconCls:"fa-envelope",href:"mailto:me@zhangwenli.com"},
		       {iconCls:"fa-qq",href:"#"},
		       {iconCls:"fa-github",href:"#"},
		       {iconCls:"fa-weixin",href:"#"},
		       //默认情况下blank是设定为true,是否重新打开一个页面
		       {iconCls:"fa-weibo",href:"#",blank:false},
		       //来自己定义颜色,在后面设定联系人的hove 颜色
		       {iconCls:"fa-user",href:"#",color:"red"},
		       {iconCls:"fa-phone",href:"186-0460-0631"}
		 //设定样好似 这个是根据自己需要的样式来,一下子定义多个，但是这个比较的麻烦不建议，我觉得自己设计得还是不错的
		 //style:{'fa-qq':'yellow',}
			
	});
		 ],
		 //设定样好似 这个是根据自己需要的样式来,一下子定义多个，但是这个比较的麻烦不建议，我觉得自己设计得还是不错的
		 //设定样好似 这个是根据自己需要的样式来
		 //style:{'fa-qq':'yellow',}
});
</div>
	<h3>案例</h3>
			<div class="connect_demo">
</div>		
		
	</div>
	<div class="content_skill">
		<h1 class="head-pager">9、skill<small>的使用</small></h1>
		<div class="plugin_description">
			<blockquote class="note note-info">
				<p>用来做出图形数据来做简历或则数据分析</p>
				<small>
					<cite>狂飙のyellowcong</cite><br/>
					<cite>2016-1-27</cite>
				</small>
			</blockquote>
		</div>
		<h3>使用方法</h3>
<div class="skill_use">
$(".skill_demo").drawSkillsArc({
	//右边的小框框
	info:"{3年}\r\njava开发经历",
	showTitle:true, //是否显示标题，默认显示
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
</div>
	<h3>案例</h3>
			<div class="skill_demo">
</div>		
		
	</div>
	<div class="content_navs">
		<h1 class="head-pager">8、timeline<small>的使用</small></h1>
		<div class="plugin_description">
			<blockquote class="note note-info">
				<p>这个是经验时间的进度条，我本来想做成两边显示的，但是后来由于没有网，不好查文档，等有网了再说</p>
				<small>
					<cite>狂飙のyellowcong</cite><br/>
					<cite>2016-1-27</cite>
				</small>
			</blockquote>
		</div>
		<h3>使用方法</h3>
<div class="timeline_use">
//注意我们使用这个方法的时候，我们调用的是他的id而不是class 这个要清楚
$("#experienceTimeLine_demo").drawExperienceTimeLine({
		//我们能设定了autoHeight:false,后才可以设定height这个属性
		height:700,  
		//默认情况是true,表示自动增长
		autoHeight:true,
		info:"1994年10月，出生",
		//legend可以输入几排的数据，大概15个标签
		//color 第一组数据的颜色 ，title 数据的标题
		legend:[{color:"#97BE0D",title:"学习"},{color:"RED",title:"LOL"},{color:"#88B8E6",title:"开发经历"}],
		//weight 可以是小数，表示权重，用来显示园圈圈的大小
		//exp 经验数据  date 是日期，title 是我们的标题  blank 是备注
		exp:[[{date:"2012.09 - 2014.09",title:"学习JAVA&android和前台网页制作"}],
		     [
		      {date:"2012.09 - 2014.09",title:"学习JAVA&android和前台网页制作",blank:""},
		     {date:"2012.09 - 2014.09",title:"学习JAVA&android和前台网页制作",blank:""},
		     {date:"2012.09 - 2014.09",weight:3,title:"学习JAVA&android和前台网页制作",blank:""}
		     ],
		     [
			{date:"2014.09 - 2014.11",weight:"2",title:"个人网站开发",blank:"Spring+Struts+Hibernate"},
			{date:"2015.01 - 2015.05",weight:"1.4",title:"环境与化工学院网站开发(java/python)",blank:"Spring+Struts+Hibernate"},
			{date:"2015.06 - 2015.10",title:"环境工程专业网站开发",blank:"Spring+Struts+Hibernate"},
			{date:"2015.10 - 至今",title:"找工作ing",blank:""},
			{date:"2015.10 - 至今",title:"找工作ing",blank:""},
	      ]]		 			
});
</div>
	<h3>案例</h3>
			<div class="timeline_demo" id="experienceTimeLine_demo">
</div>		
		
	</div>
	<!-- nav使用方法介绍 -->
	<div class="content_navs">
		<h1 class="head-pager">6、nav<small>的使用</small></h1>
		<div class="plugin_description">
			<blockquote class="note note-info">
				<p>垂直导航栏的使用,这个是竖的，我们还可以做一个横向的</p>
				<small>
					<cite>狂飙のyellowcong</cite><br/>
					<cite>2016-1-26</cite>
				</small>
			</blockquote>
		</div>
		<h3>使用方法</h3>
<div class="navs_use">
//iconClas的样式是我们的 font-awesonme.css 中的图标样式
$(".navs_demo").navs({
	//宽度，默认是250
	width:250,
	//设定的菜单
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
</div>
	<h3>案例</h3>
			<div class="navs_demo">
</div>		
		
	</div>
	
	<!-- 下拉菜单文档 -->	
	<div class="content_dropmenu">
		<h1 class="head-pager">5、dropmenu<small>的使用</small></h1>
		<div class="plugin_description">
			<blockquote class="note note-info">
				<p>下拉菜单的使用</p>
				<small>
					<cite>狂飙のyellowcong</cite><br/>
					<cite>2016-1-26</cite>
				</small>
			</blockquote>
		</div>
		<h3>使用方法</h3>
<div class="dropmenu_use">
$(".dropmenu_demo").dropmenu({
	//下拉菜单的宽度
	menuWidth:50,
	//下拉菜单
	menu:[
		{title:"男人",iconCls:"fa-search"},
		{title:"女人"},
		{title:"外星人",iconCls:"fa-cog"}
	]
});
</div>
	<h3>案例</h3>
			<div class="dropmenu_demo">
</div>		
		
	</div>
	<!-- 查询框  文档 -->
	<div class="content_searchbox">
		<h1 class="head-pager">4、searchbox<small>的使用</small></h1>
		<div class="plugin_description">
			<blockquote class="note note-info">
				<p>用于数据数据的查询操作</p>
				<small>
					<cite>狂飙のyellowcong</cite><br/>
					<cite>2016-1-18</cite>
				</small>
			</blockquote>
		</div>
		<h3>使用方法</h3>
<div class="search_use">
$(".search_demo").searchbox({
	//默认信息
	prompt:"总有刁民想害朕",
	//高度
	height:50,
	//宽度
	width:500,
	//下拉菜单
	menu:[
		{title:"男人",iconCls:"fa-search"},
		{title:"女人"},
		{title:"外星人",iconCls:"fa-cog"}
	],
	//处理方法
	searcher:function(value,name){} 
});
</div>
	<h3>案例</h3>
			<div class="search_demo">
</div>		
		
	</div>
	<br/>
	<!-- pagination分页 文档 -->
	<div class="content_pagination">
		<h1 class="head-pager">3、pagination<small>的使用</small></h1>
		<div class="plugin_description">
			<blockquote class="note note-info">
				<p>用于数据的分页显示操作</p>
				<small>
					<cite>狂飙のyellowcong</cite><br/>
					<cite>2016-1-18</cite>
				</small>
			</blockquote>
		</div>
		<h3>使用方法</h3>
<div class="pagination_use">
$(".pagination_demo").pagination();
</div>
	<h3>案例</h3>
			<div class="pagination_demo">
</div>		
		
	</div>
	<br/>
	<!-- pretty 使用文档 -->
	<div class="content_prettiy">
		<h1 class="head-pager">1、prettify<small>的使用</small></h1>
		<div class="plugin_description">
			<blockquote class="note note-info">
				<p>用于代码的源码显示操作</p>
				<small>
					<cite>狂飙のyellowcong</cite><br/>
					<cite>2016-1-18</cite>
				</small>
			</blockquote>
		</div>
			<h3>使用方法</h3>
<div class="prefitty_use">
//直接调用,这个我们需要选中上一个对象作为父对象，然后格式化代码显示 
$("body").prettify({
	//我们行号是否显示
	linenums:true,
	//是否转换，将html < > 转换为可以识别的数据
	trans:true,
	//多个选择器
	selectors:[] //必选字段
});
</div>

		<div class="plugin_introduce">
			<h3>案例</h3>
			<div class="prefitty_demo">
//显示源代码数据
public class Demo{
	public static void main(String [] args){
		System.out.print("yellowcong");
	}
}
</div>		
	
	<h3>实现代码</h3>
	
	<h4>界面代码</h4>
			<div class="prefitty_code">
<div class="prefitty_xx">
//显示源代码数据
public class Demo{
	public static void main(String [] args){
		System.out.print("yellowcong");
	}
}
</div>
</div>
<h4>js代码</h4>
<div class="prefitty_js">
$(function () {
	//这个 selectors 中可以传递多个选择器进行渲染操作
	$("body").prettify({selectors:[".prefitty_xx"]});
});
</div>
			
	</div>
	</div>
	<br/>
	<!-- datagrid的使用说明文档 -->
	<div class="content_datagrid">
			<div class="content_datagrid">
				<h1 class="head-pager">2、datagrid<small>的使用</small></h1>
				<div class="plugin_description">
					<blockquote class="note note-info">
					<p>用于表格的显示操作,部分功能参考的easyui设计,通过这种设计方法，可以大大的节省我们的前台开发操作</p>
					<small>
						<cite>狂飙のyellowcong</cite><br/>
						<cite>2016-1-17</cite>
					</small>
					</blockquote>
				</div>
							<h3>使用方法</h3>
	<div class="dategrid_use">
	$(".yellowcong_datagrid").datagrid({
		url:projectName +'/data.jsp',
		idField:"id",
		//行的numbers是否显示
		rownumbers:true,
		//是否分页，默认分页
		pagination:false,
		columns:[
			{field:'id',title:'编号',width:50,hidden:false,checkbox:true},
			{field:'user_code',title:'学号',width:150,align:"right"},
			{field:'username',title:'用户名',align:"center",
				formatter: function(value,row,index){
					if(value == "yellowcong"){
						return "我是你大锅";
					}else{
						return value;
					}
				}	
			},
			{field:'createDate',title:'创建日期'},
		{field:'major',
		title:'专业',
		width:200,
		hidden:false,
		styler:function(value,row,index){
			if(row.id >2){
				return 'color:red;';
			}else{
				return "color:#000;";
			}
		}
		},
		{field:'class',title:'班级',
		styler:function(value,row,index){
			if(row.id >0){
				return 'color:red;';
			}
		},
		hidden:false,
		formatter: function(value,row,index){
			if(row.id>1){
				//<span class="label label-danger">未激活</span>
				return '<span class="label label-success">'+value+"</span>";
			}else{
				return '<span class="label label-danger">'+value+"</span>";
			}
		}},
			
		],
	});
	</div>
				<div class="plugin_introduce">
	<div class="plugin_introduce">
				<h3>案例</h3>
				<div class="dategrid_demo">
	<div class="yellowcong_datagrid"></div>
	</div>		
		<br/>
		<h3>实现代码</h3>
		
		<h4>界面代码</h4>
				<div class="dategrid_code">
	<div class="yellowcong_datagrid_xx"></div>
	</div>
	<h4>js代码</h4>
	<div class="dategrid_js">
	代码就是我们的使用方法中的代码,数据是json格式的
	{"pageSize":10,"pageNow":1,"rowCount":4,"pageCount":1,"data":[{"id":2,"user_code":"2012020891","username":"yellowcong","class":"环境12-1","major":"环境工程","createDate":"2012-02-02"},{"id":3,"user_code":"2012020891","username":"yellowcong","class":"环境12-1","major":"环境工程","createDate":"2012-02-02"},{"id":1,"user_code":"2012020891","username":"yellowcong","class":"环境12-1","major":"环境工程","createDate":"2012-02-02"},{"id":1,"user_code":"2012020891","username":"yellowcong","class":"环境12-1","major":"环境工程","createDate":"2012-02-02"}]} 
	</div>
					
				</div>
				</div>
	</div>
		</div>
	<br/>
</div>
</body>
</html>