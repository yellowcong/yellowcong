/*2016-1-13 编写yellowcong 博客网站的js代码
 * 这个里面将封装方法，不会像以前一样，直接写一堆的js
 * 
 * tabs 
 * dropmenu
 * tabs   //tabs布局 
dropmenu  //下拉按钮
menubutton //菜单按钮
searchbox //搜索栏目
layout //布局
pagination //分页
datagrid //数据显示  添加多个样式属性设定
navs  //竖列的navs

file:///C:/Users/yellowcong/Desktop/项目/前台/unicorn 好看/unicorn_admin_tpl/jquery-ui.html
file:///C:/Users/yellowcong/Desktop/项目/前台/MAdmin好看呢/index.html
accordion //手风琴显示
tooltip  //消息提示
dateBox  //日期的box
calendar //日历数据
tree  //树
dialog//对话框 
messager //侧栏提示信息
toTop  //回到上面
//每个可以关闭的页面
pannel // file:///C:/Users/yellowcong/Desktop/项目/前台/MAdmin好看呢/page-gallery.html
note  // 左侧有一点颜色
   leftColor
   backColor
   title
   info
 file:///C:/Users/yellowcong/Desktop/项目/前台/MAdmin好看呢/table-export.html

divList //文章列表显示 ，竖着显示
 file:///C:/Users/yellowcong/Desktop/项目/前台/MAdmin好看呢/grid-layout-div.html

tabList// 表单类似显示 
 file:///C:/Users/yellowcong/Desktop/项目/前台/MAdmin好看呢/grid-layout-ul-li.html

optionmenu//操作菜单  delete  addNew... 
 file:///C:/Users/yellowcong/Desktop/项目/前台/MAdmin好看呢/page-gallery.html

timeline
 file:///C:/Users/yellowcong/Desktop/项目/前台/MAdmin好看呢/page-timeline.html
file:///C:/Users/yellowcong/Desktop/项目/前台/Cameo 好看/timeline.html
reply // 回复的js

tags //标签生成

rating  生成星星的js
 file:///C:/Users/yellowcong/Desktop/项目/前台/MAdmin好看呢/extra-profile.html

progress//进度条的js

priceOption // 价格或者权限显示   
第一条
 file:///C:/Users/yellowcong/Desktop/项目/前台/MAdmin好看呢/extra-pricing-table.html
第二种
file:///C:/Users/yellowcong/Desktop/项目/前台/Centaurus 好看/Centaurus - Bootstrap Admin Template/pricing.html
imgTag //图片的tag  就是在右上角添加 一个  斜着的 标签 
file:///C:/Users/yellowcong/Desktop/项目/前台/azan 好看/widgets.html
向导js生成
file:///C:/Users/yellowcong/Desktop/项目/前台/ace 好看/form-wizard.html


gallery img
imghover
file:///C:/Users/yellowcong/Desktop/项目/前台/ace 好看/gallery.html
fullScreen   //全屏
locakScreen //锁屏
chart //表格工具 
rate  //效率的精度条
file:///C:/Users/yellowcong/Desktop/项目/前台/Cameo 好看/chart.html
animations //动画utils  animations.html 集合了基本的动画
form //表单生成js
Vector Map 用于分析好友地点和方位等
file:///C:/Users/yellowcong/Desktop/项目/前台/azan 好看/vector-map.html
 * */
