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
	
//	createBoard (게시글 등록)
//		* 게시판 유형(1,2,3)에 따른 동적 쿼리

	
//	updateBoard (게시글 수정)

	
//	deleteBoard (게시글 삭제)

	
//	readBoardList (게시글 목록 조회)

	
//	readBoard (게시글 상세 조회)
//		* 서비스에서 구현할 내용: 
//			* 댓글 목록 조회 
//			* 좋아요 카운트 조회

	
//	createReply (댓글등록)

	
//	updateReply (댓글수정)

	
//	deleteReply (댓글삭제)

	
//	createBoardLike (좋아요 등록)

	
//	deleteBoardLike (좋아요 삭제)

	
}
