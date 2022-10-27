package com.spring.ott.service.main.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ott.service.main.MainService;

@Service
public class MainServiceImpl implements MainService{

	@Autowired
	MainDAO mainDAO;
}
