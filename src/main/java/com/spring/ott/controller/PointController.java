package com.spring.ott.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.ott.service.point.PointService;

@Controller
@RequestMapping("/point")
public class PointController {

	@Autowired
	PointService pointService;
	
//	createPointHistory (포인트 내역 생성)
//		* 구분코드 5개 모두 insert가 되어야 함.
//		* 캐시충전의 경우 충전페이지 만들어서 결제만 카카오페이로 연결
	
	
//	ReadPointHistoryList (포인트 내역 조회)
	
	
//	ReadPointBalance (포인트 잔액 조회, SUM()으로 가져오기
	

}
