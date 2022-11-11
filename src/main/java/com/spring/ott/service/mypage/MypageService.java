package com.spring.ott.service.mypage;

import java.util.List;

import com.spring.ott.common.CamelHashMap;

public interface MypageService {

	List<CamelHashMap> readFollowingList(String userId);

	List<CamelHashMap> readBlockList(String userId);

	List<CamelHashMap> readFollowerList(String userId);

}
