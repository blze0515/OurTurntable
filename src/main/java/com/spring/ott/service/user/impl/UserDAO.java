package com.spring.ott.service.user.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.ott.vo.UserVO;

@Repository
public class UserDAO {
	
	@Autowired
	SqlSessionTemplate mybatis;

	public void createUser(UserVO userVO) {
		mybatis.insert("UserDAO.createUser", userVO);
	}
	
	public int idCheck(String userId) {
		return mybatis.selectOne("UserDAO.idCheck", userId);
	}
	
	public int pwCheck(UserVO userVO) {
		return mybatis.selectOne("UserDAO.pwCheck", userVO);
	}

	public UserVO login(UserVO userVO) {
		return (UserVO)mybatis.selectOne("UserDAO.login", userVO);
	}
	
	public void deleteUser(UserVO loginUser) {
		mybatis.update("UserDAO.deleteUser", loginUser);
	}
	
	
}
