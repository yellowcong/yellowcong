package com.yellowcong.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 态度，用于显示对与文章和数据的态度
 * @author yellowcong
 * @date 2016年1月23日
 *
 */
@Entity
@Table(name="ycg_attitude")
public class Attitude {
	private int id;
	/**
	 * 是likes 就是1
	 * 否则显示 0
	 */
	private int likes;
	/**
	 * 是dislike 就是1
	 * 否则显示 0
	 */
	private int dislike;
	/**
	 * 对于文章的态度
	 */
	private Passage passage;
	/**
	 * 对于回复的态度
	 */
	private Reply reply;
	/**
	 * 显示态度的用户
	 */
	private User user;
	
	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	
	@Column(length=1)
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	
	@Column(length=1)
	public int getDislike() {
		return dislike;
	}
	public void setDislike(int dislike) {
		this.dislike = dislike;
	}
	
	@ManyToOne
	@JoinColumn(name="user_id")
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
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
	@JoinColumn(name="reply_id")
	public Reply getReply() {
		return reply;
	}
	public void setReply(Reply reply) {
		this.reply = reply;
	}
}

