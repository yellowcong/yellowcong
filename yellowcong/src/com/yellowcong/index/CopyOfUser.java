package com.yellowcong.index;

import java.util.Date;

import org.compass.annotations.Index;
import org.compass.annotations.Searchable;
import org.compass.annotations.SearchableId;
import org.compass.annotations.SearchableProperty;
import org.compass.annotations.SearchableReference;
import org.compass.annotations.Store;

/**
 * 定义用户对象，然后进行数据的 索引
 * @author yellowcong
 * @date 2016年1月7日
 *
 */
//这个注解 表明这个类可以进行 索引
@Searchable
public class CopyOfUser {
	private int id;
	private String username;
	private String password;
	private String nickname;
	private String email;
	private Date createDate;
	private String address;
	
	//表示唯一的区别对象 ，这个是必须要存在的
	//id不需要分词，但需要 索引和存储
	@SearchableId
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	//通过设定boost 来设定计算评分，默认是 1  ,数值越大，表示越是重要
	//store 的默认值是 Store.yes
	//index 的默认是值是Index.ANALYZED
	@SearchableProperty(index = Index.NOT_ANALYZED,store=Store.YES,boost=2)
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	@SearchableProperty(store = Store.NO)
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@SearchableProperty(index=Index.NOT_ANALYZED)
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	@SearchableProperty(index=Index.NOT_ANALYZED)
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@SearchableProperty(index=Index.NOT_ANALYZED)
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	@SearchableProperty
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
}
