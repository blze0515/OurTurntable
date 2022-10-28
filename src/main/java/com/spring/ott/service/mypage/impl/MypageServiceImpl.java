package com.spring.ott.service.mypage.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ott.VO.UserVO;
import com.spring.ott.service.mypage.MypageService;

@Service
public class MypageServiceImpl implements MypageService{

	@Autowired
	MypageDAO mypageDAO;

	@Override
	public List<UserVO> readFollowList(String userId) {
		return mypageDAO.readFollowList(userId);
	}
}
