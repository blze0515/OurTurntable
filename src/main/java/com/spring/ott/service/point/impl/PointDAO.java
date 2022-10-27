package com.spring.ott.service.point.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PointDAO {
	
	@Autowired
	SqlSessionTemplate mybatis;

}
