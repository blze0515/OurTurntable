package com.spring.ott.service.main.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MainDAO {

	@Autowired
	SqlSessionTemplate mybatis;
}
