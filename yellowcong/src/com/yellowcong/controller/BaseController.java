package com.yellowcong.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.yellowcong.model.Pager;
import com.yellowcong.utils.JsonUtils;

/**
 * 定义一个基础的Controller来控制数据
 * @author yellowcong
 * @date 2016年1月23日
 *
 */
public class BaseController<T> {

	/**
	 * 写json到客户端的公共方法 ,将数据写到Datagrid中
	 * @param response 
	 * @param obj 可以是对象 也可以List集合  
	 */
	public void writeJson(HttpServletResponse response,Object obj){
		try {
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			String json = "";
			json = JsonUtils.object2Json(obj);
			out.write(json);
			out.flush();
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * 写出Pager 翻页的数据
	 * @param response 
	 * @param obj 可以是对象 也可以List集合
	 */
	public void writePagerJson(HttpServletResponse response,Pager<T> pager){
		try {
			
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			//如果是 数组 就 调用List集合的方法，如果是对象就直接调用对象的方法
			out.write(JsonUtils.object2Json(pager));
			out.flush();
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
