package com.spring.ott.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.ott.common.CamelHashMap;
import com.spring.ott.service.point.PointService;
import com.spring.ott.vo.PointVO;
import com.spring.ott.vo.UserVO;

@Controller
@RequestMapping("/point")
public class PointController {

	@Autowired
	PointService pointService;
	
//	createPointHistory (포인트 내역 생성)
//		* 구분코드 5개 모두 insert가 되어야 함.
//		* 캐시충전의 경우 충전페이지 만들어서 결제만 카카오페이로 연결
	

/* 포인트 충전 및 사용 내역 조회 페이지만 볼 때
	//readPointHistoryList (포인트 충전 및 사용 내역 조회 페이지)
	@GetMapping("/readPointHistoryList.do")
	public String PointHistoryView(HttpSession session) {
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		if(loginUser == null) {
			return "WEB-INF/views/user/login";
		}
		
		return "WEB-INF/views/readPointDealHistory";
	}
*/
	
	
//			기존 작성되어 있던 코드 전체 주석처리(이상태로 이동하면 nullPointerException 에러남. 화면확인하기 위해서 주석처리)
	@GetMapping("/readPointHistoryList.do")
	public String readPointHistoryList(HttpSession session, Model model) {
		UserVO loginUser = new UserVO();
		loginUser =  (UserVO)session.getAttribute("loginUser");
		System.out.println("로그인유저 까지 오는지 테스트 : -------------------------------------");
		
		
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
		
		return "/WEB-INF/views/readPointDealHistory";
	}
	
	
//	readPointBalance (포인트 잔액 조회, SUM()으로 가져오기)
	
	
	//포인트 충전 페이지
	@RequestMapping(value="/createPoint.do", method=RequestMethod.GET)
	public String createPointView(HttpSession session) {
		UserVO loginUser = new UserVO();
		loginUser = (UserVO)session.getAttribute("loginUser");
		
		if(loginUser==null) {
			return "WEB-INF/views/user/login";
		}
//      파라미터에 넣어서 추가하려고 했던 것
//		, Model model,
//		@RequestParam Map<String, String> doublePoint
//		model.addAttribute("doublePoint", doublePoint.get("doublePoint"));
		
		return "/WEB-INF/views/mypage/createPoint";
	}
	
	@RequestMapping(value="/createPoint.do", method=RequestMethod.POST)
	public String createPoint(HttpSession session, Model model,
			PointVO point) {
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		if(loginUser==null) {
			return "WEB-INF/vies/user/login";
		}
/* 			구분코드
			1: 충전(+)
			2: 환전(-)
			3: 후원해줌(-)
			4: 후원받음(+)
			5: 상품구매(-)
			6: 정기후원해줌(-)
			7: 정기후원받음(+)
*/
		
		point.setUserId(loginUser.getUserId());
		
		//포인트충전
		 pointService.chargePoint(point);
		 //redirect로 보내기로 했으니까 mypage.do (컨트롤러)에서 잔액 계산 되도록 만들어야 함.
		
		 
		return "redirect:/mypage/readMypage.do";
	}

	
	

}

