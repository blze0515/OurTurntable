package com.spring.ott.controller;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.ott.service.board.BoardService;
import com.spring.ott.service.main.MainService;

@Controller
@RequestMapping("/main")
public class MainController {
	
	@Autowired MainService mainService;
	@Autowired BoardService boardService;
	
	@RequestMapping("/main.do")
	public String main() {
		return "index";
	}
	
	@RequestMapping("/about.do")
	public String about() {
		return "/WEB-INF/views/services";
	}
	
//	readBoardRankingList (醫뗭븘�슂 諛쏆� �닔 �옲�궧 / �젅�씠�듃 �룊�젏 �옲�궧)
//	* �옉�뭹(�옄�옉寃뚯떆�뙋) 罹먮윭���뿉 �벝 議고쉶
//	* 異붿쿇�옣�냼(異붿쿇寃뚯떆�뙋) 罹먮윭���뿉 �벝 議고쉶
}
   