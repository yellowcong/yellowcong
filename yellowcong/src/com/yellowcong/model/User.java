package com.yellowcong.model;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import org.hibernate.annotations.Index;
import org.hibernate.validator.constraints.Email;

import com.yellowcong.utils.HFFSAlias;

/**
 * yellowcong 的新网站，以后也会一直建立下去
 *
 * @author yellowcong
 *
 * 
 * QQ
 * 新浪微博借口
 * 微信接口  数据推送
 * github 接口
 * 
 * 
 * 用户登录的 email 
 * 用户登录的手机号
 * 用户的名称
 * 必须是唯一的
 * 
 * 
 * 网名和头像随机生成，如果用户不填写的情况下
 * 
 * 
 * 手机和email登录  
 * 三方登录   
 *    
 */
@Entity
@Table(name="ycg_user")
public class User {
	@HFFSAlias("编号")
	private int id;
	//用户名称
	@HFFSAlias("用户名称")
	private String username;
	//别名
	//别名不能存在邮箱@ 不然会导致问题，我们需要做js验证
	@HFFSAlias("别名")
	private String nickname;
	//密码
//	@HFFSAlias("密码")
	private String password;
	//创建日期
	@HFFSAlias("创建日期")
	private Date createDate;
	//用户头像
	@HFFSAlias("用户头像")
	private String imgUrl;
	//用户的邮箱地址
	@HFFSAlias("邮箱")
	private String email;
	//电话
	@HFFSAlias("电话号")
	private String phone;
	//是否邮箱激活
	// 0 表示未激活 
	// 1 表示激活
	@HFFSAlias("是否激活")
	private int isActive;
	
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	//用于验证用户是否登录
	public User(int id) {
		super();
		this.id = id;
	}


	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Index(name="username")
	@Column(name="username",length=16)
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	//我们不需要设定我们的nickname 为唯一的
	@Index(name="nickname")
	@Column(name="nickname",length=16,unique=false)
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	@Column(length=32)
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	@Column(name="create_date")
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	@Column(name="img_url")
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	
	@Email
	@Column(unique=true,length=64)
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	@Column(name="phone",length=11,unique=true)
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	@Column(name="is_active",length=1)
	public int getIsActive() {
		return isActive;
	}
	public void setIsActive(int isActive) {
		this.isActive = isActive;
	}
	
}
