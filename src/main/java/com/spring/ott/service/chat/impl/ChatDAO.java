package com.spring.ott.service.chat.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChatDAO {

	@Autowired
	SqlSessionTemplate mybatis;
}
