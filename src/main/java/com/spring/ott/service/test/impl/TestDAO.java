package com.spring.ott.service.test.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TestDAO {

	@Autowired
	SqlSessionTemplate mybatis;
	
	
	
}

