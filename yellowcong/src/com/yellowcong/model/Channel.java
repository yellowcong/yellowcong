package com.yellowcong.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 栏目
 * @author yellowcong
 * @date 2016年1月23日
 *
 */
@Entity
@Table(name="ycg_channel")
public class Channel {
	private int id;
	/**
	 * 栏目名称
	 */
	private String name;
	/**
	 * 栏目是否激活
	 * 0 表示未激活
	 * 1 表示激活
	 */
	private String isActive;
	/**
	 * 是否可以添加回复  
	 * 1 表示可以回复
	 * 0 表示不可以回复
	 */
	private String canReply;
	/**
	 * 备注
	 */
	private String blank;
	/**
	 * 创建的日期
	 */
	private Date createDate;
	/**
	 * 创建的人
	 */
	private User user;
	/**
	 * 顺序
	 */
	private int orders;
	/**
	 * 栏目的类型，有的是文章，有的是问卷 ，有的是相册等等
	 */
	private int type;
	/**
	 * 栏目是否是登录查看
	 * 1 表示 登录才可以看到
	 * 0 表示不用登录就可以看到
	 */
	private int isloginSee;
	/**
	 * 一个栏目中，可以有多个子栏目
	 */
	private Channel channel;
	
	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Column(length=16)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Column(name="is_active",length=1)
	public String getIsActive() {
		return isActive;
	}
	public void setIsActive(String isActive) {
		this.isActive = isActive;
	}
	@Column(name="can_reply",length=1)
	public String getCanReply() {
		return canReply;
	}
	public void setCanReply(String canReply) {
		this.canReply = canReply;
	}
	@Column(length=128)
	public String getBlank() {
		return blank;
	}
	public void setBlank(String blank) {
		this.blank = blank;
	}
	@Column(name="create_date")
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	@ManyToOne
	@JoinColumn(name="user_id")
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	@Column(length=3)
	public int getOrders() {
		return orders;
	}
	public void setOrders(int orders) {
		this.orders = orders;
	}
	
	@Column(length=3)
	public int getType() {
		return type;
	}
	
	public void setType(int type) {
		this.type = type;
	}
	
	@Column(name="is_login_seee",length=1)
	public int getIsloginSee() {
		return isloginSee;
	}
	public void setIsloginSee(int isloginSee) {
		this.isloginSee = isloginSee;
	}
	
	@ManyToOne
	@JoinColumn(name="channel_id")
	public Channel getChannel() {
		return channel;
	}
	public void setChannel(Channel channel) {
		this.channel = channel;
	}
}
