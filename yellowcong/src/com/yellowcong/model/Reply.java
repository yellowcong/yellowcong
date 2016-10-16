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
 * 文章回复
 * @author yellowcong
 * @date 2015年12月27日
 *
 */
@Entity
@Table(name="ycg_reply")
public class Reply {
	/**
	 * 定义
	 */
	private int id;
	/**
	 * 文章id
	 */
	private Passage passage;
	/**
	 * 用户id
	 */
	private User user;
	/**
	 * 评论的日期
	 */
	private Date createDate;
	/**
	 * 评论内容
	 */
	private String content;
	/**
	 * 回复的对象，对别人回复
	 */
	private Reply reply;
	
	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@ManyToOne
	@JoinColumn(name="passage_id")
	public Passage getPassage() {
		return passage;
	}
	public void setPassage(Passage passage) {
		this.passage = passage;
	}
	
	@ManyToOne
	@JoinColumn(name="user_id")
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	
	@Column(name="create_date")
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	@Column(name="content")
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	@ManyToOne
	@JoinColumn(name="reply_id")
	public Reply getReply() {
		return reply;
	}
	public void setReply(Reply reply) {
		this.reply = reply;
	}
}
