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
import com.spring.ott.common.CamelHashMap;
import com.spring.ott.service.chat.ChatService;
import com.spring.ott.vo.ChatVO;
import com.spring.ott.vo.UserVO;

@Controller
@RequestMapping("/chat")
public class ChatController {
	
	@Autowired
	ChatService chatService;

//	createChat (채팅메시지 등록)
	@ResponseBody
	@PostMapping("/createChat.do")
	public String createChat(HttpSession session, ChatVO chatVO) throws JsonProcessingException { 
		UserVO loginUser = new UserVO();
		loginUser =  (UserVO)session.getAttribute("loginUser");
		
		chatVO.setUserId(loginUser.getUserId());
		
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
		UserVO loginUser = new UserVO();
		loginUser =  (UserVO)session.getAttribute("loginUser");
		
		chatService.updateChatStatus(chatroomSeq, loginUser.getUserId()); //채팅메시지의 읽음 상태 수정
		List<ChatVO> chatList = chatService.readChatList(chatroomSeq); //채팅메시지 목록 조회
				
		Map<String, Object> listMap = new HashMap<String, Object>();
		listMap.put("chatList", chatList);
		
		ObjectMapper objMapper = new ObjectMapper();
		
		String jsonStr = objMapper.writerWithDefaultPrettyPrinter().writeValueAsString(listMap);
		
		return jsonStr;
	}
	
//	readChatroomList (참여중인 채팅방 목록 조회)
	@GetMapping("/readChatroomList.do")
	public String readFollowList(HttpSession session, Model model) {
		UserVO loginUser = new UserVO();
		loginUser = (UserVO)session.getAttribute("loginUser");
		if(loginUser==null) {
			return "WEB-INF/views/user/login";
		}
		
		
//		List<CamelHashMap> chatroomList = chatService.readChatroomList(loginUser.getUserId());
//		
////		for(int i=0; i < chatroomList.size(); i++) {
////			System.out.println("챗룸목록: " + chatroomList.get(i).toString());
////		}
//		
//		model.addAttribute("chatroomList", chatroomList);
		
		return "/WEB-INF/views/readChatroomList";
	}
	
//	deleteChatroom (채팅방 삭제 - 챗방 활성화 상태를 'N'으로 수정함)
	@ResponseBody
	@GetMapping(value = "/deleteChatroom.do", produces = "application/text; charset=UTF-8")
	public String deleteChatroom(HttpSession session, @RequestParam int chatroomSeq) throws JsonProcessingException {
		UserVO loginUser = new UserVO();
		loginUser =  (UserVO)session.getAttribute("loginUser");
		
		chatService.updateChatroomMemberYn(chatroomSeq, loginUser.getUserId()); //채팅방의 활성화 상태를 'N'으로 수정함
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		jsonMap.put("message", "ok");
		String jsonStr = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(jsonMap);
		
		return jsonStr;
	}
	
//	createChatroom (채팅방 생성)
	@GetMapping("/createChatroom.do")
	public String createChatroom(HttpSession session, @RequestParam String chatroomMember) {
		
		//게시판 화면에서 사용자 아이디 우클릭시 드롭다운되는 리스트 중에 '대화하기'가 있고
		//이를 클릭할 경우 메세지를 보낼 수 있는 작은 팝업이 뜨고 그 팝업창에서 메세지 입력 및 전송이 가능하게 해야 함...
		
		//이 때, 기존 채팅방이 존재하면 기존 채팅방으로 링크를 태워주고
		//기존 채팅방이 존재하지 않으면 채팅방 생성되면서 동시에 챗메세지 등록한 뒤 링크를 태움
		//즉, 화면쪽에서 chatroomMember가 비어있는지 아닌지에 따라 분기해야 함.
		
		
		//아래의 코드는 챗메세지 등록 없이도 챗룸을 생성하는 로직임...
		UserVO loginUser = new UserVO();
		loginUser =  (UserVO)session.getAttribute("loginUser");
		
		chatService.createChatroom(loginUser.getUserId(), chatroomMember); //중복 조회, 챗룸 생성
		
		return "/WEB-INF/views/readChatroomList";
	}
}
