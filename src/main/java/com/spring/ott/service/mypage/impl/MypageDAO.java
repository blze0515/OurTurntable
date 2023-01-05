package com.spring.ott.service.mypage.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.ott.common.CamelHashMap;

@Repository
public class MypageDAO {

	@Autowired
	SqlSessionTemplate mybatis;

	public List<CamelHashMap> readFollowingList(String userId) {
		return mybatis.selectList("MypageDAO.readFollowingList", userId);
	}
	
	public List<CamelHashMap> readBlockList(String userId) {
		return mybatis.selectList("MypageDAO.readBlockList", userId);
	}

	public List<CamelHashMap> readFollowerList(String userId) {
		return mybatis.selectList("MypageDAO.readFollowerList", userId);
	}
	
	public int readUserPoint(String userId) {
		return mybatis.selectOne("MypageDAO.readUserPoint", userId);
	}
}
