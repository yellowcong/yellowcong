<%--
这个是我们的list数据的原型数据
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 加载js -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery-1.7.1.min.js"></script>
	
	<!-- 加载js -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
	
<!-- bootstrap 的样式 -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/bootstrap.css" />
<!-- 字符的样式 -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/font/css/font-awesome.css"
	type="text/css" />

<style type="text/css">

.date_content{
	background: #fff;
	margin:20px 20px 50px; 
}
/*boostrap 的表格样式*/
.bootstrap_style_table{
	color:#777;
	width:100%;
	max-width:100%;
	/*border: 1px solid #DDD;*/
	backgroud:transparent;
	border-spacing: 0px;
	border-top: 1px solid #DDD;
	border-right: 1px solid #DDD;
	
	line-height: 18px;
}

.bootstrap_style_table td,.bootstrap_style_table th{
	border-left:  1px solid #DDD;
	border-bottom: 1px solid #DDD;
	/*对于表格，不需要明确设定高度和宽度*/
	padding:10px;
	/*设定字体居中显示*/
	text-align: center;
}

.bootstrap_style_table thead{
	background: #EFEFEF;
}

/*小号的按钮*/
.btn-small {
    display: inline-block;
    padding: 3px 6px;
    margin-bottom: 0;
    font-size: 14px;
    font-weight: normal;
    line-height: 1.42857143;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    cursor: pointer;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    background-image: none;
    border: 1px solid transparent;
    border-radius: 4px;
}

.btn-search {
    padding: 3px 10px;
}

.search_content{
}

/*表内容数据样式*/
.table_content{
	padding-top: 60px;
}
.table_search_menu{
	width: 50%;
	float: left;
}

.table_info{
}

.input_small{
	display:inline-block;
	width: 120px;
	margin-right: 10px;
	margin-left: 10px;
}
/*表格的 分页 当前页*/
.input_small_pager{
	width: 40px;
	display: inline-block;
}
/*表格分页的显示*/
.input_small_pagers{
	width: 70px;
	display: inline-block;
}
.table_pager_info a{
	text-decoration: none;
}


