package com.yellowcong.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yellowcong.dao.PassageDao;
import com.yellowcong.model.Passage;
import com.yellowcong.service.PassageService;

@Service("passageService")
public class PassageServiceImpl implements PassageService{
	private PassageDao passageDao;
	
	@Resource(name="passageDao")
	public void setPassageDao(PassageDao passageDao) {
		this.passageDao = passageDao;
	}

	@Override
	public Passage add(Passage entity) {
		this.passageDao.add(entity);
		return entity;
	}

	@Override
	public Passage loadById(int id) {
		return this.passageDao.load(id);
	}

	@Override
	public void delete(int id) {
		this.passageDao.delete(id);
	}

	@Override
	public void update(Passage t) {
		this.passageDao.update(t);
	}

	@Override
	@Deprecated
	public List<Passage> list() {
		return this.passageDao.list("from Passage");
	}

	@Override
	public void addObj(Object obj) {
		// TODO Auto-generated method stub
		this.passageDao.addObj(obj);
	}
}
