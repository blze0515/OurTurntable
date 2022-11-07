package com.spring.ott.service.user.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ott.VO.UserVO;
import com.spring.ott.service.user.UserService;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	UserDAO userDAO;

	@Override
	public void createUser(UserVO userVO) {
		userDAO.join(userVO);
		
	}
}
