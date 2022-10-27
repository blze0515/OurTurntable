package com.spring.ott.service.board.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoadDAO {

	@Autowired
	SqlSessionTemplate mybatis;
}
