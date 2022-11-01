package com.spring.ott.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.ott.service.board.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	BoardService boardService;
	
	@RequestMapping("/readBoardList.do")
	public String readBoardList() {
		return "/WEB-INF/views/readBoardList";
	}
	
	@RequestMapping("/readRecBoardList.do")
	public String readRecBoardList() {
		return "/WEB-INF/views/readRecBoardList";
	}
//	createBoard (寃뚯떆湲� �벑濡�)
//		* 寃뚯떆�뙋 �쑀�삎(1,2,3)�뿉 �뵲瑜� �룞�쟻 荑쇰━

	
//	updateBoard (寃뚯떆湲� �닔�젙)

	
//	deleteBoard (寃뚯떆湲� �궘�젣)

	
//	readBoardList (寃뚯떆湲� 紐⑸줉 議고쉶)

	
//	readBoard (寃뚯떆湲� �긽�꽭 議고쉶)
//		* �꽌鍮꾩뒪�뿉�꽌 援ы쁽�븷 �궡�슜: 
//			* �뙎湲� 紐⑸줉 議고쉶 
//			* 醫뗭븘�슂 移댁슫�듃 議고쉶

	
//	createReply (�뙎湲��벑濡�)

	
//	updateReply (�뙎湲��닔�젙)

	
//	deleteReply (�뙎湲��궘�젣)

	
//	createBoardLike (醫뗭븘�슂 �벑濡�)

	
//	deleteBoardLike (醫뗭븘�슂 �궘�젣)

	
}
