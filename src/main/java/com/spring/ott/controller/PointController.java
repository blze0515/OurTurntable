package com.spring.ott.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.ott.common.CamelHashMap;
import com.spring.ott.service.point.PointService;
import com.spring.ott.vo.UserVO;

@Controller
@RequestMapping("/point")
public class PointController {

	@Autowired
	PointService pointService;
	
//	createPointHistory (포인트 내역 생성)
//		* 구분코드 5개 모두 insert가 되어야 함.
//		* 캐시충전의 경우 충전페이지 만들어서 결제만 카카오페이로 연결
	
	
//	readPointHistoryList (포인트 충전 및 사용 내역 조회)
	@GetMapping("/readPointHistoryList.do")
	public String readFollowList(HttpSession session, Model model) {
		UserVO loginUser = new UserVO();
		loginUser =  (UserVO)session.getAttribute("loginUser");
		
		List<CamelHashMap> pointHistoryList = pointService.readPointHistoryList(loginUser.getUserId());
		model.addAttribute("pointHistoryList", pointHistoryList);

//		잔액 계산을 컨트롤러에서 하는 경우...
//		int pointBalance = 0;
//		
//		for(int i=0; i < pointHistoryList.size(); i++) {
//			System.out.println(pointHistoryList.get(i).toString());
//			System.out.println(pointHistoryList.get(i).get("pointCommonCode"));
//			
//			int pointCommonCode = Integer.parseInt(String.valueOf(pointHistoryList.get(i).get("pointCommonCode")));
//			if(pointCommonCode == 1 || pointCommonCode == 4 || pointCommonCode == 7) {
//				pointBalance += Integer.parseInt(String.valueOf(pointHistoryList.get(i).get("pointMoney")));
//			} else {
//				pointBalance -= Integer.parseInt(String.valueOf(pointHistoryList.get(i).get("pointMoney")));
//			}
//		}
//		System.out.println(pointBalance);
		
//		잔액 계산을 쿼리에서 하는 경우...		
		int pointBalacnce = pointService.readPointBalance(loginUser.getUserId());
		model.addAttribute("pointBalance", pointBalacnce); //잔액 계산
		
		return "/WEB-INF/views/readPointHistoryList";
	}
	
	
//	readPointBalance (포인트 잔액 조회, SUM()으로 가져오기)
	

}
