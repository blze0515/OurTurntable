package com.spring.ott.service.user;

import com.spring.ott.VO.UserVO;

public interface UserService {

	void createUser(UserVO userVO);
	
	int idCheck(String userId);
	
	int pwCheck(UserVO userVO);
	
	UserVO login(UserVO userVO);

}
