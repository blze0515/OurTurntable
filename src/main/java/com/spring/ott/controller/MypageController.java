package com.spring.ott.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.ott.VO.UserVO;
import com.spring.ott.service.mypage.MypageService;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	@Autowired
	MypageService mypageService;
	
//	updateUser (회원정보 수정)
	
	
//	readFollowList (팔로우 목록 조회)
	@RequestMapping("/readFollowList.do")
	public String readFollowList(HttpSession session, Model model) {
		
		String userId = "gogo";
		List<UserVO> followList = mypageService.readFollowList(userId);
		
		for(int i=0; i < followList.size(); i++) {
			System.out.println(followList.get(i).toString());
		}
		
		model.addAttribute("relationUserList", followList);
		
		return "/WEB-INF/views/readRelationList";		
	}
	
//	readBlockList (차단 목록 조회)
	@RequestMapping("/readBlockList.do")
	public String readBlockList() {
		return "/WEB-INF/views/readRelationList";
	}
	
//	readMystarList (내가 후원한사람 조회)
	@RequestMapping("/readMystarList.do")
	public String readMystarList() {
		return "/WEB-INF/views/readRelationList";
	}
	
//	readMyfanList (나를 후원한사람 조회)
	@RequestMapping("/readMyfanList.do")
	public String readMyfanList() {
		return "/WEB-INF/views/readRelationList";
	}
	
	
//	readMyBoardList (내가작성한 게시판 조회)
	
	
//	readMyReplyList (내가작성한 댓글 조회)
	
	
//	readMyLikeList (내가좋아요 누른 게시글 조회)


	
}
