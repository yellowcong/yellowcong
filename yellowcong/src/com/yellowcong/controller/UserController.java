package com.yellowcong.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yellowcong.model.Pager;
import com.yellowcong.model.User;
import com.yellowcong.service.UserService;


@Controller
@RequestMapping("/user")
public class UserController extends BaseController<User>{
	
	private UserService userService;
	
	@Resource(name="userService")
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	/**
	 * 用户登录界面
	 * @return
	 */
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String login(){
		return "user/login";
	}
	
	/**
	 * 条状到用户首页
	 * @return
	 */
	@RequestMapping(value="/index",method=RequestMethod.GET)
	public String index(){
		return "user/index";
	}
	
	/**
	 * 用户注册的界面
	 */
	@RequestMapping(value="/register",method=RequestMethod.GET)
	public String add(){
		System.out.println("用户添加");
		return "user/add";
	}
	
	/**
	 * 用户登录界面
	 * @return
	 */
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(String key,String password,HttpServletRequest request){
		System.out.println(key+"___"+password);
		User user = this.userService.login(key, password);
		//设定数据到session中
		request.getSession().setAttribute("loginUser", user);
		
		return "redirect:/user/index";
	}
	
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public void list(HttpServletResponse response){
		Pager<User> pager = this.userService.listByPager();
		this.writePagerJson(response, pager);
	}
}	
