package com.spring.ott.service.point.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.ott.common.CamelHashMap;

@Repository
public class PointDAO {
	
	@Autowired
	SqlSessionTemplate mybatis;

	public List<CamelHashMap> readPointHistoryList(String userId) {
		return mybatis.selectList("PointDAO.readPointHistoryList", userId);
	}

	public int readPointBalance(String userId) {
		return mybatis.selectOne("PointDAO.readPointBalance", userId);
	}

}
