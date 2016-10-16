package com.yellowcong.service.impl;


import java.util.Date;

import javax.annotation.Resource;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.stereotype.Service;

import com.yellowcong.dao.UserDao;
import com.yellowcong.model.Pager;
import com.yellowcong.model.User;
import com.yellowcong.service.UserService;
import com.yellowcong.utils.StringUtil;

@Service("userService")
public class UserServiceImpl implements UserService{
	private UserDao userDao;
	
	@Resource(name="userDao")
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	@Override
	public User add(User user) {
		user.setCreateDate(new Date());
		user.setPassword(StringUtil.md5(user.getPassword()));
		user.setIsActive(0);
		return userDao.add(user);
	}

	@Override
	public void delete(int id) {
		userDao.delete(id);
	}

	@Override
	public void update(User user) {
		try {
			User old = this.loadById(user.getId());
			BeanUtils.copyProperties(old, user);
			userDao.update(old);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public User loadById(int id) {
		return userDao.load(id);
	}

	@Override
	public User loadByName(String name) {
		return (User) userDao.executeQuery("select new User(id) from User where nickname = ? ",name);
	}

	@Override
	public User loadByEmail(String email) {
		return (User) userDao.executeQuery("select new User(id) from User where email = ?",email);
	}

	@Override
	public User loadByPhone(String phone) {
		return (User) userDao.executeQuery("select new User(id) from User where phone = ?",phone);
	}

	
	//登录的时候只可以是 手机号 和我们的 email登录
	@Override
	public User login(String key, String password) {
		return (User) userDao.executeQuery("from User where (phone = ? or email = ? ) and password = ?",new String []{key,key,StringUtil.md5(password)});
	}

	@Override
	public Pager<User> listByPager() {
		return this.userDao.queryByPager("from User");
	}
}
