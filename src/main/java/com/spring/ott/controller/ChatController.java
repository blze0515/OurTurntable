package com.spring.ott.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.ott.VO.ChatVO;
import com.spring.ott.common.CamelHashMap;
import com.spring.ott.service.chat.ChatService;

@Controller
@RequestMapping("/chat")
public class ChatController {
	
	@Autowired
	ChatService chatService;

//	createChat - (채팅메시지 등록)
	@ResponseBody
	@PostMapping("/createChat.do")
	public String createChat(HttpSession session, ChatVO chatVO) throws JsonProcessingException { 
		
		String userId = "gogo"; //로그인한 사용자 아이디
		chatVO.setUserId(userId);
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		chatService.createChat(chatVO);
		
		jsonMap.put("message", "ok");
		String jsonStr = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(jsonMap);
		
		return jsonStr;
	}
	
//	readChatList (채팅메시지 목록 조회)
	@ResponseBody
	@GetMapping(value = "/readChatList.do", produces = "application/text; charset=UTF-8")
	public String readChatList(HttpSession session, @RequestParam int chatroomSeq) throws JsonProcessingException {
		
		List<ChatVO> chatList = chatService.readChatList(chatroomSeq);
		
		Map<String, Object> listMap = new HashMap<String, Object>();
		listMap.put("chatList", chatList);
		
		ObjectMapper objMapper = new ObjectMapper();
		
		String jsonStr = objMapper.writerWithDefaultPrettyPrinter().writeValueAsString(listMap);
		
		return jsonStr;
	}
	
//	readChatroomList (참여중인 채팅방 목록 조회)
	@GetMapping("/readChatroomList.do")
	public String readFollowList(HttpSession session, Model model) {
		
		String userId = "gogo"; //로그인한 사용자 아이디
		List<CamelHashMap> chatroomList = chatService.readChatroomList(userId);
		
		for(int i=0; i < chatroomList.size(); i++) {
			System.out.println(chatroomList.get(i).toString());
		}
		
		model.addAttribute("chatroomList", chatroomList);
		
		return "/WEB-INF/views/readChatroomList";
	}
	
//	deleteChatroom (채팅방 삭제)
	
	
//	updateChatStatus() (채팅메시지의 읽음상태 수정)

	
}