.table_pager{
	margin-top: 20px;
}
.table_pager_info{
	float: left;
}
/*分页样式*/
.table_pagination{
float: left;
margin-top: -20px;
}
</style>
<!-- 加载js -->
<script type="text/javascript">
$(function(){
	
	//当表头中存在checkbox的时候，我们设定宽度
	var checkboxs = $(".bootstrap_style_table thead tr th:first").find("input:checkbox");
	if(checkboxs){
		//设定表格第一个数据的效果3%
		$(".bootstrap_style_table thead tr th:first").css("width","3%");
		
		//设定现实的效果
		
	}
	
	//border-bottom: 1px solid #DDD;
	
	var isCheck = false;
	//当选中后，全选和全不选的操作
	 checkboxs.click(function(){
		 if(!isCheck){
			 $(".bootstrap_style_table tbody tr input:checkbox").attr("checked","checked");
		 }else{
			 $(".bootstrap_style_table tbody tr input:checkbox").removeAttr("checked");
		 }
		 isCheck =!isCheck;
	 });
	
	//设定偶数行的显示效果
	$(".bootstrap_style_table tbody tr:even").css("background","#F9F9F9");
	
	//设定hover的数据显示效果
	$(".bootstrap_style_table tbody tr").hover(function(){
		$(this).css("background","#EEE");
	},function(){
		//$(this).css("background",default_color);
		$(this).css("background","none");
		$(".bootstrap_style_table tbody tr:even").css("background","#F9F9F9");
	});
	//设定btn数据
	//vertical-align: middle;//padding: 3px 6px;
	$(".bootstrap_style_table .btn").css({"padding":"2px 5px"});
	
});
</script>
</head>
<body>
<div class="date_content">
	
	
	
	<div class="search_content">
		
		<div class="table_search_menu">
			<div class="input-group input-group-sm input_group_small"  style="line-height: 30px;">
			<span class="input-group-btn ">
				<button class="btn btn-danger dropdown-toggle" data-toggle="dropdown" type="button">条件<i class="fa fa-filter fa-fw"></i></button>
				<ul class="dropdown-menu">
					<li>fdadf</li>
					<li>fdadf</li>
					<li>fdadf</li>
				</ul>
			</span>
			<input type="text"  class="form-control" placeholder="输入关键字..."/>
			<span class="input-group-btn">
				<button class="btn btn-success">查询<i class="fa fa-search fa-fw"></i></button>
			</span>
			</div>
		</div>
		<!-- pull-right 就是float-left -->
		<div class="tb-group-actions pull-right">
			<span>10条被选中记录</span>
			<select name="" class=" form-control input_small input-sm ">
				<option value="">选择操作...</option>
				<option value="">删除</option>
				<option value="">拉黑</option>
				<option value="">激活</option>
			</select>		
			<button class="btn btn-search btn-danger"><i class="fa fa-check fa-fw"></i>提交</button>
		</div>
	</div>
	
	<!-- 表单中的类容 -->
	<div class="table_content">
		
	<table class="bootstrap_style_table">
		<thead>
			<tr>
				<th><input type="checkbox"  /></th>
				<th>编号</th>
				<th>用户名</th>
				<th>QQ</th>
				<th>电话</th>
				<th>注册日期</th>
				<th>状态</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><input type="checkbox"/></td>
				<td>1</td>
				<td>用户名</td>
				<td>QQ</td>
				<td>电话</td>
				<td>注册日期</td>
				<td><span class="label label-danger">未激活</span></td>
				<td>操作</td>
			</tr>
			<tr>
				<td><input type="checkbox"/></td>
				<td>2</td>
				<td>用户名</td>
				<td>QQ</td>
				<td>电话</td>
				<td>注册日期</td>
				<td><span class="label label-success">拉黑</span></td>
				<td>操作</td>
			</tr>
			<tr>
				<td><input type="checkbox"/></td>
				<td>3</td>
				<td>用户名</td>
				<td>QQ</td>
				<td>电话</td>
				<td>注册日期</td>
				<td><span class="label label-sm label-default">拉黑</span></td>
				<td><button class=" btn btn-danger"><i class="fa fa-trash-o fa-fw"></i>删除</button></td>
			</tr>
			<tr>
				<td><input type="checkbox"/></td>
				<td>4</td>
				<td>用户名</td>
				<td>QQ</td>
				<td>电话</td>
				<td>注册日期</td>
				<td><span class="label label-sm label-primary">激活</span></td>
				<td><button class=" btn btn-danger"><i class="fa fa-trash-o fa-fw"></i>删除</button></td>
			</tr>
			<tr>
				<td><input type="checkbox"/></td>
				<td>5</td>
				<td>用户名</td>
				<td>QQ</td>
				<td>电话</td>
				<td>注册日期</td>
				<td>状态</td>
				<td>操作</td>
			</tr>
			<tr>
				<td><input type="checkbox"/></td>
				<td>1</td>
				<td>用户名</td>
				<td>QQ</td>
				<td>电话</td>
				<td>注册日期</td>
				<td>状态</td>
				<td>操作</td>
			</tr>
			<tr>
				<td><input type="checkbox"/></td>
				<td>2</td>
				<td>用户名</td>
				<td>QQ</td>
				<td>电话</td>
				<td>注册日期</td>
				<td>状态</td>
				<td>操作</td>
			</tr>
			<tr>
				<td><input type="checkbox"/></td>
				<td>5</td>
				<td>用户名</td>
				<td>QQ</td>
				<td>电话</td>
				<td>注册日期</td>
				<td><span class="label label-sm label-danger">未激活</span></td>
				<td>操作</td>
			</tr>
			<tr>
				<td><input type="checkbox"/></td>
				<td>5</td>
				<td>用户名</td>
				<td>QQ</td>
				<td>电话</td>
				<td>注册日期</td>
				<td><span class="label label-sm label-danger">未激活</span></td>
				<td>操作</td>
			</tr>
		</tbody>
		
	</table>
	</div>
	<!-- 分页操作 -->
	<div class="table_pager">
		<div class="table_pager_info">
			当前页面
			<a href="#" class="btn btn-sm btn-default btn-prev">&lt;</a>
			<input type="text" value="1" maxlength="5" class="form-control input-mini input-inline input-sm text-center input_small_pager"/>
			<a href="#" class="btn btn-sm btn-default btn-next">&gt;</a>
			<span>共300页 | 每页显示</span>
			<select name="" class=" form-control input_small input_small_pagers  text-center ">
				<option value="">10</option>
				<option value="">20</option>
				<option value="">50</option>
				<option value="">100</option>
			</select>
			<span>记录 | 共有3000条记录</span>	
		</div>
		<!-- 表格分也显示数据 -->
		<div class="table_pagination pull-right">
			<ul class="pagination pagination-sm man">
				<li><a href="#">«</a></li>
				<li><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#">»</a></li>
			</ul>
		</div>
	</div>
</div>
</body>
</html>