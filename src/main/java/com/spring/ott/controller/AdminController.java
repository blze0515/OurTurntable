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
	@RequestMapping("/adminUser.do")
	public String readUserList() {
		return "/WEB-INF/views/admin/readUserList";
	}
	
//	updateBoardState (게시글 승인여부 수정)
	@RequestMapping("/adminBoard.do")
	public String readBoardList() {
		return "/WEB-INF/views/admin/updateBoardList";
	}

//	updateUserGrade (회원 등급 수정)
	@RequestMapping("/adminGrade.do")
	public String updateUserGrade() {
		return "/WEB-INF/views/admin/updateUserGrade";
	}
	
//	updateUserState (회원 활동상태 수정)
	
	

	
}
