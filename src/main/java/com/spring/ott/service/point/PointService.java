package com.spring.ott.service.point;

import java.util.List;

import com.spring.ott.common.CamelHashMap;
import com.spring.ott.vo.PointVO;

public interface PointService {

	List<CamelHashMap> readPointHistoryList(String userId);

	int readPointBalance(String userId);

	void chargePoint(PointVO point);
}
