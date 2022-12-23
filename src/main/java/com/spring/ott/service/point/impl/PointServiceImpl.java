package com.spring.ott.service.point.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ott.common.CamelHashMap;
import com.spring.ott.service.point.PointService;
import com.spring.ott.vo.PointVO;

@Service
public class PointServiceImpl implements PointService{

	@Autowired
	PointDAO pointDAO;

	@Override
	public List<CamelHashMap> readPointHistoryList(String userId) {
		return pointDAO.readPointHistoryList(userId);
	}

	@Override
	public int readPointBalance(String userId) {
		return pointDAO.readPointBalance(userId);
	}
	
	@Override
	public void chargePoint(PointVO point) {
		pointDAO.chargePoint(point);
	}
}
