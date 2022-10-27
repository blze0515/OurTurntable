package com.spring.ott.service.mypage.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ott.service.mypage.MypageService;

@Service
public class MypageServiceImpl implements MypageService{

	@Autowired
	MypageDAO mypageDAO;
}
