/*2016-1-13 编写yellowcong 博客网站的js代码
 * 这个里面将封装方法，不会像以前一样，直接写一堆的js
 * */
//写插件
(function($){
	//定义方法
	$.fn.hideInfo = function(options){
		//设定参数
		var setting = $.extend({
			//定义隐藏的元素
			hideElement:".news_ticker",
			//隐藏速度,设定默认为1s钟
			speed:1000
		},options||{});
		//设定方法
		this.click(function(){
			$(setting.hideElement).fadeOut(setting.speed);
			//设定我们的 iframe的高度 和宽度 
			var iframe_height = document.documentElement.clientHeight - 100;
			$(".content_bodys").css("height",iframe_height);
		});
	}
	
	/**
	 * 设定显示Nav的信息，这个设定为二级菜单
	 */
	/*
	$.fn.showNav = function(options){
		//设定参数
		var setting = $.extend({
			//一级菜单
			mainNav:".nav_list_navs a",
			//二级菜单
			subNav:".sub_navs",
			//选中的样式
			navSelectClass:"navs_select",
			//激活的样式
			navActiveClass:"navs_select_active",
			//子菜单的样式
			subClass:"sub_navs",
			//通过给一个一级导航栏目的  名称，来移去样式
			//用户
			setColor:function setColorByName(name){
				$.each($(setting.mainNav),function(key,val){
					var title = $(this).children("span:first").html();
					if(title == name){
						//$(this).css("background","#33485C");
						$(this).removeClass(setting.navActive);
						return false;
					}
				})	
			}
		},options||{});
		//设定点击数据
		var isOpen = false;
		var lastClick = null;
		//设定a标签的点击事件
		$(setting.mainNav).hover(function(){
			var is_sub = $(this).parent().parent("ul").hasClass(setting.subClass);
			if(is_sub){
				$(this).css("color","#E74C3C");
			}else{
				$(this).addClass(setting.navSelectClass);
			}
		},function(){
			var is_sub = $(this).parent().parent("ul").hasClass(setting.subClass);
			if(is_sub){
				$(this).css("color","#fff");
			}else{
				//当没有打开的情况下，才会变色
				$(this).removeClass(setting.navSelectClass);
			}
		}); 
		
		//slideToggle 这个可以自己定义一个
		//隐藏的栏目
		$(".sub_navs").hide();
		//设定点击事件
		this.on("click",function(){
			
			//判断是否是子nav_bar
			var is_sub = $(this).parent().parent("ul").hasClass(setting.subClass);
			
			if(!is_sub){

				isOpen = !isOpen;
				//设定颜色
				$(this).addClass(setting.navActiveClass);
				//sub_navs
				//点击的数据
				//当点击的不是一个对象的情况
				if(lastClick != $(this).children("span").html()){
					if(lastClick != null){
						$(".sub_navs").slideUp();
						$(".drop-icon").removeClass("nav_show_select");
						//$(this).css("background","#33485C");
						//获取到上一个对象
						//console.log(lastClick);
						//setColorByName(lastClick);
						setting.setColor(lastClick);
					}
					lastClick = $(this).children("span").html()
				}
				
				$(this).css("border-bottom","1px solid #374D63");
				//: ;
				$(this).siblings(setting.subNav).slideToggle();
				$(this).children(".drop-icon").toggleClass("nav_show_select");	
			}else{
				//如果是子类的操作办法			
			}
			//取消默认点击事件
			return false;
		});
	}
	
*/	
	/**
	 * 写一个关于浏览器高度的插件，然后根据给的node节点来判断高度
	 */
	$.fn.rsetIframe = function(options){
		//写插件的时候，这个setting 必须写
		var setting = $.extend({
			//需要过滤掉的高度
			nodeId:"#news-ticker-close:visible",
			//iframe包含的 类
			iframeClass:".content_bodys",
			width:250,
			height:100
		},options||{});
		//通过iframe 实现布局嵌套问题，不然太多的js写得蛋疼
		var nums = $(setting.nodeId).length;
		//这个document height 不对
		//当有 info的高度是 130
		//没有info 减去的高度是 100
		//浏览器可见部分高度
		var iframe_height = document.documentElement.clientHeight - setting.height;
		//console.log($(setting.iframeClass).find("input:[name=docHeight]").val());
		//父类窗口调用子类iframe数据
		//console.log($(setting.iframeClass));
		//文档高度
		//console.log($(document).height());
		
		//获取
		var iframe_width = $(document).width() - setting.width;
		
		//当存在我们的消息提示的情况，我们的iframe应该变小一些
		if(nums){
			iframe_height = iframe_height-30;
		} 
		//前台就可以做成跳转的样式
		$(setting.iframeClass).css({"width":iframe_width,"height":iframe_height});
	}
})(jQuery)