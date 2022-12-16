//11.28 기준 BoardController.java 백업

package com.spring.ott.controller;

import java.io.IOException;
import java.util.ArrayList;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.ott.Criteria;
import com.spring.ott.service.board.BoardService;
import com.spring.ott.utils.FileUtils;
import com.spring.ott.vo.BoardFileVO;
import com.spring.ott.vo.BoardVO;
import com.spring.ott.vo.PageVO;
import com.spring.ott.vo.UserVO;


@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	BoardService boardService;

	
//	readBoardList (자유게시판 목록 조회)
	@RequestMapping("/readBoardList.do")
	//RequestParam 화면단(.jsp)에 name, value로 작성된 키와 값을 모두 받아온다.
	//Map을 사용하면 자동으로 put 메서드가 실행된다. (Map에 값을 추가하는 메서드)
	//command 객체(VO)를 사용 하면 member 변수 이름과 키 값이 같으면 자동으로 setter가 실행 된다.
	//Map이랑 VO랑 비슷한거다.
	public String readBoardList(HttpSession session, Model model,
		@RequestParam Map<String, String> paramMap, Criteria cri) {
		System.out.println("받아온 파람맵 = = = = == = == = == "+paramMap);
			UserVO loginUser = (UserVO)session.getAttribute("loginUser");
			//System.out.println(paramMap.get("boardCategory"));
		if(loginUser == null) {
			return "/WEB-INF/views/user/login";
		}
		
		List<BoardVO> boardList = boardService.getBoardList(paramMap, cri);
		System.out.println("리스트로 받아온 파람맵 = = = = == = == = == "+paramMap);
		
		System.out.println("model에 담긴 값=========="+model.toString());
		System.out.println("paramMap에 담긴 값=========="+paramMap.toString());
		
		//total = 작성돼있는 총 게시물 수 가져오는 변수
		//getboardCnt에도 쿼리에 카테고리에 대한 조건을 줘야 해당 카테고리에 대한 글 개수를 표시할 수 있다.
		int total = boardService.getBoardCnt(paramMap);
		
		//게시물 몇개인지 출력
		System.out.println(" 게시물 개수(total) : " + total);
		
		//게시물 정보 출력
		for(int i=0; i < boardList.size(); i++) {
			System.out.println("보드리스트= " +boardList.get(i).toString());
		}
		model.addAttribute("boardList", boardList);
		model.addAttribute("pageMaker", new PageVO(cri, total));
		
		
		
		
//		S 검색조건 선택했을 때 사용
		if(paramMap.get("searchCondition") != null && !paramMap.get("searchCondition").equals("")) {
			System.out.println("searchCondition================" + paramMap.get("searchCondition"));
			model.addAttribute("searchCondition", paramMap.get("searchCondition"));
		}
		
		if(paramMap.get("searchKeyword") != null && !paramMap.get("searchKeyword").equals("")) {
			model.addAttribute("searchKeyword", paramMap.get("searchKeyword"));
		}
//		E 검색조건 선택
		
//		map으로 받은 boardCategory get으로 가져와서  model에 주입
		model.addAttribute("boardCategory", paramMap.get("boardCategory"));
		
		
//		sh 예시
//		UserVO userVO = new UserVO();
//		userVO.setUserId("sh");
//		model.addAttribute("user", userVO);
		
		
		if(paramMap.get("boardCategory")=="R") {
		return "/WEB-INF/views/board/readRecBoardList";
		} else {
			System.out.println("paramMap============================"+paramMap.get("boardCategory"));
			return "/WEB-INF/views/board/readBoardList";
		}
	}
	
	//////////////////////////////recboardList.do 임시
	@RequestMapping("/readRecBoardList.do")
	public String readRecBoardListView(HttpSession session, Model model,
			@RequestParam Map<String, String> paramMap, Criteria cri) {
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		
		if(loginUser == null) {
			return "/WEB-INF/views/user/login";
		}
		
		List<BoardVO> boardList = boardService.getBoardList(paramMap, cri);
		
		int total = boardService.getBoardCnt(paramMap);
		
		//게시물 정보 출력
		for(int i=0; i < boardList.size(); i++) {
			System.out.println("보드리스트= " +boardList.get(i).toString());
		}
		model.addAttribute("boardList", boardList);
		model.addAttribute("pageMaker", new PageVO(cri, total));
		
		
//		S 검색조건 선택했을 때 사용
		if(paramMap.get("searchCondition") != null && !paramMap.get("searchCondition").equals("")) {
			System.out.println("searchCondition================" + paramMap.get("searchCondition"));
			model.addAttribute("searchCondition", paramMap.get("searchCondition"));
		}
		
		if(paramMap.get("searchKeyword") != null && !paramMap.get("searchKeyword").equals("")) {
			model.addAttribute("searchKeyword", paramMap.get("searchKeyword"));
		}
//		E 검색조건 선택
		
		model.addAttribute("boardCategory", paramMap.get("boardCategory"));
		
		return "WEB-INF/views/board/readRecBoardList";
	}
	
	
	//북마크 페이지 이동
	@RequestMapping("/bookmark.do")
	public String bookmarkView() {
		return "WEB-INF/views/board/bookmark";
	}
	
