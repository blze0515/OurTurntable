package com.spring.ott.service.user.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ott.service.user.UserService;
import com.spring.ott.vo.UserVO;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	UserDAO userDAO;

	@Override
	public void createUser(UserVO userVO) {
		userDAO.createUser(userVO);
	}
	
	@Override
	public int idCheck(String userId) {
		return userDAO.idCheck(userId);
	}
	
	@Override
	public int pwCheck(UserVO userVO) {
		return userDAO.pwCheck(userVO);
	}
	
	@Override
	public UserVO login(UserVO userVO) {
		return userDAO.login(userVO);
	}
	
	@Override 
	public void deleteUser(UserVO loginUser) {
		userDAO.deleteUser(loginUser);
	}

	@Override
	public void updateUser(UserVO userVO) {
		userDAO.updateUser(userVO);
		
	}
}
