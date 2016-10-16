package com.yellowcong.model;

import java.util.Date;

/**
 * 问题 测试
 * @author yellowcong
 * @date 2015年12月27日
 */
public class Question {
	private int id;
	/**
	 * 标题
	 */
	private String title;
	/**
	 * 类容
	 */
	private String content;
	/**
	 * 发表问题  用户的名称 id
	 */
	private User user;
	/**
	 * 创建日期
	 */
	private Date createDate;
	/**
	 * 查看次数
	 */
	private int seeCount;
	/**
	 * 是否结题  1 表示结题
	 * 		  0 表示未结题
	 */
	private int isActive;
	/**
	 * 同问，多少人也问这题
	 */
	private int tongwen;
	
}