//	readBoard (게시글 상세 조회)
//		* 서비스에서 구현할 내용: 
//			* 댓글 목록 조회
//			* 좋아요 카운트 조회
	
	//여기부터 게시글 상세보기 getboard.do
	@RequestMapping("/readBoard.do")
	public String getBoard(HttpSession session, BoardVO boardVO, Model model,
			HttpServletRequest request) {
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		
		if(loginUser == null) {
			return "/WEB-INF/views/user/login";
		}
		
		//게시물 클릭하면 조회수+1
		//이것도 업데이트 해야됨. 지금은 새로고침 할때마다 카운트가 올라가는데
		boardService.updateBoardCnt(boardVO);
		
		BoardVO board = boardService.getBoard(boardVO);
		List<BoardFileVO> fileList = boardService.getBoardFileList(boardVO);
		
		//request.setAttribute == model
		//session, request, model, applicationcontext, jsp // 이것들에 담긴 건 EL표기법으로 사용 가능
		model.addAttribute("board", board);
		model.addAttribute("fileList", fileList);
		
		
		return "/WEB-INF/views/board/readBoard";
	}
	
//	createBoard (게시글 등록)
//		* 게시판 유형(1,2,3)에 따른 동적 쿼리' -> header.jsp에서 쿼리스트링으로 게시판 유형 구분해서 작동하도록 함 
	
	@RequestMapping(value="/createBoard.do", method=RequestMethod.GET)
	public String createFBoardView(@RequestParam("boardCategory") String boardCategory, Model model) {
		
//		boardService.createBoard(boardVO)
		model.addAttribute("boardCategory", boardCategory);
		if(boardCategory=="R") {
			return "WEB-INF/views/board/createRecBoard";
		}  else {
			return "/WEB-INF/views/board/createBoard";
		}
	}
	
	@RequestMapping(value="/createBoard.do", method=RequestMethod.POST, produces="text/html; charset=UTF-8")
	public String createBoard(HttpSession session, BoardVO boardVO, HttpServletRequest request,
			MultipartHttpServletRequest multipartServletRequest) throws IOException {
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		System.out.println("boardVO============================" + boardVO.toString());
		if(loginUser == null) {
			return "/WEB-INF/views/user/login";
		}
		
		int boardSeq = boardService.createNextBoardSeq(boardVO.getBoardCategory());
		
		FileUtils fileUtils = new FileUtils();
		
//		파일업로드 처리 및 속성 값들이 세팅된 BoardFileVO의 목록 리턴
		List<Map<String, Object>> fileList = fileUtils.parseFileInfo(boardSeq, request, multipartServletRequest);
//		List<MultipartFile> fileList = fileUtils.parseFileInfo(boardSeq, request, multipartServletRequest);
//		imgList = BoardFileVO 객체를 담는 리스트(BoardFileVO타입) / BoardFileVO = 파일 객체
		List<BoardFileVO> imgList = new ArrayList<BoardFileVO>();
		
		boardVO.setBoardSeq(boardSeq);
		
		if(!CollectionUtils.isEmpty(fileList)) {
//			boardService.createBoardFile(fileList);
			//자랑 게시판에서는 파일을 하나만 첨부할 것이기 때문에 fileList.get(0)으로 첫번째 것만 가져온다.
			if(boardVO.getBoardCategory().equals("S")) {
				
				boardVO.setBoardMfile(fileList.get(0).get("fileName").toString());
				boardVO.setOriginalFileName(fileList.get(0).get("originalFileName").toString());
				
				boardService.createBoard(boardVO);
			} else {
				boardService.createBoard(boardVO);
				
				//파일이 있으면(size>0) 파일을 추가해서 보내기
				if(fileList.size() > 0) {
					//1. List<Map>>
					//boardService.createBoardFile(fileList);
					
					//2. VO
					for(int i = 0; i < fileList.size(); i++) {
						BoardFileVO boardFile = new BoardFileVO();
//						Seq, 카테고리, '파일'(fileList)
						boardFile.setBoardSeq(boardSeq);
						boardFile.setBoardCategory(boardVO.getBoardCategory());
						boardFile.setImgFile(fileList.get(i).get("fileName").toString());
						boardFile.setImgOriginFile(fileList.get(i).get("originalFileName").toString());
						
						imgList.add(boardFile);
					}
					
					boardService.createBoardFile(imgList);
				}
			}
		} else {
			boardService.createBoard(boardVO);
		}
		
		return "redirect:/board/readBoardList.do?boardCategory="+boardVO.getBoardCategory();
//		return "redirect:/board/readBoard.do?boardCategory="+boardVO.getBoardCategory();
	}
	
