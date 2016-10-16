package com.yellowcong.dao;

import com.yellowcong.model.User;


public interface UserDao extends BaseDao<User> {
	/**
	 * 通过邮箱判断用户是否存在
	 * @param email
	 * @return
	 */
	public User loadByEmail(String email);
}
