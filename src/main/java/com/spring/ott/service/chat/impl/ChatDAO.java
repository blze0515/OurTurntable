package com.spring.ott.service.chat.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.ott.common.CamelHashMap;

@Repository
public class ChatDAO {

	@Autowired
	SqlSessionTemplate mybatis;

	public List<CamelHashMap> readChatroomList(String userId) {
		return mybatis.selectList("ChatDAO.readChatroomList", userId);
	}
}
