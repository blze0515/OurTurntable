package com.spring.ott.service.chat.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.ott.VO.ChatVO;
import com.spring.ott.common.CamelHashMap;

@Repository
public class ChatDAO {

	@Autowired
	SqlSessionTemplate mybatis;

	public List<CamelHashMap> readChatroomList(String userId) {
		return mybatis.selectList("ChatDAO.readChatroomList", userId);
	}

	public List<ChatVO> readChatList(int chatroomSeq) {
		return mybatis.selectList("ChatDAO.readChatList", chatroomSeq);
	}

	public void createChat(ChatVO chatVO) {
		mybatis.insert("ChatDAO.createChat", chatVO);
	}

	public void updateChatStatus(int chatroomSeq, String userId) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("chatroomSeq", chatroomSeq);
		paramMap.put("userId", userId);
		
		mybatis.update("ChatDAO.updateChatStatus", paramMap);
	}

	public void updateChatroomMemberYn(int chatroomSeq, String userId) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("chatroomSeq", chatroomSeq);
		paramMap.put("userId", userId);
		
		mybatis.update("ChatDAO.updateChatroomMemberYn", paramMap);
	}

	public void createChatroom(String userId, String chatroomMember) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("chatroomMember", chatroomMember);
		paramMap.put("userId", userId);
	
		mybatis.insert("ChatDAO.createChatroom", paramMap);
	}

	public int checkChatroom(String userId, String chatroomMember) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("chatroomMember", chatroomMember);
		paramMap.put("userId", userId);
	
		return mybatis.selectOne("ChatDAO.createChatroom", paramMap);
	}
}
