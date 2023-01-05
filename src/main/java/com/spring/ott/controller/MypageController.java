package com.spring.ott.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.ott.service.mypage.MypageService;
import com.spring.ott.vo.UserVO;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	@Autowired
	MypageService mypageService;
	
//  readMypage
	@RequestMapping("/readMypage.do")
	public String readMypage(HttpSession session, Model model) {
		
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
//		System.out.println("마이페이지 로그인 유저 정보 : " + loginUser.toString());
		if(loginUser==null){
			return "WEB-INF/views/user/login";
		}
		
		int userPoint = mypageService.readUserPoint(loginUser.getUserId());
		model.addAttribute("userPoint", userPoint);
		
		
		return "/WEB-INF/views/mypage/readMypage";
	}
	
//	updateUser (회원정보 수정)
	
	
//	readFollowingList (팔로잉 목록 조회 - 내가 팔로우한 회원 목록)
	@RequestMapping("/readFollowingList.do")
	public String readFollowList(HttpSession session, Model model) {
		UserVO loginUser = new UserVO();
		loginUser =  (UserVO)session.getAttribute("loginUser");
		if(loginUser==null) {
			return "/WEB-INF/views/user/login";
		}
		
//		List<CamelHashMap> followingList = mypageService.readFollowingList(loginUser.getUserId());
//		
////		for(int i=0; i < followingList.size(); i++) {
////			System.out.println(followingList.get(i).toString());
////		}
//		
//		model.addAttribute("relationCondition", "following");
//		model.addAttribute("relationUserList", followingList);
		
		return "/WEB-INF/views/readRelationList";		
	}
	
//	readFollowingList (팔로워 목록 조회 - 나를 팔로우한 회원 목록)
	@RequestMapping("/readFollowerList.do")
	public String readFollowerList(HttpSession session, Model model) {
		UserVO loginUser = new UserVO();
		loginUser =  (UserVO)session.getAttribute("loginUser");
		if(loginUser==null) {
			return "/WEB-INF/views/user/login";
		}
		
//		List<CamelHashMap> followerList = mypageService.readFollowerList(loginUser.getUserId());
//		
////		for(int i=0; i < followerList.size(); i++) {
////			System.out.println(followerList.get(i).toString());
////		}
//		
//		model.addAttribute("relationCondition", "follower");
//		model.addAttribute("relationUserList", followerList);
//		
		return "/WEB-INF/views/readRelationList";		
	}	
	
//	readBlockList (차단 목록 조회)
	@RequestMapping("/readBlockList.do")
	public String readBlockList(HttpSession session, Model model) {
		UserVO loginUser = new UserVO();
		loginUser =  (UserVO)session.getAttribute("loginUser");
		if(loginUser==null) {
			return "/WEB-INF/views/user/login";
		}
		
//		List<CamelHashMap> readBlockList = mypageService.readBlockList(loginUser.getUserId());
//		
////		for(int i=0; i < readBlockList.size(); i++) {
////			System.out.println(readBlockList.get(i).toString());
////		}
//		
//		model.addAttribute("relationCondition", "block");
//		model.addAttribute("relationUserList", readBlockList);
		
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


	@RequestMapping(value="/contact.do", method=RequestMethod.GET)
	public String contactView(HttpSession session) {
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		if(loginUser==null) {
			return "WEB-INF/views/user/login";
		}
		
		return "WEB-INF/views/mypage/contact";
	}
	
	@RequestMapping(value="/donation.do", method=RequestMethod.GET)
	public String donationView() {
		return "/WEB-INF/views/mypage/readDonation";
	}
	
	@RequestMapping(value="/donation.do", method=RequestMethod.POST)
	public String donation(HttpSession session, Model model) {
		UserVO loginUser = new UserVO();
		loginUser = (UserVO)session.getAttribute("loginUser");
		
		if(loginUser==null) {
			return "WEB-INF/views/user/login";
		}
		
		
		
		
		return "redirect:/mypage/readMyPage.do";
	}
}
