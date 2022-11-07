package com.spring.ott.service.chat.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ott.VO.ChatVO;
import com.spring.ott.common.CamelHashMap;
import com.spring.ott.service.chat.ChatService;

@Service
public class ChatServiceImpl implements ChatService{

	@Autowired
	ChatDAO chatDAO;

	@Override
	public List<CamelHashMap> readChatroomList(String userId) {
		return chatDAO.readChatroomList(userId);
	}

	@Override
	public List<ChatVO> readChatList(int chatroomSeq) {
		return chatDAO.readChatList(chatroomSeq);
	}

	@Override
	public void createChat(ChatVO chatVO) {
		chatDAO.createChat(chatVO);
	}

	@Override
	public void updateChatStatus(int chatroomSeq, String userId) {
		chatDAO.updateChatStatus(chatroomSeq, userId);
	}

	@Override
	public void updateChatroomMemberYn(int chatroomSeq, String userId) {
		chatDAO.updateChatroomMemberYn(chatroomSeq, userId);		
	}

	@Override
	public void createChatroom(String userId, String chatroomMember) {
		int cntChatroom = chatDAO.checkChatroom(userId, chatroomMember); //채팅방 중복조회
		if (cntChatroom > 0) {
			System.out.println("이미 채팅방이 있음.");
		} else {
			chatDAO.createChatroom(userId, chatroomMember);
		}
	}
}
