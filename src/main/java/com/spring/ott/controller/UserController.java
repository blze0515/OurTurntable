package com.spring.ott.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.ott.VO.UserVO;
import com.spring.ott.service.user.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	UserService userService;
	
	
	@RequestMapping("/login.do")
	public String loginView() {
		return "/WEB-INF/views/user/login";
	}

	
	@RequestMapping("/myPage.do")
	public String myPageView() {
		return "/WEB-INF/views/user/myPage";
	}
	
//	@GetMapping("/createUser.do")
//	public String createUserView () {
//		return "/WEB-INF/views/user/createUser";
//	}
	
	/*221102 한글 깨지는지 테스트 utf-8 저장*/ 
	
//	createUser ( 쉶 썝媛  엯)
	@RequestMapping("/createUser.do")
	public String createUser(UserVO userVO) {
		//회원가입 정보가 넘어오지 않았을 때는 회원가입 화면으로
		if(userVO.getUserId() == null || userVO.getUserId().equals("")) {
			return "/WEB-INF/views/user/createUser";
		} else {
			//회원가입 정보가 넘어왔을 때는 회원가입 처리 후 로그인 화면으로
			userService.createUser(userVO);
			
			return "/WEB-INF/views/user/login";
		}
	}
	
//	createSession (濡쒓렇 씤)
	
	
//	deleteSession (濡쒓렇 븘 썐)
	
	
//	readUserIdCheck ( 븘 씠 뵒 以묐났泥댄겕)

	
//	createFollow ( 뙏濡쒖슦)
	
	
//	createBlock (李⑤떒)
	
	
//	deleteFollow ( 뙏濡쒖슦  궘 젣)
	
	
//	deleteBlock (李⑤떒  궘 젣)
	


}