//	updateBoard (게시글 수정)
	@RequestMapping("/updateBoard.do")
	public String updateBoard(BoardVO boardVO, HttpServletRequest request,
			MultipartHttpServletRequest multipartServletRequest, Model model ) throws IOException {
//		FileUtils fileUtils = new FileUtils();
		int boardSeq = boardVO.getBoardSeq();
		
//		List<BoardFileVO> fileList = fileUtils.parseFileInfo(boardSeq, request, multipartServletRequest);
		
//		if(!CollectionUtils.isEmpty(fileList)) {
//			boardService.insertBoardFile(fileList);
//		}
		model.addAttribute("boardCategory", boardVO.getBoardCategory());
		model.addAttribute("boardSeq", boardVO.getBoardSeq());	
		boardService.updateBoard(boardVO);
		
//		return "redirect:/board/readBoardList.do?boardCategory="+boardVO.getBoardCategory();
//			매개변수에 @RequestParam Map<String, String> paramMap 넣어서 paramMap으로 넣을땐
		return "redirect:/board/readBoard.do";
//		return "redirect:/board/readBoard.do?boardCategory="+boardVO.getBoardCategory()+"&boardSeq="+boardVO.getBoardSeq();
	}
	
//	deleteBoard (게시글 삭제)

	@RequestMapping(value="/deleteBoard.do")
	public String deleteBoard(BoardVO boardVO) {
		boardService.deleteBoard(boardVO.getBoardSeq());
		
		return "redirect:/board/readBoardList.do?boardCategory="+boardVO.getBoardCategory();
	}


	
//	createReply (댓글등록)

	
//	updateReply (댓글수정)

	
//	deleteReply (댓글삭제)

	
//	createBoardLike (좋아요 등록)

	
//	deleteBoardLike (좋아요 삭제)

	
}
