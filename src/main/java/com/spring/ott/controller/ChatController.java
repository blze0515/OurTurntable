package com.spring.ott.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.ott.VO.UserVO;
import com.spring.ott.service.chat.ChatService;

@Controller
@RequestMapping("/chat")
public class ChatController {
	
	@Autowired
	ChatService chatService;

//	createChat - (채팅메시지 등록)
//    - 서비스에서 구현할 내용:
//    - createChatroom (첫 채팅을 입력할 때 챗룸이 생겨야 함)
//    - readChatList (채팅메세지 목록 조회)
	
//	readChatList (채팅메시지 목록 조회)

	
//	readChatroomList (참여중인 채팅방 목록 조회)
	@RequestMapping("/readChatroomList.do")
	public String readFollowList(HttpSession session, Model model) {
		
//		String userId = "gogo";
//		List<UserVO> followingList = mypageService.readFollowingList(userId);
//		
//		for(int i=0; i < followingList.size(); i++) {
//			System.out.println(followingList.get(i).toString());
//		}
//		
//		model.addAttribute("relationUserList", followingList);
		
		return "/WEB-INF/views/readChatroomList";		
	}

	
//	deleteChatroom (채팅방 삭제)
	
	
//	updateChatStatus() (채팅메시지의 읽음상태 수정)

	
}
