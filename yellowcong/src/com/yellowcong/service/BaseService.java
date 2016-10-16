package com.yellowcong.service;

import java.util.List;

public interface BaseService<T> {
	/**
	 * 添加数据
	 * @param entity
	 * @return
	 */
	public T add(T entity);
	/**
	 * 通过id来加载对象
	 * @param id
	 * @return
	 */
	public T loadById(int id);
	/**
	 * 通过id来删除数据
	 * @param id
	 */
	public void delete(int id);
	/**
	 * 更新对象
	 * @param t
	 */
	public void update(T t);
	/**
	 * 获取所有 对象
	 * @return
	 */
	public List<T> list();
}
