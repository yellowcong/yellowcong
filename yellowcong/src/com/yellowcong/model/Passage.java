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
 * 文章
 * @author yellowcong
 * @date 2015年12月27日
 *
 */
@Entity
@Table(name="blog_passage")
public class Passage {
	/**
	 * 定义文章id
	 */
	private int id;
	/**
	 * 关键字使用  逗号(,) 来进行分割
	 * 我们可以手动输入关键字，也可以通过分析文章，来设定
	 * 我们自己来添加
	 */
	private String keywords;
	/**
	 * 查看次数
	 */
	private int seeCount;
	/**
	 * 类容
	 */
	private String content;
	/**
	 * 发文对象
	 */
	private User user;
	/**
	 * 创建日期
	 */
	private Date createDate;
	/**
	 * 文章的标题
	 */
	private String title;
	/**
	 * 文章的概括,自动生成
	 */
	private String summary;
	/**
	 * 文章缩略的图片
	 * 
	 * 如果没有 添加，就自动从首页的第一张图片设定为我们的缩略图
	 * 如果都没有，就设定为默认的图片
	 * 
	 */
	private String img;
	/**
	 * 是否推荐
	 * 如果推荐， 就是1
	 *        否则 0
	 */
	private int isRecommend;
	
	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getKeywords() {
		return keywords;
	}
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	@Column(name="see_count")
	public int getSeeCount() {
		return seeCount;
	}
	public void setSeeCount(int seeCount) {
		this.seeCount = seeCount;
	}
	@Column(name="content",columnDefinition="text")
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
	
	@Column(name="title",length=128)
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	@Column(name="summary")
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	@Column(name="img",length=128)
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	@Column(name="is_recommend",length=1)
	public int getIsRecommend() {
		return isRecommend;
	}
	public void setIsRecommend(int isRecommend) {
		this.isRecommend = isRecommend;
	}
}