(function($){

	/**
	 * 扩展String   添加trim方法，去掉两端的空格数据
	 * 将前面和后面的空格都去除掉
	 * @return String
	 */
	String.prototype.trim = function(){
		if(this == null) return null;
		//替换掉空格
		return this.replace(/^(\s*)|(\s*)$/g, "");
	}
	
	/**
	 * 扩展String   判断两个数据是否相等
	 * @return String
	 */
	String.prototype.equals = function(obj){
		if(this == null) return null;
		return this.toString() == obj.toString();
	}
	/**
	 * 扩展String   判断两个数据是否相等 不比较大小写
	 * @return String
	 */
	String.prototype.equalsIgnoreCase = function(obj){
		if(this == null) return null;
		var _self= this.toLocaleLowerCase();
		return _self.equals(obj.toLocaleLowerCase());
	}
	/**
	 * 判断是否是email
	 * 717350389@qq.com 邮箱
	 * @returns boolean
	 * @date 2016-1-22 
	 */
	String.prototype.isEmail = function(){
		if(this == null) return null;
		//我们的email测试的正则表达式，一大串的，我也是醉了
		var reg = new RegExp(/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00AEW0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$/);
		//替换掉空格
		return reg.test(this);
		
	}
	/**
	 * 判断是否是url
	 */
	String.prototype.isUrl = function(){
		if(this == null) return null;
		//RegExp 判断是否是url
		return /^(https?|ftp):\/\/(((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:)*@)?(((\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5]))|((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?)(:\d*)?)(\/((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)+(\/(([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)*)*)?)?(\?((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|[\uE000-\uF8FF]|\/|\?)*)?(\#((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|\/|\?)*)?$/.test(this);
	}
	//
	/**
	 * 判断是否是数字
	 * @date 2016-1-22
	 * @author yellowcong
	 */
	String.prototype.isNum = function(){
		if(this == null) return null;
		return /^-?(?:\d+|\d{1,3}(?:,\d{3})+)?(?:\.\d+)?$/.test(this);
	}
	/**
	 * 判断是否是IP
	 * 121.212.212.212
	 * @returns boolean 
	 */
	String.prototype.isIP = function(){
		if(this == null) return null;
		var flag = false;
		//判断是否是ip
		var result = this.match(/\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/g);
		//匹配的数据 是获取到其中满足的数据，并不是判断是否是 字符串
		if(this == result[0]){
			flag =true;
		}
		return flag;
	}
	
	/**
	 * 判断是否是电话号
	 * 18604600631
	 * @returns boolean 
	 */
	String.prototype.isPhone = function(){
		if(this == null) return null;
		var flag = false;
		//判断是否是ip
		var result = this.match(/1[358][0-9]{9}/g);
		//匹配的数据 是获取到其中满足的数据，并不是判断是否是 字符串
		if(this == result[0]){
			flag =true;
		}
		return flag;
	}
	
	/**
	 * 判断是否是日期
	 * @returns boolean 
	 */
	String.prototype.isDate = function(){
		if(this == null) return null;
		//this 是我们传递经来的Date
		//"yyyy-MM-dd"
		//MM-dd
		//"yyyy-MM-dd hh:MM:ss"
		//"hh:MM:ss"
		//var checkList=new Array('y-m-d','yyyy-mm-dd','yyyy-mm-dd HH:MM:ss','H:M:s');
		
		return toString.call(new Date(this)) === '[object Date]';
	}
	
	/**
	 * 日期转换工具
	 * yyyy-mm-dd hh:MM:ss
	 * yyyy-mm-dd
	 * localString类型的
	 * 这两种的日期类型数据转换，其中符号是可以变化的
	 * 将String类型的数据换换成为日期数据
	 * 'y-m-d','yyyy-mm-dd'
	 * 	当时日期的情况  ,年份的分割符号  : / - _  这4种
	 * 	时间分割符号 : / - 这三种
	 * @returns Date 
	 */
	String.prototype.dateParse = function(){
		//转换格式的方法
		var date = new Date();
		//用于判断是否是简单日期类型
		var isSimpleTime = true;
		//如果数据中没有  就说明是日期类型的
		if(/\d{1,4}\W\d{1,2}\W\d{1,2} \d{1,2}\W\d{1,2}\W\d{1,2}/.test(this)){
			//年的符号
			var yearFu  = this.replace(/\d{1,4}(\W)\d{1,2}\W\d{1,2} \d{1,2}\W\d{1,2}\W\d{1,2}/,"$1");
			//小时的符号
			var hourFu  = this.replace(/\d{1,4}\W\d{1,2}\W\d{1,2} \d{1,2}(\W)\d{1,2}\W\d{1,2}/,"$1");
			var dateStr =this.split(" ")
			var yearArr = dateStr[0].split(yearFu);
			var hourArr = dateStr[1].split(hourFu);
			date.setFullYear(yearArr[0], yearArr[1], yearArr[2]);
			date.setHours(hourArr[0], hourArr[1], hourArr[2], 0);
			isSimpleTime = false;
		}else if(/\d{1,4}\W\d{1,2}\W\d{1,2}/.test(this) && isSimpleTime){
			var fuhao = this.replace(/\d{1,4}(\W)\d{1,2}\W\d{1,2}/,"$1");
			var dateStr = this.split(fuhao);
			//初始化我们的数据
			date.setFullYear(dateStr[0], dateStr[1], dateStr[2]);
			date.setHours(0, 0, 0, 0);
		}else if(toString.call(new Date(this)) === '[object Date]'){
			date = new Date(this);
		}else{
			date = null;
		}
		return date;
	}
	
	/**
	 * 将日期类型的数据转化为String类型的数据
	 * 日期有个问题
	 * 他们的时间转化问题，天数有差  getDay  方法获取的天数不对
	 * @return String
	 */
	Date.prototype.formate = function(format){
		//当没有填我们的formate的时候，返回他本地的时间显示方式
		if(typeof(format)=="undefined" || format==null || format==""){
			//当没有Date的时候,我们需要直接返回
			//console.log(this);
			//return this.toLocaleString();
		}
		var dateStr = "";
		var isSimpleTime = true;
		var date = this;
		//当有format的情况
		if(/\w{1,4}\W\w{1,2}\W\w{1,2} \w{1,2}\W\w{1,2}\W\w{1,2}/.test(format)){
			//年的符号
			var yearFu  = format.replace(/\w{1,4}(\W)\w{1,2}\W\w{1,2} \w{1,2}\W\w{1,2}\W\w{1,2}/,"$1");
			//小时的符号
			var hourFu  = format.replace(/\w{1,4}\W\w{1,2}\W\w{1,2} \w{1,2}(\W)\w{1,2}\W\w{1,2}/,"$1");
			dateStr = date.getFullYear()+yearFu+date.getMonth()+yearFu+date.getDay()+" "+
			date.getHours()+hourFu+date.getMinutes()+hourFu+date.getSeconds();
			isSimpleTime = false;
		}else if(/\w{1,4}\W\w{1,2}\W\w{1,2}/.test(format) && isSimpleTime){
			//就一条的情况
			//
			var fuhao = format.replace(/\w{1,4}(\W)\w{1,2}\W\w{1,2}/,"$1");
			if(format.indexOf("y") == -1){
				//当只有 时间没有日期的情况
				dateStr = date.getHours()+""+fuhao+date.getMinutes()+""+fuhao+date.getSeconds();
			}else{
				console.log(date.getDay());
				dateStr = date.getFullYear()+""+fuhao+date.getMonth()+""+fuhao+date.getDay();
			}
		}
		return dateStr;
	}
	
//基于js的属性扩展 结束
	

//Jquery 全局插件
	/**
	 * 格式化输出我们的日期数据
	 * 这种类型 的方法定义
	 * toLocalString  格式化时间显示
	 * baseUrl  获取基础url
	 * windowSize 获取浏览器的基本 信息  屏幕的高度宽度啥的
	 */

	/**
	 * 基于全局的js插件,调用方法是  $.toLocalString(xx)
	 */
	jQuery.toLocalString = function(date){
		console.log("hello"+date);
	}
	
	/**
	 * 基于全局的js插件,调用方法是  $.setDocHeight() 来设定我们的文档高度
	 * @param _self  就是我们的文档自己 this,如果不传递进来，我们就不知道了他的高度
	 */
	jQuery.setDocHeight = function(_self){
		$("body").append("<input type='hidden' name='docHeight' value='"+$(_self).height()+"'/>");
	}
	/**
	 * 判断是否是Boolean类型数据
	 * return boolean
	 */
	jQuery.isBoolean = function(obj){
		return typeof obj === 'boolean';
	}
	/**
	 * 判断是否是String类型数据
	 * return boolean
	 */
	jQuery.isString = function(obj){
		return typeof obj === 'string';
	}
	/**
	 * 判断是否是方法
	 */
	jQuery.isFunction = function(fn){
        return typeof(fn) === 'function';
    }
	
	$.fn.psgsFoot = function(options){
		var setting = $.extend({
			infos:[
					  [{name:"关于yellowcong",url:"#",title:true},{name:"关于站长",url:"#"},{name:"联系站长",url:"#"},{name:"关于站长",url:"#"},{name:"关于站长",url:"#"}],
					  [{name:"网站服务",url:"#",title:true},{name:"关于站长",url:"#"},{name:"联系站长",url:"#"},{name:"关于站长",url:"#"},{name:"关于站长",url:"#"}],
					  [{name:"网站服务",url:"#",title:true},{name:"关于站长",url:"#"},{name:"联系站长",url:"#"},{name:"关于站长",url:"#"},{name:"关于站长",url:"#"}]
					],
					address:"黑龙江科技大学",
					company:"黑龙江科技大学",
					phone:"18604600631",
					email:"717350389@qq.com",
					codeImg:"resources/img/qq_code.jpg"
		},options||{});
		var _self = this;
		
		//格式化html
		var str = formateHtml(setting.infos,setting.address,setting.company,setting.phone,setting.email,setting.codeImg);
		//console.log(str);
		$(_self).html(str);
		
		$(".yellowcong_foot").socialConnect({
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
		
		
		function formateHtml(infos,address,company,phone,email,codeImg){
			var str = '<div class="page_foot_border"></div>'+
			'<div class="page_foot_beifeng">'+
			'<div class="container"><div >'+
			'<div class="page_foot_daohang">';
			
			$.each(infos,function(key,links){
				str +="<dl>";
				$.each(links,function(key2,link){
					if(link.title){
						str+='<dt><a href="'+link.url+'">'+link.name+'</a></dt>'
					}
				});
				$.each(links,function(key2,link){
					if(!link.title){
						str+='<dd>&bull;&nbsp;<a href="'+link.url+'">'+link.name+'</a></dd>'
					}
				});
				str+="</dl>";
			});
			str+='<dl style="width: 200px;">'+
			'<dt><a href="#">联系我们</a></dt>'+
			'<dd>公司:'+address+'</dd>'+
			'<dd>地址:'+company+'</dd>'+
			'<dd>电话:'+phone+'</dd>'+
			'<dd>邮箱:'+email+'</dd>'+
			'<dd><div class="yellowcong_foot"></div></dd></dl>'+		
			'<dl style="width: 200px;">'+
			'<dd><img style="width: 200px;" src="'+codeImg+'"></img></dd>'+
			'</dl></div></div></div></div>';
			return str;
			
		}
/*
'<div class="page_foot_border"></div>'+
'<div class="page_foot_beifeng">'+
'<div class="container"><div >'+
'<div class="page_foot_daohang">'
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
'<dl style="width: 200px;">'+
'<dt><a href="#">联系我们</a></dt>'+
'<dd>公司:黑龙江科技大学</dd>'+
'<dd>地址:黑龙江科技大学</dd>'+
'<dd>电话:18604600631</dd>'+
'<dd>邮箱:717350389@qq.com</dd>'+
'<dd><div class="my_info"></div></dd></dl>'+		
'<dl style="width: 200px;">'+
'<dd><img style="width: 200px;" src="<%=request.getContextPath() %>/resources/img/qq_code.jpg"></img></dd>'+
'</dl></div></div></div></div>'

*/
	}
	/**
	 * 文章显示效果
	 */
	$.fn.psgsShow = function(options){
		var setting = $.extend({
			navsMenu:{title:"移动开发",
				navs:[[{name:"最新",url:"#",select:true},{name:"最热",url:"#"}],
                      [{name:"查看次数",url:"#",select:true},{name:"查看最多",url:"#"},{name:"查看最多",url:"#"}],
                      [{name:"评分",url:"#",select:true},{name:"查看最多",url:"#"},{name:"评论最多",url:"#"}],
            ]},
            //文章 psgUrl是路径， title 是日期，imgUrl是图片地址，date是日期， see 查看次数  useranme 名称  disc描述  good 好  bad 差
            psgs:[{psgUrl:"#",title:"标题",imgUrl:"xx.jpg",date:"2016-10-10",see:100,username:"yellowcong",disc:"描述",reply:100,good:100,bad:100}]
		},options||{});
		var _self= this;
		
		var head = formateNavs(setting.navsMenu.title,setting.navsMenu.navs);
		
		var body = formatePsgs(setting.psgs);
		
		$(_self).html(head+body);
		formateJs();
		
		
		function formateJs(){
			
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
		}
		
		//console.log(head+body);
		//文章的显示
		function formatePsgs(psgs){
			var str = '<div class="nav_pages_listbox"><div><ul class="listbox_list">';
			
			
			$.each(psgs,function(key,psg){
				str+='<li><div><div class="listbox_list_img"><a href="'+psg.psgUrl+'">'+
				'<img src="'+psg.imgUrl+'"/>'+
				'<div class="listbox_list_see"><i class="fa fa-play-circle-o fa-fw" style="font-size: 40px;"></i></div>'+
				'</a></div><div class="listbox_list_info">'+
				'<h2 ><a href="'+psg.psgUrl+'">'+psg.title+'</a></h2>'+
				'<p class="listbox_list_dicr">'+psg.disc+'</p>'+
				'<p><span><i class="fa fa-clock-o fa-fw"></i>'+psg.date+'</span>'+
				'<span><i class="fa fa-user fa-fw"></i>'+psg.username+'</span>'+
				'<span><i class="fa fa-eye fa-fw"></i>'+psg.see+'</span>'+
				'<span><i class="fa fa-comments fa-fw"></i>'+psg.reply+'</span>'+
				'<span style="float: right;" class="listbox_zhan"><i class="fa fa-thumbs-o-up fa-fw"></i>'+psg.good+'</span>'+
				'<span style="float: right;"   class="listbox_down"><i class="fa fa-thumbs-o-down fa-fw"></i>'+psg.bad+'</span>'+
				'</p></div><div style="clear:both;"></div>'+
				'</div></li>'
			});
			
			str += '</ul><ul class="listbox_lager">';
			
			$.each(psgs,function(key,psg){
				str+='<li><div class="listbox_img"><a href="'+psg.psgUrl+'">'+
				'<img class="list_img_info" src="'+psg.imgUrl+'"/>'+
				'<div class="listbox_see"><i class="fa fa-play-circle-o fa-fw" style="font-size: 40px;"></i></div>'+
				'</a></div><div class="listbox_info">'+
				'<h2 class="lesson-info-h2"><a href="'+psg.psgUrl+'">'+psg.title+'</a></h2>'+
				'<div class="listbox_info_desc">'+
				'<span>'+psg.disc+'</span>'+
				'<br/><span><i class="fa fa-user fa-fw"></i>'+psg.username+'</span>'+
				'<span class="listbox_zhan"><i class="fa fa-thumbs-o-up fa-fw"></i>'+psg.good+'</span>'+
				'<span class="listbox_down"><i class="fa fa-thumbs-o-down fa-fw"></i>'+psg.bad+'</span>'+
				'</div><div><span><i class="fa fa-clock-o fa-fw"></i>'+psg.date+'</span>'+
				'<span><i class="fa fa-eye fa-fw"></i>'+psg.see+'</span>'+
				'<span style="float: right"><i class="fa fa-comments fa-fw"></i>'+psg.reply+'</span>'+
				'</div></div></li>'
			});
			str+='</ul></div></div><div style="clear: both"></div>';
			
			return str;
		}
		
		//文件的navs
		function formateNavs(title,navs){
			var str ='<div class="nav_pages_right"><div class="wrap_content">'+
			'<div class="wrap_info"><span>'+title+'</span></div>'+
			'<div class="wrap_select_options">';
			//console.log(navs);
			
			 str = str+ formateNavsDate(navs)+'</div><div class="wrap_select_style">'+
			 '<ul><li><i class="fa fa-th-large fa-fw"></i></li>'+
			 '<li><i class="fa  fa-th-list  fa-fw"></i></li>'+
			 '</ul></div></div><div style="clear: both;"></div>';
			 
			 return str;
		}
		
		//格式化 我们的navs显示,显示上下显示的效果
		function formateNavsDate(navs){
			var date = "";
			$.each(navs,function(key,subs){
				var strStart ='<dl class="optioins_first">';
				var strEnd ="<dd>";
				var subLen =0;
				
				var max = 0;
				$.each(subs,function(key2,sub){
					//最小的
					if(sub.select){
						subLen = sub.name.length;
					}
					//设定最大的长度
					if(max <sub.name.length){
						max = sub.name.length;
					}
				});
				var hasNull = true;
				if(max > subLen){
					hasNull = false;
				}
				
				$.each(subs,function(key2,sub){
					
					//当选中的情况
					if(sub.select){
						strStart +='<dt class="optioins_head">'+sub.name+'<i class="fa fa-angle-down fa-fw"></i></dt>';
					}else{
						//当有空的数据的情况
						if(hasNull){
							//当不是我们的选中的情况下
							strEnd +='<p><a href="'+sub.url+'">'+sub.name+'<i>&nbsp;&nbsp;&nbsp;&nbsp;</i></a></p>';
						}else{
							//当不是我们的选中的情况下
							strEnd +='<p><a href="'+sub.url+'">'+sub.name+'<i></i></a></p>';
						}
					}
				});
				date = date+strStart+strEnd+'</dd></dl>';
			});
			return date;
		}
	}
	/**
	 * 左边导航栏,
	 * 我们需要做的是
	 * titile
	 * menus的配置
	 * 这个是导航栏目的第二种显示的形式，比较的方便，使用多重数组的方式简化了配置的操作
	 * 
	 */
	$.fn.navPage2 = function(options){
		var setting = $.extend({
			title:"全部分类",
			//大的菜单名称,多级菜单 name访问的url
			menus:[{name:"前端开发",url:"#",
				//二级子标题 name ,访问的url
				   sub:[[{name:"前端基础",url:"#",title:true},{name:"HTML",url:"#"}, {name:"CSS",url:"#"},{name:"JavaScript",url:"#"}],
				        [{name:"前端进阶",url:"#",title:true},{name:"HTML",url:"#"}, {name:"CSS",url:"#"},{name:"JavaScript",url:"#"}],
				        ]
					},
					{name:"后端开发",url:"#",
					//二级子标题 name ,访问的url
					   sub:[[{name:"前端基础",url:"#",title:true},{name:"HTML",url:"#"}, {name:"CSS",url:"#"},{name:"JavaScript",url:"#"}],
					        [{name:"前端进阶",url:"#",title:true},{name:"HTML",url:"#"}, {name:"CSS",url:"#"},{name:"JavaScript",url:"#"}],
					        [{name:"前端进阶",url:"#",title:true},{name:"HTML",url:"#"}, {name:"CSS",url:"#"},{name:"JavaScript",url:"#"}]
					   	]
							}]
		},options||{});
		var _self = this;
		var htmlStr = formateHtml(setting.title,setting.menus);
		console.log(htmlStr);
		_self.html(htmlStr);
		//console.log(htmlStr);
		
		formateJs(_self);
		//console.log(htmlStr);
		//console.log(setting.menus);
		//来生成js文件
		function formateHtml(title,menus){
			var str ='<div class="nav_page"><ul class="nav_page_menus">';
			//titile
			str+='<li><a href="#">'+title+'</a></li>';
			$.each(menus,function(key,menu){
				//当数据有的情况
				if(menu.sub != null && menu.sub.length){
					str +='<li><a href="'+menu.url+'">'+menu.name+'</a><div class="nav_sub"><div class="nav_sub_content">';
					//获取子菜单中的数据
					//然后设定里面的二级标题
					var str3 = "";
					//
					
					//标题中的数据
					$.each(menu.sub,function(key2,subs){
						$.each(subs,function(key3,sub){
							if(sub.title){
								str3 += '<div ><dl><dd class="nav_sub_head"><a href="'+sub.url+'">'+sub.name+'</a></dd><dd  class="nav_sub_body">';
							}
						});
						
						$.each(subs,function(key3,sub){
							//console.log(sub);
							if(!sub.title){
								str3 += '<a href="'+sub.url+'">'+sub.name+'</a>'
							}
						});
						str3+="</dd></dl></div>";
						
					});
					str =str+str3+"</div></div></li>";
				}else{
					str +='<li><a href="'+menu.url+'">'+menu.name+'</a></li>';
				}
			});
			str+="</ul></div>";
			//菜单数据显示
			/*$.each(menus,function(key,val){
				str +='<li><a href="'+val.url+'">'+val.name+'</a><div class="nav_sub"><div class="nav_sub_content">';
				//迭代第二重
				//获取子菜单中的数据
				var str3 = "";
				$.each(val.sub,function(key2,sub){
					//第三重
					str3 += '<div ><dl ><dd class="nav_sub_head"><a href="'+sub.url+'">'+sub.name+'</a></dd><dd  class="nav_sub_body">';
					$.each(sub.sub,function(key3,val3){
						str3 += '<a href="'+val3.url+'">'+val3.name+'</a>'
					});
					str3+="</dd></dl></div>";
				})
				str =str+str3+"</div></div></li>";
			});
			str+="</ul></div>";
			*/
			return str;
		}	
		
		function formateJs(_self){
			_self.find(".nav_page_menus li:first").css("background","none");
			_self.find(".nav_page_menus li:first").hover(function(){
				$(this).css({"border-right":"2px solid #35b558"});
			},function(){
				$(this).css({"border-right":"1px solid #e4e4e4"});
			}).click(function(){
				return false;
			});
			//解决我们的 子菜单
			_self.find(".nav_page_menus li").hover(function(){
				$(this).find(".nav_sub").show();
				$(this).css("color","#35b558");
			},function(){
				$(this).find(".nav_sub").hide();
			}); 
		}
	}
	
	/**
	 * 左边导航栏,
	 * 我们需要做的是
	 * titile
	 * menus的配置
	 * 
	 */
	$.fn.navPage = function(options){
		var setting = $.extend({
			title:"全部分类",
			//大的菜单名称,多级菜单 name访问的url
			menus:[{name:"前端开发",url:"#",
				//二级子标题 name ,访问的url
				   sub:[{name:"前端基础",url:"#",
					    //三级子标题 name，访问的url
					   	sub:[
					   	     {name:"HTML",url:"#"},
				   	 		 {name:"CSS",url:"#"},
				   	 	 	 {name:"JavaScript",url:"#"},
					   	]}]}]
		},options||{});
		var _self = this;
		var htmlStr = formateHtml(setting.title,setting.menus);
		_self.html(htmlStr);
		
		
		formateJs(_self);
		//console.log(htmlStr);
		
		//来生成js文件
		function formateHtml(title,menus){
			var str ='<div class="nav_page"><ul class="nav_page_menus">';
			//titile
			str+='<li><a href="#">'+title+'</a></li>';
			$.each(menus,function(key,val){
				str +='<li><a href="'+val.url+'">'+val.name+'</a><div class="nav_sub"><div class="nav_sub_content">';
				//迭代第二重
				//获取子菜单中的数据
				var str3 = "";
				$.each(val.sub,function(key2,sub){
					//第三重
					str3 += '<div ><dl ><dd class="nav_sub_head"><a href="'+sub.url+'">'+sub.name+'</a></dd><dd  class="nav_sub_body">';
					$.each(sub.sub,function(key3,val3){
						str3 += '<a href="'+val3.url+'">'+val3.name+'</a>'
					});
					str3+="</dd></dl></div>";
				})
				str =str+str3+"</div></div></li>";
			});
			str+="</ul></div>";
			
			return str;
		}	
		
		function formateJs(_self){
			_self.find(".nav_page_menus li:first").css("background","none");
			_self.find(".nav_page_menus li:first").hover(function(){
				$(this).css({"border-right":"2px solid #35b558"});
			},function(){
				$(this).css({"border-right":"1px solid #e4e4e4"});
			}).click(function(){
				return false;
			});
			//解决我们的 子菜单
			_self.find(".nav_page_menus li").hover(function(){
				$(this).find(".nav_sub").show();
				$(this).css("color","#35b558");
			},function(){
				$(this).find(".nav_sub").hide();
			}); 
		}
	}
	
	/**
	 * 分享插件
	 * 点击一下变成圆形的插件,然后点击联系我的插件
	 * 
	 * 其中我们有
	 * email
	 * qq
	 * phone
	 * github
	 * weixin
	 * weibo
	 */
	$.fn.socialConnect = function(options){
		var setting = $.extend({
			background:"#008A75",
			color:"#FFF",
			//横向的显示方式
//			iconCls 和我们的font-awesome.css 用得比较的多
			//href 连接地址  blank 默认为true
			menus:[{iconCls:"",href:"",color:"",blank:true},{iconCls:"",href:""}],
			//点击后，数据的效果
			style:{"fa-envelope":"#466CA3","fa-phone":"#169209","fa-weixin":"#2DCB53","fa-qq":"#5A9EFA","fa-weibo":"red","fa-github":"#82807D"},
		},options||{});
		var _self = this;
		formateHtml(_self,setting.menus);
		formateJs(_self);
		/**
		 * 格式化我们的显示
		 */
		function formateHtml(_self,menus){
			var htmlStr ='<div class="social-connect">';
			$.each(menus,function(key,val){
				var blank = "_blank";
				if(val.blank != null && !val.blank){
					blank ="";
				}
				var line ='<a class="social-connect-element" style="background:'+setting.background+'" href="'+val.href+'" target="'+blank+'" ><i class="fa '+val.iconCls+' fa-fw" style="color:'+setting.color+'"></i></a>'; 
				
				htmlStr +=line;
			});
			htmlStr +="</div>";
//			console.log(_self);
			_self.append(htmlStr);
		}
		/**
		 * 获取点击的时候的背景显示的颜色
		 * 自己设定的颜色最优先
		 * 然后是 style中配置的颜色
		 * 最后是我们背景色
		 */
		function getBackground(cls){
			var color ="";
			$.each(setting.menus,function(key,obj){
				if(obj.iconCls == cls){
					color = obj.color;
				}
			});
			if(color== null || color == ""){
				var styles = setting.style;
				color = styles[cls];
			}
			return color == null || color == ""?setting.background:color;
		}
		function formateJs(_self){
			//设定点击事件
			_self.find(".social-connect a").hover(function(){
        		var classStr = $(this).find("i").attr("class");
        		classStr = classStr.substring(classStr.indexOf("fa")+3,classStr.indexOf("fa-fw")-1);
        		var style = setting.style;		
        		//设定点击的这个的颜色
        		$(this).css("background",getBackground(classStr.trim()));
        	},function(){
        		_self.find(".social-connect a").css("background",setting.background);
        	});
		}
	}
	/**
	 * 画出技能的圆形图
	 * 必须字段
	 * menu
	 */
	$.fn.drawSkillsArc = function(options){
		//设定参数
		var setting = $.extend({
			//图的名称
			name:"技能",
			//是否显示name 这个对象
			showTitle:true,
			//左边的数着显示的那个数据
			info:"总有刁民\n想害朕",
			//我们的技能菜单
			//title 是标题 score 是分数 半分制
			//subtitle 子标题   title 标题  score 是一个长度单位，可以大于100
			menu:[{title:"",score:100,color:"",
						subtitle:[{title:"",score:""},{title:"",score:""}]
				   },
				   {title:"",score:"",color:"",
						subtitle:[{title:"",score:""},{title:"",score:""}]
				   }
				],
			font:"Hiragino Sans GB, Microsoft YaHei, sans-serif"
		},options||{});
		
		
		var _self = this ; 
		//格式化数据
		formateHtml(_self);
		
		//技能图,创建图形
		//e是作的图
		var paper = Raphael("skillsArc", 830, 500);
		drawSkillsArc(paper)
//		setTimeout(, 1000);
		/**
		 * 画技能图
		 */
		function drawSkillsArc(paper) {
			//画最中间的那个圆形
			paper.circle(250, 250, 5).attr({
				//边框填充色
				stroke: "none",
				//填充色
				fill: "#193340"
			}).animate({
				//半径从5变到85的大小
				r: 85
			},
			//动画为慢慢变圆形
			1e3, ">");
			//写数据写圆形的 ，并前台显示
			var name = paper.text(250, 250, setting.name).attr({
				font: "20px Hiragino Sans GB, Microsoft YaHei, sans-serif",
				fill: "#fff"
			}).toFront();
			
			
			
			
			var content = paper.set();
			//定义字体 右边部分数据
			//画圆形，就是一个小园
			var u = paper.circle(702, 20, 5).attr({
				stroke: "none",
				fill: "#228fbd"
			}),
			//写路径 乡下的路径
			a = paper.path("M 702 20 L 702 20").attr({
				fill: "none",
				stroke: "#228fbd",
				"stroke-width": 1
			}).animate({path: "M702 20 L 702 180"},
			1e3, ">",drawInfo(paper,content));
			//我们使用容器来添加我们的对象，然后便于将来操作
			content.push(a);
			content.push(u);
			
			//写我们的circle
			setTimeout(
			    //name 是我们园最中间的文字 对象
				drawCircle(paper,name,content),
			1500);
		}
		
		/**
		 * 绘我们的圆形
		 * @param paper 纸张
		 * @param name 是我们的文字对象
		 */
		function drawCircle(paper,name,content){
			//添加自定义属性,这个属性是Ap 中的customAttributes
			//圆形出来的方法
			//arc[水平(就是半径多少),颜色,圆形半径]
			paper.customAttributes.arc = function(score, color, r) {
				var result = 3.6 * score;
				//分数太多 ，就 显示不出来效果了，所以我们需要设点缝隙
				 if(result == 360){
					 result = 359.99; 
				 } 
				//计算角度
				var i = (90 - result) * Math.PI / 180;
				var x = 250 + r * Math.cos(i);
				var y = 250 - r * Math.sin(i);
				//A 是画圆弧的命令(rx,ry,x-axis-ratation,large-arc-flag,sweep-flag,x,y)
				//+(i > 180) 是判断是否大于 180
				//large-arc-flag
				//
				circle = [["M", 250, 250 - r], ["A", r, r, 0, +(result > 180), 1, x, y]];
				return {path: circle,stroke: color};
			}
			
			//半径
			var r = 73;
			//x,y轴
			var xy = 250;
			var menus = setting.menu;
			
			for (var i = 0; i < menus.length; i++) {
				//获取集合
				var menu = menus[i];
//				console.log(menu);
				//变换文字  将 &换成_
				var id = "arc-" + menu.title.toLowerCase().replace("&", "_");
				//增长半径
				r += 30;
				//画圆弧
				var circle = paper.path().attr({
					//获取我们圆形的数据
					arc: [menu.score, menu.color, r],
					"stroke-width": 26
				});
				//节点id
				var date = paper.set();
				//menu.title
				//鼠标移上去的事件,我们通过这种方式就解决了移动上去的时候，找不到数据
				//我们给id也添加了函数
				circle.node.id = id,function(menu,title,score){
					//加上这句话,我们的包装程序就正常了，我觉得好神奇
				o("mouseover", circle),
				o("mouseout", circle),
				circle.mouseover(function(){
					this.animate({"stroke-width": 50,opacity: .75},1e3, "elastic");
					Raphael.type != "VML" && this.toFront(),
					//移除我们的字体
					name.stop().animate({opacity: 0},r, ">",
					function() {
						//console.log(menus);
						this.attr({
							text: title + "\n" + score + "%"
						}).animate({
							opacity: 1
						},
						r, "<")
					});
					//设定subtitle
//					console.log();
					var subtitles = menu.subtitle;
					//迭代数据
					var d = 30,
					v = 550,
					m = 150,
					g = v + 10;
					//创建集合
					for (var j = 0; j < subtitles.length; j++) {
						sub = subtitles[j];
//						console.log(sub);
						var c = d + 10,
						y = paper.rect(v, m + c * j, 1, d).attr({
							fill: menu.color,
							stroke: "none"
						}).animate({
							width: sub.score
						},
						2e3 * Math.random(), "bounce"),
						b = paper.text(g, c * j + m + d / 2, sub.title).attr({
							"font-size": 20,
							fill:"#fff",
							"font-family": setting.font,
							"text-anchor": "start"
						});
						//添加我们的数据，便于待会删除
						date.push(y);
						date.push(b);
						
					}
					
					//设定容器里面的数据效果
					//设定透明度为0 隐藏数据
					content.forEach(function(e) {
						var t = Raphael.animation({
							opacity: 0
						},
						500, ">");
						e.stop().animate(t)
					})
					
				});
				
				//鼠标移出去的效果
				circle.mouseout(function(){
					this.stop().animate({
						"stroke-width": 26,
						opacity: 1
					},r * 4, "elastic");
					name.stop().animate({opacity: 0},
					r, ">",function() {
						name.attr({
							text: setting.name
						}).animate({
							opacity: 1
						},
						r, "<")
					});
					if(date.length>0){
						date.forEach(function(obj) {
							obj.remove()
						});
						//清空集合
						date.clear();
					}
					//显示数据
					content.forEach(function(e) {
						var t = Raphael.animation({
							opacity: 1
						},
						1e3, ">");
						e.stop().animate(t)
					})
				});
				}(menu,menu.title,menu.score);
			}
		}
		//三年经验的 那个效果
		/**
		 * 画出我们的info数据的
		 */
		function drawInfo(paper,content) {
			var t = {
				fill: "#228fbd",
				stroke: "none",
				transform: "t615 180"
			},
			n = paper.path("M86.112,80.5 86.892,81.191 87.847,80.774 88.374,81.673 89.411,81.572 89.635,82.589 90.653,82.813 90.551,83.851 91.45,84.378 91.033,85.333 91.725,86.112 91.033,86.892 91.45,87.847 90.551,88.374 90.653,89.411 89.635,89.635 89.411,90.653 88.374,90.551 87.847,91.45 86.892,91.033 86.112,91.725 85.333,91.033 84.378,91.45 83.851,90.551 82.813,90.653 82.589,89.635 81.572,89.411 81.673,88.374 80.774,87.847 81.191,86.892 80.5,86.112 81.191,85.333 80.774,84.378 81.673,83.851 81.572,82.813 82.589,82.589 82.813,81.572 83.851,81.673 84.378,80.774 85.333,81.191 z").attr(t).animate({
				path: "M86.112,0 98.071,10.609 112.723,4.214 120.818,18 136.728,16.446 140.167,32.057 155.778,35.497 154.224,51.406 168.011,59.501 161.616,74.154 172.225,86.112 161.616,98.071 168.011,112.723 154.224,120.818 155.778,136.728 140.167,140.167 136.728,155.778 120.818,154.224 112.723,168.011 98.071,161.616 86.112,172.225 74.154,161.616 59.501,168.011 51.406,154.224 35.497,155.778 32.057,140.167 16.446,136.728 18,120.818 4.214,112.723 10.609,98.071 0,86.112 10.609,74.154 4.214,59.501 18,51.406 16.446,35.497 32.057,32.057 35.497,16.446 51.406,18 59.501,4.214 74.154,10.609 z"
			},
			2e3, "bounce").hover(
			//移到上面的效果
			function() {
				//写路径，动画效果
				this.animate({
					fill: "#005687",
					path: "M86.112,-16 100.293,-3.42 117.667,-11.003 127.267,5.345 146.132,3.502 150.211,22.014 168.723,26.093 166.879,44.958 183.228,54.557 175.645,71.932 188.225,86.112 175.645,100.293 183.228,117.667 166.879,127.267 168.723,146.132 150.211,150.211 146.132,168.723 127.267,166.879 117.667,183.228 100.293,175.645 86.112,188.225 71.932,175.645 54.557,183.228 44.958,166.879 26.093,168.723 22.014,150.211 3.502,146.132 5.345,127.267 -11.003,117.667 -3.42,100.293 -16,86.112 -3.42,71.932 -11.003,54.557 5.345,44.958 3.502,26.093 22.014,22.014 26.093,3.502 44.958,5.345 54.557,-11.003 71.932,-3.42"
				},
				1e3, "bounce")
			},function() {
				this.animate({
					fill: "#228fbd",
					path: "M86.112,0 98.071,10.609 112.723,4.214 120.818,18 136.728,16.446 140.167,32.057 155.778,35.497 154.224,51.406 168.011,59.501 161.616,74.154 172.225,86.112 161.616,98.071 168.011,112.723 154.224,120.818 155.778,136.728 140.167,140.167 136.728,155.778 120.818,154.224 112.723,168.011 98.071,161.616 86.112,172.225 74.154,161.616 59.501,168.011 51.406,154.224 35.497,155.778 32.057,140.167 16.446,136.728 18,120.818 4.214,112.723 10.609,98.071 0,86.112 10.609,74.154 4.214,59.501 18,51.406 16.446,35.497 32.057,32.057 35.497,16.446 51.406,18 59.501,4.214 74.154,10.609 z"
				},
				1e3, "bounce")
			});
			//添加节点，用于后面操作这些节点
			content.push(n),
			setTimeout(function() {
				var t = paper.text(703, 250, setting.info).attr({
					"font-size": 22,
					fill: "#fff",
					"font-family": setting.font
				});
				content.push(t)
			},
			1e3);
		}
		
		/*
		 * 添加html
		 * 通过给定的数据来生成我们需要的html
		 * @pram _self 就是我们传递过来的数据
		 */
		function formateHtml(_self){
			var skillStr = formateSkillHtml(setting.menu);
			var htmlStr = '<div  class="skill"><div class="inner">';
			var title = ""
			if(setting.showTitle){
				title = '<h2 class="animated">'+setting.name+'</h2>';
			}
			htmlStr = htmlStr +title +'<div class="legend"><h3 class="animated">图例:</h3>';
			htmlStr = htmlStr+skillStr+'</div><div id="skillsArc"></div></div></div>';
			_self.html(htmlStr);
			_self.find(".legend h3").addClass("fadeInUp"),
			_self.find(".skillsList li").each(function(e) {
				var t = $(this);
				setTimeout(function() {
					t.addClass("fadeInLeftBig")
				},
				e * 200)
			})
			_self.find(".skillsList li").hover(function() {
				var e = "arc-" + $(this).text().toLowerCase();
				e = e.replace(/&/, "_"),
				$("#" + e).trigger("mouseover")
			},
			function() {
				var e = "arc-" + $(this).text().toLowerCase();
				e = e.replace(/&/, "_"),
				$("#" + e).trigger("mouseout");
			});
		}
		/**
		 * 格式化skill  html中数据
		 */
		function formateSkillHtml(menu){
			var skillStr = '<ul class="skillsList">';
			$.each(menu,function(key,val){
				skillStr +='<li class="animated" style="background:'+val.color+';">'+val.title+'</li>';
			});
			skillStr += "</ul>";
			return skillStr;
		}
		
		
		function o(e, t) {
			t.node["on" + e] = function() {
				for (var n = 0,r = t.events.length; n < r; n++) t.events[n].name == e && t.events[n].f.call(t);
			}
		}
	}	
	/**
	 * 这个画图的方法，是我
	 * js依赖
	 * raphael-min.js
	 * 必要字段
	 * exp  其中exp中的数据和legend中的需要对应
	 * legend 
	 * info
	 */
	$.fn.drawExperienceTimeLine = function(options){
		//设定参数
		var setting = $.extend({
			//是否是自动增长 ，设定了自动增长，那么我们的文档 height就没有用了
			autoHeight:true, //默认开启这个
			//高度
			//高度需要设定autoHeight:false 才可以修改
			 height:680, 
			 //宽度
			 width:900,
			 info:"",
			 //图例的数据
			 legend:[{color:"",title:""},{color:"",title:""}],
			 //图例对应的数据需要一一的对应，这样就便于操作
			 //weight 设定权重,默认为1 ，通过权重设定圆圈的大小
	 		 exp:[[{date:"",title:"",blank:"",weight:1},{date:"",title:"",blank:""}],[]],
	 		line:{
	 				fill: "none",
	 				//使用虚线
	 				"stroke-dasharray": "- ",
	 				//线条颜色
	 				stroke: "#000",
	 				"stroke-width": 1
	 		},
	 		 //字体
	  		font:{
	 			//标题点的字体样式
	 			"title":{ 
	 				"font-size": 16,
	 				 fill: "#898989",
	 				"font-family":"Hiragino Sans GB, Microsoft YaHei, sans-serif",
	 				"text-anchor": "start"
	 			},
	 			//日期数据的字符
	 			"date":{
	 				"font-size": 14,
	 				 fill: "#649996",
	 				"font-family":"Hiragino Sans GB, Microsoft YaHei, sans-serif",
	 				"text-anchor": "start"
	 			},
	 			//后面的备注，所写得数据
	 			"blank":{
	 				"font-size": 14,
	 				 fill: "#898989",
	 				"font-family": "Hiragino Sans GB, Microsoft YaHei, sans-serif",
	 				"text-anchor": "start"
	 			}
	 		}
		},options||{});
		//定义的线条形状
 		var line=setting.line;
 		//获取我们的高度信息的数组
 		//设定方法
		var id = $(this).attr("id");
		//设定纸张
		var height = setting.height;
 		//高度更具浏览器的高度来生成
 		if(setting.autoHeight){
 			height =  getPaperHeight();
 		}
 		var paper = new Raphael(id, setting.width, height);
// 		console.log("文档高度"+height);
 		//获取字体
 		var font =setting.font;
 		//写字体的标题
 		paper.text(0, 40, setting.info).attr(font.title);
 		
 		//写图例
 		//var nodes = {xx:{},xx:{}}
 		/**
		 * 图标说明，图例
		 //图例
		 height:
		 width:
		 legend:[{color:"",title:""},{color:"",title:""}]
 		 exp:[[{date:"",title:"",blank:""},{date:"",title:"",blank:""}],[]];
		 */
 		/*var xDate = getX();
 		console.log(xDate);*/
		//画我们的图例
		drawLegend(paper,setting.legend,font);
		//画线
		drawLine(paper,font,setting.legend,setting.exp);

		 //前45 px的是我们的上面没有数据的 可以使用magin-top:-50px; 解决这个问题
		 //130 开始计算,这个是最低点, 就是那个分丫 的点
		/**
		竖着排版的方案，最多可以相 距离 80px 就是说三行数据都存在的情况
		两行 的情况 相距 是60 px
		*/			 
		/**
		 * 绘制我们的下面的线条
		 */
		function drawLine(paper,font,legends,exp){
			var yDate = getY();
			//画图
	 		paper.path("M 130 95").attr(line).animate({
				//动画             x   y    x   y  x   y  x   y   x  y  x   y  x  y   x   y
	 			//画我们的那条转角的线条
				path: "M 130 50 L 170 50 176 43 182 60 188 50 260 50 300 95 385 0"
			},1e3, "elastic",function(){
//				console.log(height);
//				console.log("纸张高度"+)
				var maxHeight = getPaperHeight();
				//写我们的那个往下的数据
				paper.path("M300  L 300 130").attr(line).animate({
					//大L表示的是直线， 小 l我就不理解了，这个和文档中写的有点不一样
					//l 300 600 (l x y) 表示斜着的一瞥,相对于自己本省设定的
					//需要修改这个地方的 yDate  设定最高的地方，然后可以一直写数据
					path: "M300 95 L 300 "+(maxHeight-50)+" 350 "+maxHeight,
				},
				1e3, "backOut");
				/*$.each(legends,function(key,val){
					console.log(val)
					
				});*/
				var index =0;
				var i = 0;
				$.each(exp,function(key,val){
					
					$.each(val,function(key,obj){
						// y轴
						var y = yDate[index];
						//填充 颜色
						var color = legends[i].color;
						//权重
						var weight =obj.weight;
						if( weight== null || weight <=  0){
							weight =1;
						}
						var r = weight*10;
						
						paper.circle(300, 1500, r).attr({
							stroke: "none",
							fill: color
						}).animate({cy: y},1e3 + 1e3 * Math.random(),"backOut").hover(
							function() {
								this.animate({r: r * 1.5},500, "bounce");
								//console.log(this);
								//获取y轴的位置
								//var xnow = this.attrs.cx;
								//var ynow = this.attrs.cy;
								//坐标不知道
								//txt =paper.text(300,(ynow+ r * 1.5),"都比").attr(font.date);
						},function() {
							this.animate({r: r},500, "bounce");
							//txt.remove();
						});
						/*
						生成日期的数据
						*/	
						paper.text(360, 1500, obj.date).attr(font.date).animate(
							Raphael.animation({y: y},1e3, "backOut").delay(1e3));
						/*
						生成title的数据
						*/
						paper.text(360, 1500, obj.title).attr(font.title).animate(
							Raphael.animation({y: y + 25},1e3, "backOut").delay(1e3));
						/*
						生成info的数据,格式化里面的数据，当不存在obj.blank 的情况
						*/
						if(obj.blank == null){
							obj.blank = "";
						}
						paper.text(360, 1500, obj.blank).attr(font.blank).animate(
							Raphael.animation({y: y + 50},1e3, "backOut").delay(1e3));
						
						index++;
					})
					i++;
				});
			});
		}
		//画我们的lengend
		/**
		 * 传入paper的 纸张
		 * legends 我们的标注
		 * font 字体数据
		 */
		function drawLegend(paper,legends,font){
			var xDate = getX();
			//设定两个图例的样式
			for (i = 0; i < legends.length; i++){
				var legend =legends[i]; 
				//这个地方来判断过多的xDate 来设定宽度
				//画 圆  circle(x,y,r)
				var r = 10;
				var x = xDate[i][0];
				var y =xDate[i][1];
			    paper.circle(x, y*30, r).attr({
					//边框
			    	stroke: "none",
			    	//填充色
					fill: legend.color
				}).hover(
					function() {
						this.animate({r: r * 1.5},500, "bounce")
				},function() {
					this.animate({r: r},500, "bounce")
				});
				//设定字体
				paper.text(x + 15,y*30, legend.title).attr(font.title);
			}
	 		
 		}
 		//获取浏览器的高度
		/**
		 * 获取纸张的高度
		 */
 		function getPaperHeight(){
 			var height =setting.height; 
 	 		var countHeight = (getLegendCount()-1)*80+50+ 95;
 			//可以写字体的高度
 	 		//当时一页显示的情况下，如果我们的高度大于我们的hei,并且不是自动增长的情况
 	 		if(height >countHeight && !setting.autoHeight){
 	 			//当我们r
 	 			return height;
 	 		}else{
 	 			return countHeight;
 	 		}
 		}
 		
 		/**
 		 * 获取图例显示的坐标
 		 */
 		function getX(){
 			var len = setting.legend.length;
 			var count = (setting.width-400)/100;
 			//400开始起算 ，一100一个，然后 我们要求的标注的数据不能太长
 			var xDate = new Array();
 			for(var i=0;i<len;i++){
 				var page = parseInt(((i)/count))+1;
 				xDate[i] = [(400+(i%count)*100),page];
 			}
 			return xDate;
 		}
 		
 		/**
 		 * 获取我们传递的数据中 legend的个数
 		 */
 		function getLegendCount(){
 			var index = 0;
 			$.each(setting.exp,function(){
 	 			$.each($(this),function(){
 	 				 index++;
 	 			});
 	 		});
 			return index;
 		}
 		/**
 		 * 获取文本显示的y轴坐标
 		 * @param
 		 * @return heightDate 每一个时间节点高度信息
 		 */
 		function getY(){
 			//计算我们的每个 显示所需要的高度和坐标
 	 		var height =getPaperHeight();
 	 		//去掉我们的顶部95没用的
 	 		//height -=95;
 	 		//获取传递竟来的exp的数量
 	 		var exp = setting.exp;
 	 		var expDate = new Array();
 	 		/**
 			竖着排版的方案，最多可以相 距离 80px 就是说三行数据都存在的情况
 			两行 的情况 相距 是60 px
 			[95,]
 			*/
 	 		var index =0;
 	 		//计算的高度
 	 		$.each(exp,function(){
 	 			$.each($(this),function(){
 	 				//console.log($(this));
 	 				expDate[index]= getPropCount($(this));
 	 				 index++;
 	 			});
 	 		});
 	 		
 	 		//console.log(index);
 	 		//获取高度信息
 	 		var heightDate = new Array() ;
 	 		
// 	 		console.log(expDate);
 	 		heightDate[0] = 95;
 	 		//最后一个的数据不用计算
 	 		for(var i=0;i<expDate.length-2;i++){
 	 			var len = 0;
 	 			//当不是自动增长的情况下,当是自动增长的情况，直接就是多少了
 	 			if(expDate[i]== 2 && !setting.autoHeight){
 	 				len = heightDate[i] +60;
 	 			}else{
 	 				len = heightDate[i] +80;
 	 			}
 	 			heightDate[i+1] =  len;
 	 		}
 	 		//设定最后一个在分支那儿,去掉转弯的50 
 	 		heightDate[expDate.length-1] = height-50;
 	 		//console.log(heightDate);
 	 		//当我们的高度过长的问题
 	 		//console.log(heightDate);
 	 		return heightDate;
 		}
 		
 		/**
 		 * 获取对象中数据的个数 不包含空数据 和
 		 * @param obj 传递进来的数据
 		 */
 		function getPropCount(obj){
 			var count = 0;
 			obj = obj[0]
 			$.each(obj,function(key,val){
 				if(key !="weight"){
 					if(obj[key] != null && obj[key]!=""){
 						count++;
 					}
 				}
 			});
 			//计算有数据的个数 
 			return count;
 		}
	}
	
	/**
	 * 创建tabs的标签栏目
	 */
	$.fn.tabs = function(options){
		//设定参数
		var setting = $.extend({
		},options||{});
		//设定方法
	}
	
	/**
	 * 格式化输出我们的代码数据,其中依赖了prettify.min.js 和prettify.css这两个文件
	 * 将div中的数据转化为代码
	 * 
	 * 给代码添加样式编辑选择
	 * 时间 2016-1-18
	 * yellowcong
	 * 
	 * 必要字段
	 * selectors 需要格式化显示的类
	 */
	$.fn.prettify = function(options){
		//设定参数
		var setting = $.extend({
			//是否显示nums
			linenums:true,
			//是否转换，将html < > 转换为可以识别的数据
			trans:true,
			//多个选择器
			selectors:[]
		},options||{});
		
		var _self = this;
		createCode(_self,setting);
		
		
		/**
		 * 去掉code中的 <> ,替换成
		 * &lt;<
		 * &gt; >
		 */
		function transCode(code){
			//通过replace 实现的 效果不是很好，所以使用的 切割来替代
			//code = code.replace("<","&lt;").replace("</","&lt;/").replace(">","&gt;");
			//console.log(code);
			var date = code.split("<");
			var codeStr ="";
			$.each(date,function(key,val){
				//当字符串是 回车的  符号
				//分割的时候，我们第一个对象中，前面 不需要添加连字符
				if(key == 0){
					codeStr = codeStr+val;
				}else{
					codeStr = codeStr+"&lt;"+val;
				}
			});
			
			date = codeStr.split(">");
			//console.log(date);
			var len = date.length-1;
			codeStr="";
			$.each(date,function(key,val){
				//当字符串是 回车的  符号
				codeStr = codeStr+val;
				//分割到最后一个，不需要添加连接符号了
				if(key != len){
					codeStr = codeStr+"&gt;";
				}
			});
			return codeStr;
		};
		
		//设定方法
		
		function formateCode(_self,linenums,trans){
			var date = $(_self).html();
			if(trans){
				date = transCode(date);
			}
			
			//console.log(date);
			//判断是否是一个 包含了数字的方法
			if(linenums){
				date = '<pre class="prettyprint linenums">'+date;
			}else{
				date = '<pre class="prettyprint">'+date;
			}
			date += "</pre>";
			return date;
		}
		
		
		/**
		 * 创建我们的最终显示的结果，函数入口
		 */
		function createCode(_self,setting){
			var selectors = setting.selectors
			if(selectors != null && selectors.length >0){
				$.each(selectors,function(key,_self){
					//格式化数据
					var date = formateCode(_self,setting.linenums,setting.trans);
					//设定当前div的html
					$(_self).html(date);
					
				});
			}
			
			//格式化输出代码样式，将数据格式化输出,这个方法输出一次
		    prettyPrint();
		    
		    //设定显示的js效果
			//prettyprint
		    formateStyle(_self);
		    
		}
	    /**
	     * 格式化的输出我们的代码样式，
	     * 设定hover每一行的时候的数据显示
	     * 设定左边栏目的颜色
	     */
	    function formateStyle(_self){
	    	//奇数
	    	//_self.find("pre ol li:even").css("background","#F9F9F9");
	    	//偶数
	    	//_self.find("pre ol li:odd").css("background","#F9F9F9");
	    	
	    	//将编号弄到我们的左边的侧栏上面
	    	//_self.find("pre ol").css("margin-left","-9px");
	    	$("body").find("pre ol li").hover(function(event){
	    		//对于在插件中的this是 同我们的在直接写是不一样的，获取需要通过$(this)
	    		$(this).css({"background":"#EEE","cursor":"pointer"});
	    	},function(){
	    		$(this).css("background","#F9F9F9");
	    	});
	    	
	    	//background-color
	    	//侧栏的属性设定
	    	//this.find("pre").css("box-shadow"," 40px 0px 0px #5BC0DE inset, 41px 0px 0px #ECECF0 inset;");
	    }
	    
	}
	
	 /*
	  * DropMenu
	  * 下拉的按钮js
	  * 必要字段menu
	  */ 
	$.fn.dropmenu = function(options){
			//设定参数
			var setting = $.extend({
				//高度
				width:60,
				//高度
				height:30,
				//偏向,我们需要设定偏向设定
				align:"left",
				//当menuWidth 的值设定得过小的情况下，是不起作用的
				menuWidth:160,
				//{title:"",icoCls:""}  
				//titile 是标题，iconCls是按钮的样式,我们配合了font-awesome.css 使用 
				menu:[{title:"",iconCls:""}],
			},options||{});
			
		_self = this;
		createDropMenu(_self, setting.menu,setting.width,setting.height,setting.menuWidth);
		/**
		 * 创建下拉菜单
		 */
		function createDropMenu(_self,menu,width,height,menuWidth){
			_self.append(formateDropMenu(menu,width,height,menuWidth));
		}
			
		/**
		 * 格式化输出 dropdown-menu
		 * @param menu  传递一个菜单数组进来
		 * @return 返回我们的渲染的菜单回来
		 * setting.menuWidth
		 */
		function formateDropMenu(menu,width,height,menuWidth){
			var menuStr = "";
			if(menu!= null && menu.length >0){
				menuStr = menuStr+'<span class="input-group-btn " >'+
				'<button class="btn btn-danger dropdown-toggle" data-toggle="dropdown" type="button"  style="width:'+width+'px;height:'+height+'px;align:center;font-size:12px;">所有<i class="fa fa-filter fa-fw"></i></button>'+
				'<ul class="dropdown-menu" style="width:'+menuWidth+'px">';
				//style="width:'+menuWidth+'px;backgroud:yellow;"
				$.each(menu,function(key,val){
					//<i class="fa fa-search fa-fw"></i>
					if(val.iconCls){
						menuStr +='<li ><i class="fa '+val.iconCls+' fa-fw"></i>'+val.title+'</li>';
					}else{
						menuStr +='<li><i class=""></i>'+val.title+'</li>';
					}
					
				});
				menuStr+="</ul></span>";
			}
			return menuStr;
		}	
	}
	//searchbox
	/**
	 * 按钮菜单
	 *FIXME 
	 */
	$.fn.menubutton = function(options){
		//设定参数
		var setting = $.extend({
			//高度
			width:"auto",
				
		},options||{});
	}
	
	
	/*｛
width: 可以不传
height: 高度可以不用穿，我们弄水平的菜单栏目就会需要
菜单数据
menu:[iconCls:"",title:"",href:"",subMenu:[{iconCls:"",title:"",href:""},{iconCls:"",title:"",href=""}]]

菜单样式修改
复写这些方法的时候注意要修改 这下面的4个样式的颜色
.navs_sub_select
.navs_sub_select_active
.navs_select
.navs_select_active
他们的颜色，就是background 和color这两个属性修改需要的颜色

背景样式
.nav_left_list 然后是 background的颜色 
字体颜色 color 然后设定字体的颜色，
.nav_left_list a 
nav的分割栏的颜色
.nav_left_list .nav_list_navs li 

修改这7个样式文件，就可以搞定我们的navs的颜色啥的
然后就没有然后了，就搞定了，需要结合bootstrap

必要字段
menu
｝*/
	$.fn.navs = function(options){
		//设定s参数
		var setting = $.extend({
			//高度
			height:30,
			//宽度
			width:250,
			//方向,设定方向
			//vertical  竖直，默认垂直的
			//horizontal 水平
			direction:"vertical",
			//提示信息
			//菜单栏目，过滤字段
			//如果这个字段不填，我们就不自动生成菜单栏目
			//{title:"",icoCls:""}  
			//titile 是标题，iconCls是按钮的样式,我们配合了font-awesome.css 使用 
			//href 是链接
			//subMenu 是二级标题，我们直设定了二级，不弄三级
			menu:[{title:"",iconCls:"",href:"",subMenu:[{title:"",iconCls:"",href:""}]}],
			//处理我们的search的方法
		},options||{});
		
		var _self = this;
		
//		var menus = getMenus();
		var menus = setting.menu;
		//将json数据转化为 string数据
//		console.log(menus);
		var htmlStr= formateNavs(_self,menus);
//		console.log(htmlStr);
		_self.html('<div class="nav_left_list" style="width:'+setting.width+'px;">'+htmlStr+'</div>');
		//格式化我们的对象
		formateStyle(_self);
		//显示栏目
		/**
		 * 格式化，设定现实的js效果
		 */
		function formateJs(_self){
			
		}
		/**
		 * 格式化显示他的样式
		 * @param _self
		 */
		function formateStyle(_self){
			//设定参数
			//设定点击数据
			var isOpen = false;
			var lastClick = null;
			//设定a标签的点击事件
			_self.find(".nav_list_navs a").hover(function(){
				var is_sub = $(this).parent().parent("ul").hasClass("sub_navs");
				if(is_sub){
					//设定颜色
					$(this).css("color","#E74C3C");
				}else{
					//navs_select 就是点击的选中的颜色，如果
					$(this).addClass("navs_select");
				}
			},function(){
				var is_sub = $(this).parent().parent("ul").hasClass("sub_navs");
				if(is_sub){
					$(this).css("color","#fff");
				}else{
					//当没有打开的情况下，才会变色
					$(this).removeClass("navs_select");
				}
			}); 
			
			//slideToggle 这个可以自己定义一个
			//隐藏的栏目
			_self.find(".sub_navs").hide();
			
			//设定点击事件     
			_self.find(".nav_list_navs li a:not(.sub_navs li a)").click(function(){
				
				//判断是否是子nav_bar
				var is_sub = $(this).parent().parent("ul").hasClass("sub_navs");
				
				if(!is_sub){
					isOpen = !isOpen;
					//设定颜色
					$(this).addClass("navs_select_active");
					//点击的数据
					//当点击的不是一个对象的情况
					if(lastClick != $(this).children("span").html()){
						//当最后一个点击的不是空的情况
						if(lastClick != null){
							//上升所有的 navs
							_self.find(".sub_navs").slideUp();
							//移除 所有的下拉效果
							_self.find(".drop-icon").removeClass("nav_show_select");
							setColorByName(_self,lastClick);
						}
//						console.log("上一次点击\t"+lastClick);
						lastClick = $(this).children("span").html();
					}
					//设定点击的对象的效果
					$(this).css("border-bottom","1px solid #374D63");
					//移动我们已经点开的数据
					$(this).siblings(".sub_navs").slideToggle();
					//设定我们的按钮样式
					$(this).children(".drop-icon").toggleClass("nav_show_select");	
			
				}
				//取消默认点击事件
				return false;
			});
		}
		/**
		 * 根据颜色来设定我们的样式移除 
		 */
		function setColorByName(_self,name){
			$.each(_self.find(".nav_list_navs a"),function(key,val){
				var title = $(this).children("span:first").html();
				if(title == name){
					//$(this).css("background","#33485C");
					$(this).removeClass("navs_select_active");
					return false;
				}
			})	
		}
		/**
		 * 生成我们的navs的html数据
		 * @param _self 对象本身
		 * @param menus 菜单
		 */
		function formateNavs(_self,menus){
			//var jsonStrs = "[";
			var navsStr = '<ul class="nav_list_navs">';
			$.each(menus,function(key,nav){
				var navStr = '<li><a href="'+nav.href+'"> <i class="fa '+nav.iconCls+' fa-fw nav_icon"></i>'+
				'<span class="nav_text">'+nav.title+'</span>';
				//jsonStr ="{href:'"+nav.href+"',iconCls:'"+nav.iconCls+"',title:'"+nav.title+"',"
				//<i class="fa fa-chevron-circle-right drop-icon"></i></a>
				if(nav.subMenu != null && nav.subMenu.length >0){
					navStr+='<i class="fa fa-chevron-circle-right drop-icon"></i></a><ul class="sub_navs">';
					//jsonStr+= "subMenu:[";
					//然后迭代数据
					var subMenuStr = "";
					//var subJson ="";
					$.each(nav.subMenu,function(index,subMenu){
						subMenuStr+='<li><a href="'+subMenu.href+'"> <i class="fa '+subMenu.iconCls+' fa-fw"></i>'+
						'<span>'+subMenu.title +'</span></a></li>';
						//subJson += '{iconCls:"'+subMenu.iconCls+'",title:"'+subMenu.title+'",href:"'+subMenu.href+'"},'
					})
					//jsonStr = jsonStr+subJson+"]},";
					navStr=navStr+subMenuStr+ "</ul></li>";
				}else{
					navStr+="</a></li>";
					//jsonStr +="}";
				}
				//jsonStrs +=jsonStr;
				navsStr +=navStr;
			});
			//console.log(jsonStrs);
			navsStr +='</ul>';
			return navsStr;
		}
		
		/**
		 * 获取到我们的menu数据 返回的是一个 数组对象
		 * 
		 */
		function getMenus(){

			//获取菜单中的所有数据 ,这个函数是获取数据用的，并没有太大的实际意义，只是通过程序解决问题，总比一个一个的数数据强
			var navs = _self.find(".nav_list_navs li:not(.sub_navs li)");
			var objs = new Array();
			//console.log("菜单个数"+navs.length);
			var j = 0;
			$.each(navs,function(){
				var obj = {};
				var title = $(this).find("span").html();
				var iconCls =$(this).find("i")[0];
				iconCls = $(iconCls).attr("class");
				iconCls = iconCls.substring(iconCls.indexOf("fa")+3,iconCls.indexOf("fa-fw"));
				obj.title = title;
				obj.iconCls = iconCls;
				obj.href= "";
//				console.log(iconCls);
				//子菜单
				var subNavs =$(this).find(".sub_navs li");
				var subMenus = null;
				if(subNavs.length >0){
					subMenus= new Array();
					var i =0;
					$.each(subNavs,function(){
						var title = $(this).find("span").html();
						var iconCls =$(this).find("i")[0];
						iconCls = $(iconCls).attr("class");
						iconCls = iconCls.substring(iconCls.indexOf("fa")+3,iconCls.indexOf("fa-fw"));
						var subMenu ={};
						subMenu.title = title;
						subMenu.iconCls = iconCls;
						subMenu.href= "";
						subMenus[i] = subMenu;
						i++;
					});
				}
				obj.subMenu= subMenus;
				objs[j] =obj;
				j++;
			});
			return objs;
		}
	}

	/**
	 * 通过这个插件来生成搜索的栏目
	 * 搜索栏目
	 * 这个里面没有必要的字段，但是
	 * 一般我们需要设定
	 * menu 和searcher
	 */
	$.fn.searchbox = function(options){
		//设定参数
		var setting = $.extend({
			//高度
			height:30,
			//宽度
			width:400,
			//提示信息
			prompt:"输入关键字...",
			//菜单栏目，过滤字段
			//如果这个字段不填，我们就不自动生成菜单栏目
			//{title:"",icoCls:""}  
			//titile 是标题，iconCls是按钮的样式,我们配合了font-awesome.css 使用 
			menu:[{title:"",iconCls:""}],
			//处理我们的search的方法
			searcher:function(value,name){}
		},options||{});
		
		var _self = this;
		createBox(_self);
		//创建表格
		function createBox(_self){
			var box = formateBox(setting.menu, setting.prompt, setting.width, setting.height);
			_self.append(box);
		}
		/**
		 * 格式化我们的box
		 * @param menu,prompt,width,height
		 */
		function formateBox(menu,prompt,width,height){
			var boxStr = '<div class="table_search_menu" style="width:'+width+'px;">'+
			'<div class="input-group input-group-sm input_group_small"  style="line-height: '+height+'px;">';
			boxStr =boxStr+ formateDropMenu(menu);
			
			boxStr =boxStr+'<input type="text"  class="form-control" placeholder="'+prompt+'"/>'+
			'<span class="input-group-btn">'+
			'<button class="btn btn-success">查询<i class="fa fa-search fa-fw"></i></button>'+
			'</span></div></div>';
			
			return boxStr;
		}
		
		/**
		 * 格式化输出 dropdown-menu
		 * @param menu  传递一个菜单数组进来
		 * @return 返回我们的渲染的菜单回来
		 */
		function formateDropMenu(menu){
			var menuStr = "";
			if(menu!= null && menu.length >0){
				menuStr = menuStr+'<span class="input-group-btn ">'+
				'<button class="btn btn-danger dropdown-toggle" data-toggle="dropdown" type="button">所有<i class="fa fa-filter fa-fw"></i></button>'+
				'<ul class="dropdown-menu">';
				$.each(menu,function(key,val){
					//<i class="fa fa-search fa-fw"></i>
					if(val.iconCls){
						menuStr +='<li><i class="fa '+val.iconCls+' fa-fw"></i>'+val.title+'</li>';
					}else{
						menuStr +='<li><i class=""></i>'+val.title+'</li>';
					}
					
				});
				menuStr+="</ul></span>";
			}
			return menuStr;
		}
	}
	/**
	 * 搜索栏目
	 * FIXME  解决布局插件
	 */
	$.fn.layout = function(options){
		//设定参数
		var setting = $.extend({
			//高度
			width:"auto",
				
		},options||{});
	}
	/**
	 * 分页操作，这个和我我们的pagindate 耦合性过低，不好单独使用,而且也没有单独使用的价值
	 */
	$.fn.pagination = function(options){
		//设定参数
		var setting = $.extend({
			//分页总大小
			total:6,
			//分页大小
			pageSize:10,
			//分页默认显示页面
			pageNumber:1,
			conf:{},
			//分页的大小
			pageList:[10,20,30,40,50],
			selector:null,
			//传递过来的数据
			//{"pageSize":10,"pageNow":1,"pageCount":2,"rowCount":"data":[{}...]}
			//pager:{} //默认情况
			//测试数据
			pager:{"pageSize":10,"pageNow":1,"pageCount":6,"rowCount":21,"data":[]}
		},options||{});
		
		//如果哪个函数匹配，就调用哪一个函数
		/*if(typeof options == 'string'){
			if(options == "hehe"){
//				say();
			}
		}*/
		
//		var result = formateSelect(setting.pageList);
		var _self = this;
		var result = formatePager(setting.pager,setting.pageList,setting.pager.pageCount);
		_self.html(result);
		//设定js的点击事件
		formatePageJs(_self);
		//格式化selector的实践 select
		formateSelector(_self);
		//格式化span的左右点击 事件
		formateSpanJs(_self);
		
		//设定数字的输入样式，输入数字，然后点击右边的数据，能跳到我们需要的页面上
		//这个是文字输入到上面的效果，这个效果是非必须的
		//form-control 这个对象中的属性
		/*_self.find(".table_pager_info input:text").focus(function(){
			$(this).keyup(function(){
				var page = $(this).val();
				var result = parseInt(page);
				if((result+"").length == page.length){
					console.log("是数字");
					//$(this).addClass("form-control:focus");
					//
					$(this).css({
						"box-shadow":"inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px rgba(102, 175, 233, .6)",
						"border":"1px solid #66AFE9"
					});
				}else{
					console.log("是字符串");
					//添加错误的光晕效果
					
					//设定边框
					//$(this).css("border","1px solid #C9302C");
					// box-shadow: ;
					$(this).css({
						"box-shadow":"inset 0 1px 1px #CA8583, 0 0 8px #C9302C",
					});
					
					//设定错误
					//$(this).addClass("table_pagination_input_err");
				}
			});
		});*/
		
		
		/*
		//获取最后的数字，获取我们的分页的最后一个index
		var urls = _self.find(".table_pagination li a");
		var lastUrl = urls[urls.length-2];
		var lastIndex = $(lastUrl).attr("href");
		console.log(lastIndex);
		//分割字符的时候，需要保证pagenow 需要在最前面
		lastIndex =getHrefIndex(lastIndex);
		console.log(lastIndex);
		*/
		function formateSelector(_self){
			//设定下拉框，设定页数设置
			_self.find("select").change(function(){
				//获取到我们的pageSize
				var pageSize = $(this).val();
				//console.log(pageSize);
				//FIXME 明天解决
				//设定href角标
				
				//加载我们的数据，设定发送
				var url = setting.conf.url;
				//pageNow
				//当直接是
				//console.log(url);
				//当是刚刷新就去点击页面数的情况,直接都回到第一页，没说的
				if(url.indexOf("?") ==-1){
					url = url+"?pageSize="+pageSize;
					console.log(url);
				}else{
					//当是点击了分页后，然后在点击我们的页面大小
					var urlStr = url.split("?");
					url = urlStr[0]+"?pageSize="+pageSize+"&pageNow=1";
				}
				//设定url
				setting.conf.url = url;
				//加载我们的数据 
				$(setting.datagrid).datagrid("load",setting.conf,setting.selector);
				//更新 index
				updateIndex(_self,1);
				//更新 左边的info 数据
//				setting.pager.
				var pageCount = parseInt((setting.pager.rowCount -1)/pageSize) +1;
				//console.log("页数\t"+pageCount);
				//更新分页多少
				//updatePage(_self,1,pageCount);
				//设定url
				//var urls = _self.find(".table_pagination li a");
				var htmlStr = formatePagination(pageCount,false);
				_self.find(".table_pagination").html(htmlStr);
				//格式化js显示,我们需要设定pageCount 
				setting.pager.pageCount =pageCount; 
				setting.pager.pageSize =pageSize;
				formatePageJs(_self);
				
				//更新页面数
				updatePageCount(_self,pageCount);
				console.log(url);
				//formateSpanJs(_self);
			});
		}
		
		/**
		 * 更新显示的页面数
		 * @param _self  this
		 * @param rowCount 记录条数
		 */
		function updateRowCount(_self,rowCount){
			_self.find(".table_pager_info_rowcount").html(rowCount);
		}
		
		/**
		 * 更新显示的页面数
		 * @param _self  this
		 * @param pageCount 页面数量
		 */
		function updatePageCount(_self,pageCount){
			_self.find(".table_pager_info_pagecount").html(pageCount);
		}
		/**
		 * 格式化span中的上一页下一页
		 * 这个方法只能运行一遍，不然绑定多变，就会有问题
		 * @param _self  this
		 */
		function formateSpanJs(_self){
			_self.find(".table_pager_info a").click(function(event){
				//获取数据
				var href = $(this).attr("href");
				//解决第一个按钮的问题
				var date = $(this).html();
				var newIndex =1;
				var index = _self.find(".table_pager_info input:hidden").val();
				if(date == "«"){
					//console.log("上一下页面");
					//上一页
					if(index <=1){
						return false;
					}
					newIndex = index-1;
					href = href+newIndex;
					
					
				}else if(date == "»"){
					//console.log("下一页");
					var count = setting.pager.pageCount;
					newIndex = parseInt(index)+1;
					//当是最后一页面的情况
					if(index == count){
						return false;
					}
					href = href+newIndex;
					
				}
				console.log(href);
				updatePage(_self,newIndex,setting.pager.pageCount);
				
				//更新索引
				updateIndex(_self, newIndex);
				setting.conf.url = href;
				//更新索引
				//加载我们的数据
				$(setting.datagrid).datagrid("load",setting.conf,setting.selector);
				event.preventDefault();
				return false;
			});
		}
		//设定他们的点击事件,获取到请求的url
		/**
		 * 添加分页插件的点击事件，这样就有多个点击的事件了
		 * @param this  对象
		 */
		function formatePageJs(_self){
			_self.find(".table_pagination li a").click(function(){
				//获取数据
				var href = $(this).attr("href");
				//解决第一个按钮的问题
				var date = $(this).html();
				var newIndex =1;
				var index = _self.find(".table_pager_info input:hidden").val();
				if(date == "«"){
					//上一页
					if(index <=1){
						return false;
					}
					newIndex = index-1;
					href = href+newIndex;
					//翻页
//					updateIndex(_self, newIndex);
					//点击
					updatePage(_self,newIndex,setting.pager.pageCount);
				}else if(date == "»"){
					var count = setting.pager.pageCount;
					newIndex = parseInt(index)+1;
					//当是最后一页面的情况
					if(index == count){
						return false;
					}
					href = href+newIndex;
					//翻页
					//点击
					updatePage(_self,newIndex,setting.pager.pageCount);
				}else{
					//更新页面
					newIndex = getHrefIndex(href);
					//当我们的标签点击多次的问题
					if(newIndex == index){
						return false;
					}
				}
				//更新索引
				updateIndex(_self, newIndex);
				setting.conf.url = href;
				//更新索引
				//加载我们的数据
				$(setting.datagrid).datagrid("load",setting.conf,setting.selector);
				
				//获取分页对象
				return false;
			});
		}
		
		/**
		 * 传入给的href 来获取我们的index数据
		 * 这个方法中，我们的href书写的规则是，必须让pageNow=xx放在最后，不然没法玩
		 * @pram href 
		 * @retrun index  页数
		 */
		function getHrefIndex(href){
			return href.substring(href.indexOf("pageNow=")+8);
		}
		/**
		 * 更新页面信息,在左边显示数据的地方
		 */
		function updateIndex(_self,pageNow){
			_self.find(".table_pager_info input").val(pageNow);
		}
		
		/**
		 * 更新右边分页的信息
		 * 如果点击到了最右边的，我们就直接将最右边的跳到中间 
		 * 12345 点击了5 我们才会翻页
		 * 34567
		 * 
		 * 如果点击了 3
		 * 34567
		 * 就编程12345
		 */
		function updatePage(_self,pageNow,pageCount){
			//当页面小于5 的情况，不用考虑
			if(pageCount<5){
				return false;
			}
			//table_pagination
			//获取请求的url地址
			var urls = _self.find(".table_pagination li a");
			var date = $(urls[1]).attr("href");
			date = date.substring(0,date.indexOf("pageNow=")+8);
			//获取我们显示的page的最后一页
			var lastIndex = $(urls[urls.length-2]).attr("href");
			lastIndex =getHrefIndex(lastIndex);
			//console.log(pageCount);
			//第一页
			var firstIndex = $(urls[1]).attr("href");
			firstIndex =getHrefIndex(firstIndex);
			//将字符创转化为 number类型的数据
			pageNow = parseInt(pageNow);
			//向下一页翻页
			var pages  = null;
			if(pageNow >= lastIndex){
				//当页面为 每页多一个的情况
				if(pageCount == pageNow){
					pages = [pageNow-4,pageNow-3,pageNow-2,pageNow-1,pageNow];
				}else if(pageCount <pageNow+2){
					pages = [pageNow-3,pageNow-2,pageNow-1,pageNow,pageNow+1];
				}else{
					pages = [pageNow-2,pageNow-1,pageNow,pageNow+1,pageNow+2];
				}
			}
			//上一页
			if(pageNow <= firstIndex){
				//当页面为 每页多一个的情况
				if(pageNow <=3){
					pages = [1,2,3,4,5];
				}else{
					pages = [pageNow-2,pageNow-1,pageNow,pageNow+1,pageNow+2];
				}
			}
			if(pages != null){
				for(var i =1;i<6;i++){
					//设定分页
					$(urls[i]).html(pages[i-1]).attr("href",date+pages[i-1]);
				}
			}
		}
		
		/**
		 * 格式化我们的pager数据
		 * @param pager 分页数据
		 * @param pageList 分页大小数组
		 * @param pageCount 当前所在页面
		 * @return String 返回的是渲染好的数据
		 */
		function formatePager(pager,pageList,pageCount){
			var url = setting.conf.url;
			var pageStr = '<div class="table_pager">'+
							'<div class="table_pager_info">当前页面'+
			'<a href="'+url+'?pageNow='+'" class="btn btn-sm btn-default btn-prev">«</a>'+
			'<input type="hidden" value="'+pager.pageNow+'" maxlength="5" class="form-control input-mini input-inline input-sm text-center input_small_pager"/>'+
			'<input type="text" value="'+pager.pageNow+'" maxlength="5" class="form-control input-mini input-inline input-sm text-center input_small_pager"/>'+
			'<a href="'+url+'?pageNow='+'" class="btn btn-sm btn-default btn-next">»</a>'+
			'<span>共<i class="table_pager_info_pagecount">'+pager.pageCount+'</i>页 | 每页显示</span>';
			pageStr+=formateSelect(pageList);
			pageStr+='<span>记录 | 共有<i class="table_pager_info_rowcount">'+(pager.rowCount)+'</i>条记录</span>	</div>';
			pageStr+=formatePagination(pageCount);
			pageStr+="</div>";
			return pageStr;
		}
		
		/**
		 * 渲染select
		 * @param pageList 数据
		 * @return select 渲染的html数据 str
		 */
		function formateSelect(pageList){
			var selectStr = '<select name="pageSize" class=" form-control input_small input_small_pagers  text-center ">';
			$.each(pageList,function(key,val){
				selectStr+="<option value='"+val+"'>"+val+"</option>";
			});
			return selectStr+"</select>";
		}
		/**
		 * 根据给定的数据来生成分页
		 * @param pageCount 页面的数量
		 * @param url 来设定请求的路径
		 * @return pStr  渲染好的html分页显示
		 */
		function formatePagination(pageCount,hasNode){
			var pStr = '<div class="table_pagination pull-right"><ul class="pagination pagination-sm man">';
			if(hasNode != null && !hasNode){
				pStr = '<ul class="pagination pagination-sm man">';
			}
			var url = setting.conf.url;
			//当点击了我们的数据，然后更新的情况
			if(url.indexOf("pageNow=")!= -1){
//				console.log("xx");
				url = url.substring(0,url.indexOf("pageNow=")-1);
			}
			
			var isPageSize = false;
			if(url.indexOf("pageSize=")!=-1){
				isPageSize = true;
			}
			//解决页数超过我们的需求
			var count = pageCount;
			if(pageCount >5){
				count  = 5;
			}
			//console.log(url);
			if(isPageSize){
				pStr +='<li><a href="'+url+'&pageNow='+'">«</a></li>';
				//默认情况
				for(var i=1;i<=count;i++){
					pStr +='<li><a href="'+url+'&pageNow='+i+'">'+i+'</a></li>';
				}
				pStr =pStr +'<li><a href="'+url+'&pageNow='+'">»</a></li></ul>';
			}else{
				pStr +='<li><a href="'+setting.conf.url+'?pageNow='+'">«</a></li>';
				//默认情况
				for(var i=1;i<=count;i++){
					pStr +='<li><a href="'+setting.conf.url+'?pageNow='+i+'">'+i+'</a></li>';
				}
				pStr =pStr +'<li><a href="'+setting.conf.url+'?pageNow='+'">»</a></li></ul>';
			}
			if(hasNode != null && !hasNode){
				return pStr;
			}
			pStr +="</div>";
			return pStr;
		}
	}
	
	//顶部导航栏目的封装
	$.fn.navTop = function(options){
		var setting = $.extend({
			//标题名称
			//tips 是否是左边小图标,默认false
			//select 选中，默认false
			//{href:'',title:'我的信息',tips:false}
			//names:["首页","大数据","前端开发","后端开发","云计算","虚拟化"],
			names:[{href:'#',title:'首页',select:true},
				{href:'#',title:'前端开发'},
				{href:'#',title:'后端开发'},
				{href:'#',title:'云计算'},
				{href:'#',title:'大数据'},
				{href:'#',title:'虚拟化'},
				{href:'#',title:'登录',tips:true},
				{href:'#',title:'站长',tips:true}],
			//网站的logo
			logo:"url",
			//中文名称
			cname:"",
			//英文名称
			ename:""
		},options||{});
		var _self = this ; 
		
//		console.log(_self);
		//获取数据
		var str = formateHtml();
		//添加str
		_self.append(str);
		//开始导航栏目
		nav();
		
//		console.log(str);
		
		/**
		 * 格式化html
		 */
		function formateHtml(){
			var str = formateWarp(setting.names);
			str+=formateNavLeft(setting.logo,setting.cname,setting.ename);
			return str;			
		}
		
		
		/**
		 * 格式化wrap数据， 
		 * @params names这个是传递过来的名称
		 */
		function formateWarp(names){
			var str = '<div class="head_content"><div class="head-warp"><div class="head"><div class="nav-box"><ul>'
			$.each(names,function(key,val){
				//console.log(val.href+":"+val.title);
				if(!val.tips){
					if(val.select){
						str +='<li class="cur"><a href="'+val.href+'">'+val.title+'</a></li>';
					}else{
						str +='<li><a href="'+val.href+'">'+val.title+'</a></li>';
					}
				}else{
					str +='<li class="last"><a href="'+val.href+'" target="_blank">'+val.title+' </a></li>';
				}
					});
			str += '</ul><div class="nav-line"></div></div></div></div>';
			
			return str;
		}
		
		/**
		 * 搞左边的显示效果
		 * logo 图标
		 * cname 中文明
		 * ename 外文名称
		 */
		function formateNavLeft(logo,cname,ename){
			var str = '<div class="logo"><div  class="content"><div class="font_logo">'+
			'<img   src="'+logo+'"/>';
			if(ename == ""){
				str +='<div class="no_ename"><span class="cn_name">'+cname+'</span>'+
				'<div class="en_name">'+ename+'</div></div></div></div>';
			}else{
			str +='<div class="name"><span class="cn_name">'+cname+'</span>'+
			'<div class="en_name">'+ename+'</div></div></div></div></div>';
			}
			return str;
		}
		
		
		
		// nav导航栏目的js
		function nav(){
			var $liCur = $(".nav-box ul li.cur"),
				curP = $liCur.position().left,
				curW = $liCur.outerWidth(true),
				$slider = $(".nav-line"),
				$targetEle = $(".nav-box ul li:not('.last') a"),
				$navBox = $(".nav-box");
			//console.log(curW);
			$slider.stop(true,true).animate({"left":curP,"width":curW});
			//这个mouseenter 事件同我们的 hover事件类是
			$targetEle.mouseenter(function(){
				//console.log("xx");
				//cursor:pointer;
				//$(this).css("cursor","pointer");
				var $_parent = $(this).parent(),
					_width = $_parent.outerWidth(true), 
					posL = $_parent.position().left;
				$slider.stop(true,true).animate({"left":posL,"width":_width},"fast");
			});
			$navBox.mouseleave(function(cur,wid){
				cur = curP;
				wid = curW;
				$slider.stop(true,true).animate({"left":cur,"width":wid},"fast");
			});
		};
		
		
		//nav的js方法的备份
		function nav2(){
			var $liCur = $(".nav-box ul li.cur"),
				curP = $liCur.position().left,
				curW = $liCur.outerWidth(true),
				$slider = $(".nav-line"),
				$targetEle = $(".nav-box ul li:not('.last') a"),
				$navBox = $(".nav-box");
			//console.log(curW);
			$slider.stop(true,true).animate({"left":curP,"width":curW});
			//这个mouseenter 事件同我们的 hover事件类是
			$targetEle.mouseenter(function(){
				console.log("xx");
				var $_parent = $(this).parent(),
					_width = $_parent.outerWidth(true), 
					posL = $_parent.position().left;
				$slider.stop(true,true).animate({"left":posL,"width":_width},"fast");
			});
			$navBox.mouseleave(function(cur,wid){
				cur = curP;
				wid = curW;
				$slider.stop(true,true).animate({"left":cur,"width":wid},"fast");
			});
		};
	}
	
	
	
	/*
	 * 做一个和我们的easy ui 类似的dategrid
	 * $('#dg').datagrid({    
	    url:'datagrid_data.json',    
	    columns:[[    
	        {field:'code',title:'Code',width:100},    
	        {field:'name',title:'Name',width:100},    
	        {field:'price',title:'Price',width:100,align:'right'}    
	    ]]    
	}); 

	需要结合我们自定义的样式和Bootstrap 才可以完成,并非完全离不开
	必要字段
	url
	columns
	 */
	$.fn.datagrid= function(options,param,selector){
		//设定参数
		var setting = $.extend({
			//定义 json 数据的url
			url:"",
			//提交的方式
			//设定默认为get方法
			method:"get",
			//定义字段表格中的数据
			//最少字段,这样我们的 title 默认为field字段
			//{field:'xx'}
			
			//建议字段
			//{field:'username',title:'用户名'}
			
			//全部字段
			//{field:'unitcost',title:'Unit Cost',checkbox:false,hidden:false,width:100,align:'center',formatter:function(val,row,index){},styler:function(val,row,index){}}
			/**
			 * formatter: function(value,row,index){
					if(row.majorClass){
						return row.majorClass.name;
					}else{
						return "未添加班级";
					}
				},
				styler:function(value,row,index){
					//这个地方获取的是原先的数据
					if (!row.majorClass){
						return 'color:red;';
					}
				}
			 */
			columns:[],
			//id 设定id是否显示
			rownumbers:true,  //默认显示
			//id的字段号,便于点击和删除事件操作对象
			idField : "id", //默认字段号为id
			//是否分页
			pagination:true,
			//工具栏
			toolbar:[] ,
			//是否自动适应表格
			fit:true,
		},options||{});
		//设定方法
		
		//先判断
		if(typeof options === "string"){
			if(options == "load"){
				//传递数据到调用
				var _self = selector;
				load(param,_self);
			}
		}
		/**
		 * 加载我们的数据
		 */
		function load(param,_self){
			setting = param;
			var date = sendAjax(setting.url);
			var rows = date.data;
			//设定类容
			var bodyStr = makeBodyRows(rows,false);
			_self.find("tbody").html(bodyStr);
			//设定角标
			//获取页数
			var pageNow = date.pageNow;
			var pageSize = date.pageSize;
			var start = (pageNow-1)*pageSize+1;
			formateIndex(start,false);
			
			//格式化表格
			formatTable();
			//获取操作的对象
		//	console.log(bodyStr);
			//创建表格数据
		//	formateIndex(0);
		}
		//获取数据
		/**
		 * 通过发送ajax来获取到我们传递的数据
		 * @return 返回请求回来的数据，我们可以判断反回的数据
		 */
		function sendAjax(href){
			var date = null;
			$.ajax({
				url : href,
				type:setting.method,
				//data : upateObj,
				dataType : 'json',
				//设定同步请求操作
				async: false,
				success : function(r) {
					//获取到我们的json 数据
					//console.log(r);
					date =r;
				}
			});
			return date;
		}
		//当是我们调用里面的方法的时候，不创建表格
		if(typeof options != "string"){
			createTable(this);
		}
		//创建表头
		/**
		 * 创建表单
		 * @param _self 对象自己本身
		 */
		function createTable(_self){
			//设定第一页为默认的10,刷新的时候，就会发送参数10
			var date = sendAjax(setting.url+"?pageSize=10");
//			var headRow = setting.columns;
			//传递过来的数据是  pager 对象
			//{"pageSize":10,"pageNow":1,"pageCount":2,"rowCount":"data"[{}...]}
			var rows = date.data;
			var tableStr = '<table class="bootstrap_style_table">'+makeHeadRow()+makeBodyRows(rows)+"</table>";
			//创建表格数据
			_self.append(tableStr);	
			//添加我们的分页
			formatePagination(_self,date);
			//格式化表格
			formatTable();
			//格式化checkbox 
			formatCheckBox();
			//格式化我们的角标
			formateIndex(1);
		}
		
		/**
		 * 设定我们的分页操作
		 */
		function formatePagination(_self,date){
			//当时分也的情况
			if(setting.pagination){
				_self.append("<div id='yellowcong_pager'></div>");
				//创建分页，我们还需要传递过来的date
				$("#yellowcong_pager").pagination({pager:date,conf:setting,selector:_self});
			}
		}
		/**
		 * 耦合性比较低的方法，是单独出来的一种方法， 其他 的方法也是可以的但是我喜欢这个,单独的方法消耗的内存和资源多
		 * @param start column的开始设定的数据 默认设定为0
		 */
		function formateIndex(start,hasthead){
			if(setting.rownumbers){
				var thead = $(".bootstrap_style_table thead");
				var tbody = $(".bootstrap_style_table tbody");
				var date = thead.find("th:first");
				//当存在 checkbox的情况
				if(date.html()!= null && date.html().indexOf("checkbox")>0){
					//
					if(hasthead== null || hasthead){
						date.after("<th width='50px'>编号</th>");
					}
					var rows = tbody.find("tr");
					//在第一个的后面添加我们的编号
					$.each(rows,function(key,val){
						$(this).find("td:first").after("<td>"+(start++)+"</td>");
					});
				}else{
					//当没有checkbox的情况,直接在第一行的前面添加我们的数据就可以了
					if(hasthead== null || hasthead){
						date.before("<th  width='50px'>编号</th>");
					}
					var rows = tbody.find("tr");
					$.each(rows,function(key,val){
						$(this).find("td:first").before("<td>"+(start++)+"</td>");
					});
				}
			}
		}
		/**
		 * 格式化我们的style 包括里面的方法，将每个字段，都设定他的样式
		 * @param rows 格式化里面的数据,
		 * @return [{field:style,},{},{}]
		 */
		function formateDate(rows){
			var formatterFun =getFormatterFun();
//			console.log(formatterFun);
			var obj = new Array();
			$.each(rows,function(index,row){
				//调用方法来进行数据的设定
				$.each(formatterFun,function(field,fun){
					row[field] = fun(row[field],row,index);
				});
				obj[index] = row;
//				console.log(row);
			});
			return rows;
		}
		
		
		
		/**
		 * 格式化我们的style 包括里面的方法，将每个字段，都设定他的样式
		 * @param rows 我们传递经来数据的
		 * @return [{field:style,},{},{}]
		 */
		function formateStyle(rows){
			//将反悔 styelFun{xx:fun}  字段和方法的对象
 			var styleFun = getStyleFun();
			//console.log(styleFun["major"]);
			//用于存每一个的数据
			var obj = new Array();
			$.each(rows,function(index,row){
				var rowNode = tdNodes(setting.columns);
				$.each(styleFun,function(field,fun){
					var result = fun(row[field],row,index);
					if(result){
						var str = rowNode[field];
						//当什么修饰都没有的情况
						if(str.indexOf("style")>0){
							str = str.replace(";'>",";"+result+"'>");
						}else{
							str = str.substring(0,str.length-1) +" style='"+result+"'>";
						}
						rowNode[field] = str;
					}
				});
				obj[index] = rowNode;
			});
			return obj;
		}
		
		/**
		 * 获取样式中的数据显示效果 style函数
		 * @return ｛field:函数，field:函数｝
		 */
		function getStyleFun(){
			var date = setting.columns;
			var styleFun = {};
			$.each(date,function(key,row){
				//去掉hidden的
				if(row.styler && !row.hidden){
					styleFun[row.field] = row.styler;
				}
			});
			return styleFun;
		}
		//
		/**获取样式中的数据格式化 formatter函数
		 * @return ｛field:函数，field:函数｝
		 */
		function getFormatterFun(){
			var date = setting.columns;
			var formatterFun = {};
			$.each(date,function(key,row){
				if(row.formatter){
					formatterFun[row.field] = row.formatter;
				}
			});
			return formatterFun;
		}
		/**
		 * 格式化我们的checkbox 让他有全选和全部不选的功能
		 */
		function formatCheckBox(){

			//当表头中存在checkbox的时候，我们设定宽度
			var checkboxs = $(".bootstrap_style_table thead tr th:first").find("input:checkbox");
			if(checkboxs.length){
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
		}
		
		/**
		 * 格式化输出表格对象
		 */
		function formatTable(){
			if(setting.fit){
				$(".bootstrap_style_table").css("width","100%");
			}
			
			//设定偶数行的显示效果
			$(".bootstrap_style_table tbody tr:even").css("background","#F9F9F9");
			$(".bootstrap_style_table tbody tr:odd").css("background","#FFF");
			
			//设定hover的数据显示效果
			$(".bootstrap_style_table tbody tr").hover(function(){
				$(this).css("background","#EEE");
			},function(){
				//$(this).css("background",default_color);
				$(this).css("background","none");
				$(".bootstrap_style_table tbody tr:even").css("background","#F9F9F9");
				$(".bootstrap_style_table tbody tr:odd").css("background","#FFF");
			});
		}
		
		//添加一个创建表头的方法
		/**
		 * @param headRow 是setting.column 中的配置
		 * @return 返回表头的 html
		 */
		function makeHeadRow(){
			var column = setting.columns;
			var headRowStr = "<thead><tr>"
				$.each(column,function(key,row){
					//console.log(row);
					//然后遍历 row里面的数据
					//var field = row.field;
					if(!row.hidden){
						//判断是否是选择
						var title = row.title;
						//当时复选框的情况
						
						//checkbox的宽度不需要设定
						if(row.checkbox){
							//当时我们的
							//获取表头的数据的数据
							//对于checkbox 我们可以添加操作的方法
							title ='<input type="checkbox"  />';
						}
						//设定宽度
						var rowStart = "<th"
						if(row.width){
							rowStart = rowStart+" width='"+row.width+"px'";
						}
						rowStart = rowStart +">";
						headRowStr = headRowStr+rowStart+title+"</th>";
						
					}
				});
			headRowStr = headRowStr+"</tr></tbody>";
			return headRowStr;	
		}
		
		
		/**
		 * 判断数据是否是一个checkbox 
		 * xx_checkbox 的字段
		 * @parent field 的字段
		 * @return 返回是否是复选框
		 */
		function isCheck(field){
			var result = field.split("_");
			if("checkbox" == result[result.length-1]){
				return true;
			}	
			return false;
		}
		/**
		 * 判断数据是否是一个checkbox 
		 * td 的头，我们需要格式化操作
		 * @parent row 的字段   setting.column(rows) 中的每一个 对象数据(row)
		 * @return 返回是否是复选框
		 */
		function formatNode(row){
			
			var rowStart = "<td"
			//宽度
			if(row.width){
				rowStart = rowStart+" width='"+row.width+"px'";
			}
			//设定偏向
			if(row.align){
				//console.log(row.align);
				//align="left"
				rowStart = rowStart+" style='text-align:"+row.align+";'";
			}
			
			rowStart = rowStart +">";
			return rowStart;
		}
		
		/**
		 * td 标签的信息  setting.column
		 * 格式化输出我们的td的表头数据
		 * @param setting.column
		 * @return 返回｛field:tdNodeStr,field:tdNodeStr,｝
		 * 
		 *Object { id: "<td>", user_code: "<td width='150px' style='text-align…", username: "<td style='text-align:right;' >", createDate: "<td>", major: "<td>", class: "<td>" }
		 */
		function tdNodes(column){
			var obj = {} ;
			$.each(column,function(key,row){
				//去掉row中 hidden的字段
				if(!row.hidden){
					//判断是否是选择
					var tdStartStr = "<td>"
					//当是checkbox的情况
					if(!row.checkbox){
						//格式化我们的节点
						tdStartStr = formatNode(row);
					}
					obj[row.field] =tdStartStr; 
				}
			});
			return obj;
		}
		/**
		 * 生成一个数组，然后 可以在这个里面设定那些需要显示，那些不需要显示
		 * @param headRow 是setting.column 中的配置
		 * @return 返回字段的排序
		 */
		function getColumnsOrder(column){
			var rowOrder = new Array();
			$.each(column,function(key,row){
				//去掉hidden的数据
				if(!row["hidden"]){
					var result = row.field;
					if(row["checkbox"]){
						result = result +"_checkbox";
					}
					rowOrder[key]=result;
				}
			});
			return rowOrder;
		}
		
		
		/**
		 * 生成表类容
		 * {"pageSize":10,"pageNow":5,"pageCount":10,"rowCount":92,"data":[{"id":41,"username":"yellowcong48","nickname":"你是都比吗48","password":"3410ebb1ecde3a0208eecd869615ca14","createDate":1451382827000,"imgUrl":null,"email":"71735038948@qq.com","phone":"15335762948","isActive":0},{"id":42,"username":"yellowcong49","nickname":"你是都比吗49","password":"3410ebb1ecde3a0208eecd869615ca14","createDate":1451382827000,"imgUrl":null,"email":"71735038949@qq.com","phone":"15335762949","isActive":0},{"id":43,"username":"yellowcong50","nickname":"你是都比吗50","password":"3410ebb1ecde3a0208eecd869615ca14","createDate":1451382827000,"imgUrl":null,"email":"71735038950@qq.com","phone":"15335762950","isActive":0},{"id":44,"username":"yellowcong51","nickname":"你是都比吗51","password":"3410ebb1ecde3a0208eecd869615ca14","createDate":1451382827000,"imgUrl":null,"email":"71735038951@qq.com","phone":"15335762951","isActive":0},{"id":45,"username":"yellowcong52","nickname":"你是都比吗52","password":"3410ebb1ecde3a0208eecd869615ca14","createDate":1451382827000,"imgUrl":null,"email":"71735038952@qq.com","phone":"15335762952","isActive":0},{"id":46,"username":"yellowcong53","nickname":"你是都比吗53","password":"3410ebb1ecde3a0208eecd869615ca14","createDate":1451382827000,"imgUrl":null,"email":"71735038953@qq.com","phone":"15335762953","isActive":0},{"id":47,"username":"yellowcong54","nickname":"你是都比吗54","password":"3410ebb1ecde3a0208eecd869615ca14","createDate":1451382827000,"imgUrl":null,"email":"71735038954@qq.com","phone":"15335762954","isActive":0},{"id":48,"username":"yellowcong55","nickname":"你是都比吗55","password":"3410ebb1ecde3a0208eecd869615ca14","createDate":1451382827000,"imgUrl":null,"email":"71735038955@qq.com","phone":"15335762955","isActive":0},{"id":49,"username":"yellowcong56","nickname":"你是都比吗56","password":"3410ebb1ecde3a0208eecd869615ca14","createDate":1451382827000,"imgUrl":null,"email":"71735038956@qq.com","phone":"15335762956","isActive":0},{"id":50,"username":"yellowcong57","nickname":"你是都比吗57","password":"3410ebb1ecde3a0208eecd869615ca14","createDate":1451382827000,"imgUrl":null,"email":"71735038957@qq.com","phone":"15335762957","isActive":0}]}
		 * @param rows 是ajax请求放回的数据中 的 data数据集合
		 * @patam hasNode 是否包含标签
		 * @return 返回表类容tbody的html数据
		 */
		function makeBodyRows(rows,hasNode){
			//获取排序字段
			var rowOrder = getColumnsOrder(setting.columns);
			//格式化我们的rows的数据
			rows =  formateDate(rows);
			//获取开始的node节点 属性
			var nodes =  formateStyle(rows);
//			console.log(nodes);
			//获取表格排序
			//console.log(rowOrder);
			//获取所有的行
			var rowsStr ="";
			if(hasNode == null || hasNode){
				rowsStr +="<tbody>";
			}
			$.each(rows,function(index,row){
				//console.log(row);
				//这个地方需要解决 有些字段并是按照 columns 中设定
				var rowStr = "<tr>";
				$.each(rowOrder,function(key,field){
					//去掉 field为空的情况
					if(!field==null|| !field==""){
						//checkbox
						var cellStr = row[field];
						if(isCheck(field)){
							field = field.replace("_checkbox","");
							cellStr ='<input type="checkbox" name="select" value="'+ row[setting.idField]+'"/>';
						}
						//设定我们的开始显示效果 通过function
						rowStr = rowStr+nodes[index][field]+cellStr+"</td>";
					}
/*					//console.log(index);
					//当设定排序的情况下
					if(setting.rownumbers){
						if(key ==0){
							rowStr = rowStr+"<td>"+(index+1)+"</td>";
						}
					}
*/				});
				rowStr = rowStr+"</tr>";
				rowsStr = rowsStr +  rowStr;
			});
			//当含有标签
			if(hasNode == null || hasNode){
				rowsStr = rowsStr+"</tbody>"
			}
			return rowsStr;
		}
	}
})(jQuery)