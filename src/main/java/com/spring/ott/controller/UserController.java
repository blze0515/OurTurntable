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
//	createUser (  ๊ฐ  )

	
//	createSession (๋ก๊ทธ ธ)
	
	
//	deleteSession (๋ก๊ทธ  )
	
	
//	readUserIdCheck (  ด  ์ค๋ณต์ฒดํฌ)

	
//	createFollow ( ๋ก์ฐ)
	
	
//	createBlock (์ฐจ๋จ)
	
	
//	deleteFollow ( ๋ก์ฐ  ญ  )
	
	
//	deleteBlock (์ฐจ๋จ  ญ  )
	


}
