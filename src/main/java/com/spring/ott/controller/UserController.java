package com.spring.ott.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.ott.service.user.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	UserService userService;
	
	
	@RequestMapping("/login.do")
	public String login() {
		return "/WEB-INF/views/login";
	}
	
	@RequestMapping("/join.do")
	public String join() {
		return "/WEB-INF/views/join";
	}
//	createUser ( šŒ ›ê°  …)

	
//	createSession (ë¡œê·¸ ¸)
	
	
//	deleteSession (ë¡œê·¸ •„ ›ƒ)
	
	
//	readUserIdCheck ( •„ ´ ”” ì¤‘ë³µì²´í¬)

	
//	createFollow ( Œ”ë¡œìš°)
	
	
//	createBlock (ì°¨ë‹¨)
	
	
//	deleteFollow ( Œ”ë¡œìš°  ‚­  œ)
	
	
//	deleteBlock (ì°¨ë‹¨  ‚­  œ)
	


}
