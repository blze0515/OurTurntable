package com.spring.ott.service.mypage.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ott.common.CamelHashMap;
import com.spring.ott.service.mypage.MypageService;

@Service
public class MypageServiceImpl implements MypageService{

	@Autowired
	MypageDAO mypageDAO;

	@Override
	public List<CamelHashMap> readFollowingList(String userId) {
		return mypageDAO.readFollowingList(userId);
	}

	@Override
	public List<CamelHashMap> readBlockList(String userId) {
		return mypageDAO.readBlockList(userId);
	}
}
