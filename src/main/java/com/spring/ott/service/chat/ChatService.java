package com.spring.ott.service.chat;

import java.util.List;

import com.spring.ott.VO.ChatVO;
import com.spring.ott.common.CamelHashMap;

public interface ChatService {

	List<CamelHashMap> readChatroomList(String userId);

	List<ChatVO> readChatList(int chatroomSeq);

	void createChat(ChatVO chatVO);

	void updateChatStatus(int chatroomSeq, String userId);

	void updateChatroomMemberYn(int chatroomSeq, String userId);

	void createChatroom(String userId, String chatroomMember);

}
