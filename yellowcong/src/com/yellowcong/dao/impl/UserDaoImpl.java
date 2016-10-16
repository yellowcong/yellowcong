package com.yellowcong.dao.impl;

import org.springframework.stereotype.Repository;

import com.yellowcong.dao.UserDao;
import com.yellowcong.model.User;

@Repository("userDao")
public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao{

	@Override
	public User loadByEmail(String email) {
		return (User) super.getSession().createQuery("select new User(id) from User where email = ?").setParameter(1, email).uniqueResult();
	}

}	
