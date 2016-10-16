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
 
<style type="text/css">
.fa-weixin{
		background:#2DCB53 none repeat scroll 0% 0%;
}
.fa-qq{
	background:#5A9EFA none repeat scroll 0% 0%;
}

.fa-weibo{
	background:red none repeat scroll 0% 0%;
}

</style>    
<title>yellowcong网站登录页</title>

<!-- 需要 做的事情有 解决
点击栏目   我们的输入框颜色改变
输入框颜色
i表现的 color

背景设定,背景有点不清楚

设定网站logo

输入邮箱 设定 logo  js

登录 接口  。。

 -->
</head>
<body style="background-image:url(<%=request.getContextPath()%>/resources/img/login/bg.jpg)">
	<div>
        <div class="login">
            <div class="login-form">
                <span><img src="<%=request.getContextPath() %>/resources/img/login/head.jpg" alt="" /></span>
                <h5><strong>我的</strong>世界</h5>
                <form action="<%=request.getContextPath() %>/user/login" method="post">
                    <fieldset>
                        <input name="key" type="text" placeholder="邮箱/手机号" /><i class="fa fa-user"></i>
                    </fieldset>
                    <fieldset>
                        <input  name="password" type="password" placeholder="密码" /><i class="fa fa-unlock-alt"></i>
                    </fieldset>
                    <label>
                        <input type="checkbox" />记住帐号</label>
                    <button type="submit" class="blue">登 录</button>
                </form>
                <a href="#" title="">忘记密码?</a>
            </div>
            <ul class="reg-social-btns">
                <li><a href="#" title=""><i class="fa fa-qq"></i></a>
                </li>
                <li><a href="#" title=""><i class="fa fa-weixin"></i></a>
                </li>
                <li><a href="#" title=""><i class="fa fa-weibo"></i></a>
                </li>
                <li><a href="#" title=""><i class="fa fa-github"></i></a>
                </li>
            </ul>
            <span>Copyright © 2014-2017 yellowcong</span>
        </div>
    </div>
</body>
</html>