package com.yellowcong.service;

import com.yellowcong.model.Pager;
import com.yellowcong.model.User;

public interface UserService {
	
	
	/**
	 * 添加对象
	 * @param user
	 * @return
	 */
	public User add(User user);
	/**
	 * 通过id来删除数据
	 * @param id
	 */
	public void delete(int id);
	
	/**
	 * 更新数据
	 * @param user
	 */
	public void update(User user);
	/**
	 * 通过id获取对象
	 * @param id
	 * @return
	 */
	public User loadById(int id);
	/**
	 * 通过用户的别名来获取用户
	 * @param name 用户的别名 nickname
	 * @return
	 */
	public User loadByName(String name);
	/**
	 * 通过邮箱号获取用户
	 * @param email
	 * @return
	 */
	public User loadByEmail(String email);
	/**
	 * 通过手机号来获取用户
	 * @param phone
	 * @return
	 */
	public User loadByPhone(String phone);
	/**
	 * 
	 * @param key 可以是email  phone 
	 * @param password
	 * @return
	 */
	public User login(String key,String password);
	
	/**
	 * 分页的方式来显示数据
	 * @return
	 */
	public Pager<User> listByPager();
	
}	
