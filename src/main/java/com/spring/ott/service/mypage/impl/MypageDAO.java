package com.spring.ott.service.mypage.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MypageDAO {

	@Autowired
	SqlSessionTemplate mybatis;
}
