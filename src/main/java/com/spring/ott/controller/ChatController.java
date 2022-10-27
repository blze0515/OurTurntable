package com.spring.ott.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.ott.service.chat.ChatService;

@Controller
@RequestMapping("/chat")
public class ChatController {
	
	@Autowired
	ChatService chatService;

//	createChat (채팅메시지 등록)
//		* 서비스에서 구현할 내용: 
//			* 첫 채팅을 입력할 때 챗룸이 생겨야 함

	
//	readChatList (채팅메세지 목록 조회)

	
//	readChatroomList (참여중인 챗룸 목록 조회)

	
//	deleteChatroom (챗룸 삭제)

	
}
