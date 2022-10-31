package com.spring.ott.service.chat;

import java.util.List;

import com.spring.ott.common.CamelHashMap;

public interface ChatService {

	List<CamelHashMap> readChatroomList(String userId);

}
