package com.spring.ott.service.user.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.ott.VO.UserVO;

@Repository
public class UserDAO {
	
	@Autowired
	SqlSessionTemplate mybatis;

	public void join(UserVO userVO) {
		mybatis.insert("UserDAO.createUser", userVO);
		
	}

}
