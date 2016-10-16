package com.yellowcong.dao.impl;

import org.springframework.stereotype.Repository;

import com.yellowcong.dao.PassageDao;
import com.yellowcong.model.Passage;

@Repository("passageDao")
public class PssageDaoImpl extends BaseDaoImpl<Passage> implements PassageDao {

}
