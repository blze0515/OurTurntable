package com.spring.ott.service.point;

import java.util.List;

import com.spring.ott.common.CamelHashMap;

public interface PointService {

	List<CamelHashMap> readPointHistoryList(String userId);

	int readPointBalance(String userId);

}
