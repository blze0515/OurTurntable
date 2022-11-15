package com.spring.ott.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.ott.Criteria;
import com.spring.ott.VO.BoardFileVO;
import com.spring.ott.VO.BoardVO;
import com.spring.ott.VO.PageVO;
import com.spring.ott.VO.UserVO;
import com.spring.ott.service.board.BoardService;
import com.spring.ott.utils.FileUtils;


@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	BoardService boardService;

	
//	readBoardList (자유게시판 목록 조회)
	@RequestMapping("/readFBoardList.do")
	public String readBoardList(HttpSession session, Model model,
		@RequestParam Map<String, String> paramMap, Criteria cri) {
			UserVO loginUser = (UserVO)session.getAttribute("loginUser");
			
		if(loginUser == null) {
			return "/WEB-INF/view/user/login";
		}
		
		List<BoardVO> boardList = boardService.getBoardList(paramMap, cri);
		
		//total = 작성돼있는 총 게시물 수 가져오는 변수
		int total = boardService.getBoardCnt(paramMap);
		
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" + total);
		
		for(int i=0; i < boardList.size(); i++) {
			System.out.println(boardList.get(i).toString());
		}
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("pageMaker", new PageVO(cri, total));
		
		if(paramMap.get("searchCondition") != null && !paramMap.get("searchCondition").equals("")) {
			System.out.println("searchCondition================" + paramMap.get("searchCondition"));
			model.addAttribute("searchCondition", paramMap.get("searchCondition"));
		}
		
		if(paramMap.get("searchKeyword") != null && !paramMap.get("searchKeyword").equals("")) {
			model.addAttribute("searchKeyword", paramMap.get("searchKeyword"));
		}
		
		return "/WEB-INF/views/board/readFBoardList";
	}
	
//	readRecBoadList (추천게시판 목록 조회)
	@RequestMapping("/readRecBoardList.do")
	public String readRecBoardList() {
		return "/WEB-INF/views/readRecBoardList";
	}
	
//	readBoard (게시글 상세 조회)
//		* 서비스에서 구현할 내용: 
//			* 댓글 목록 조회
//			* 좋아요 카운트 조회
	
//	@RequestMapping("/readFBoard.do")
//	public String readFBoardView() {
//		return "/WEB-INF/views/board/readFBoard";
//	}
	
	
	//여기부터 getboard.do
	@RequestMapping("/readFBoard.do")
	public String getBoard(HttpSession session, @RequestParam int boardSeq, Model model) {
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		
		if(loginUser == null) {
			return "/WEB-INF/views/user/login";
		}
		
		//게시물 클릭하면 조회수+1
		boardService.updateBoardCnt(boardSeq);
		
		BoardVO board = boardService.getBoard(boardSeq);
//		List<BoardFileVO> fileList = boardService.getBoardFile(boardSeq);
		
		model.addAttribute("board", board);
		//model.addAttribute("fileList", fileList);
		
		return "/WEB-INF/views/board/readFBoard";
	}
	
	
	
	
	
//	createBoard (게시글 등록)
//		* 게시판 유형(1,2,3)에 따른 동적 쿼리'
	
	@RequestMapping(value="/createBoard.do", method=RequestMethod.GET)
	public String createFBoardView() {
		
//		boardService.createBoard(boardVO)
		
		return "/WEB-INF/views/board/createBoard";
	}
	
	@RequestMapping(value="/createBoard.do", method=RequestMethod.POST)
	public String createBoard(HttpSession session, BoardVO boardVO, HttpServletRequest request,
			MultipartHttpServletRequest multipartServletRequest) throws IOException {
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		
		if(loginUser == null) {
			return "/WEB-INF/views/user/login";
		}
		
//		int boardSeq = boardService.createNextBoardSeq();
		
		// **파일업로드는 CRUD 먼저 하고 그 다음에 하기로함 FileUtils fileUtils = new FileUtils();
		
		//파일업로드 처리 및 속성 값들이 세팅된 BoardFileVO의 목록 리턴
//		List<BoardFileVO> fileList = fileUtils.parseFileInfo(boardSeq, request, multipartServletRequest);
		// **파일업로드는 CRUD 먼저 하고 그 다음에 하기로함 List<MultipartFile> fileList = fileUtils.parseFileInfo(multipartServletRequest);
		
		boardService.createBoard(boardVO);
		
//		if(!CollectionUtils.isEmpty(fileList)) {
//			boardService.insertBoardFile(fileList);
//		}
		
		return "redirect:/board/readFBoardList.do";
	}
	
//	updateBoard (게시글 수정)

	
//	deleteBoard (게시글 삭제)

	@RequestMapping(value="/deleteBoard.do")
	public String deleteBoard(@RequestParam int boardSeq) {
		boardService.deleteBoard(boardSeq);
		
		return "redirect:/board/readFBoardList.do";
	}


	
//	createReply (댓글등록)

	
//	updateReply (댓글수정)

	
//	deleteReply (댓글삭제)

	
//	createBoardLike (좋아요 등록)

	
//	deleteBoardLike (좋아요 삭제)

	
}
