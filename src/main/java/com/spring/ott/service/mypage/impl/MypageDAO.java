package com.spring.ott.service.mypage.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.ott.VO.UserVO;

@Repository
public class MypageDAO {

	@Autowired
	SqlSessionTemplate mybatis;

	public List<UserVO> readFollowList(String userId) {
		return mybatis.selectList("MypageDAO.readFollowList", userId);
	}
}
