package com.spring.ott.controller;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.ott.service.main.MainService;

@Controller
@RequestMapping("/main")
public class MainController {
	
	@Autowired
	MainService mainService;
	
	@RequestMapping("/about.do")
	public String about() {
		return "services";
	}
	
//	readBoardRankingList (좋아요 받은 수 랭킹 / 레이트 평점 랭킹)
//	* 작품(자랑게시판) 캐러셀에 쓸 조회
//	* 추천장소(추천게시판) 캐러셀에 쓸 조회
}
   