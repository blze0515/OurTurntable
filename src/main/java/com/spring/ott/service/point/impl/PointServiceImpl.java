package com.spring.ott.service.point.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ott.service.point.PointService;

@Service
public class PointServiceImpl implements PointService{

	@Autowired
	PointDAO pointDAO;
}
