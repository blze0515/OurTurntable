package com.spring.ott.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.ott.service.admin.AdminService;
import com.spring.ott.service.board.BoardService;
import com.spring.ott.service.user.UserService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired AdminService adminService;
	@Autowired BoardService boardService;
	@Autowired UserService userService;


//	readUserList (회원 목록 조회)
	
	
//	updateUserState (회원 활동상태 수정)
	
	
//	updateUserGrade(회원 등급 수정)
	
	
//	updateBoardState (게시글 승인여부 수정)
	
	
}
