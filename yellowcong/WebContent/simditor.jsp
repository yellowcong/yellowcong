<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/simditor-2.3.6/styles/simditor.css" />

<script type="text/javascript" src="<%=request.getContextPath() %>/resources/simditor-2.3.6/scripts/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/simditor-2.3.6/scripts/module.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/simditor-2.3.6/scripts/hotkeys.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/simditor-2.3.6/scripts/uploader.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/simditor-2.3.6/scripts/simditor.js"></script>
<title>Insert title here</title>

<script type="text/javascript">
	$(function(){
		 var sm_toolbar = ['italic','bold', 'underline', 'strikethrough', '|', 'blockquote', 'code', 'link', 'image'];
		   
		var editor = new Simditor({
			
			  textarea: $('#reply_input'),
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

<style type="text/css">
     /*解决图标距离顶部过近的问题*/
	.simditor .simditor-toolbar ul li a{
	 	padding-top: 20px;
	}
</style>
</head>
<body>
<div class="page-demo">
	<textarea id="reply_input" placeholder="看帖肿么可以不回复呢?"></textarea>
	
</div>
</body>
</html>