package com.spring.ott.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.ott.VO.UserVO;
import com.spring.ott.common.CamelHashMap;
import com.spring.ott.service.mypage.MypageService;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	@Autowired
	MypageService mypageService;
	
//  readMypage
	@RequestMapping("/myMain.do")
	public String readMypage() {
		return "/WEB-INF/views/mypage/readMypage";
	}
	
//	updateUser (회원정보 수정)
	
	
//	readFollowingList (팔로잉 목록 조회)
	@RequestMapping("/readFollowList.do")
	public String readFollowList(HttpSession session, Model model) {
		
		String userId = "gogo";
		List<CamelHashMap> followingList = mypageService.readFollowingList(userId);
		
//		for(int i=0; i < followingList.size(); i++) {
//			System.out.println(followingList.get(i).toString());
//		}
		
		model.addAttribute("relationCondition", "following");
		model.addAttribute("relationUserList", followingList);
		
		return "/WEB-INF/views/readRelationList";		
	}
	
	
//	readBlockList (차단 목록 조회)
	@RequestMapping("/readBlockList.do")
	public String readBlockList(HttpSession session, Model model) {
		
		String userId = "gogo";
		List<CamelHashMap> readBlockList = mypageService.readBlockList(userId);
		
//		for(int i=0; i < readBlockList.size(); i++) {
//			System.out.println(readBlockList.get(i).toString());
//		}
		
		model.addAttribute("relationCondition", "block");
		model.addAttribute("relationUserList", readBlockList);
		
		return "/WEB-INF/views/readRelationList";	
	}
	
	
//	readMystarList (내가 후원한사람 목록 조회)
	@RequestMapping("/readMystarList.do")
	public String readMystarList(HttpSession session, Model model) {
		
		model.addAttribute("relationCondition", "mystar");
		
		return "/WEB-INF/views/readRelationList";
	}
	
//	readMyfanList (나를 후원한사람 목록 조회)
	@RequestMapping("/readMyfanList.do")
	public String readMyfanList(HttpSession session, Model model) {
		
		model.addAttribute("relationCondition", "myfan");
		
		return "/WEB-INF/views/readRelationList";
	}
	
	
//	readMyBoardList (내가작성한 게시판 조회)
	
	
//	readMyReplyList (내가작성한 댓글 조회)
	
	
//	readMyLikeList (내가좋아요 누른 게시글 조회)


	
}
