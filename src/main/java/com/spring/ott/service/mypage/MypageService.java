package com.spring.ott.service.mypage;

import java.util.List;

import com.spring.ott.VO.UserVO;

public interface MypageService {

	List<UserVO> readFollowingList(String userId);

	List<UserVO> readBlockList(String userId);

}
