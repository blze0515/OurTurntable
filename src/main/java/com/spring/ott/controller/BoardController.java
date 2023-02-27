//11.28 기준 BoardController.java 백업

package com.spring.ott.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
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
//		System.out.println("받아온 파람맵 = = = = == = == = == "+paramMap);
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
			//System.out.println(paramMap.get("boardCategory"));
		if(loginUser == null) {
			return "/WEB-INF/views/user/login";
		}
		
		//카테고리 R일때는 9개 가져오고 나머지는 10개 가져와서 게시판 리스트에 표출
		if(paramMap.get("boardCategory").equals("R")) {
			cri.setAmount(9);
		} else {
			cri.setAmount(10);
		}
		
		List<BoardVO> boardList = boardService.getBoardList(paramMap, cri);
		
		//좋아요 눌렀는지 여부로 만든 리스트
		//List<BoardVO> myLikeList = boardService.getMyLikeList(paramMap, cri); 

		
		
		
		
		//total = 작성돼있는 총 게시물 수 가져오는 변수
		//getboardCnt에도 쿼리에 카테고리에 대한 조건을 줘야 해당 카테고리에 대한 글 개수를 표시할 수 있다.
		int total = boardService.getBoardCnt(paramMap);
		
		
		//게시물 정보 출력
		for(int i=0; i < boardList.size(); i++) {
//		System.out.println("보드리스트= " +boardList.get(i).toString());
		}
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("pageMaker", new PageVO(cri, total));
		
		
		
//		검색조건 선택했을 때 사용
		if(paramMap.get("searchCondition") != null && !paramMap.get("searchCondition").equals("")) {
//			System.out.println("searchCondition================" + paramMap.get("searchCondition"));
			model.addAttribute("searchCondition", paramMap.get("searchCondition"));
		}
		
		if(paramMap.get("searchKeyword") != null && !paramMap.get("searchKeyword").equals("")) {
			model.addAttribute("searchKeyword", paramMap.get("searchKeyword"));
		}
		
//		map으로 받은 boardCategory get으로 가져와서  model에 주입
		model.addAttribute("boardCategory", paramMap.get("boardCategory"));
		
		//좋아요 표시한 게시글 모음 페이지
		
		
		
//		sh 예시
//		UserVO userVO = new UserVO();
//		userVO.setUserId("sh");
//		model.addAttribute("user", userVO);
		
		
		if("R".equals(paramMap.get("boardCategory"))) {
		return "/WEB-INF/views/board/readRecBoardList";
		} else {
//			System.out.println("paramMap============================"+paramMap.get("boardCategory"));
//			System.out.println("paramMap============================"+paramMap.toString());
			return "/WEB-INF/views/board/readBoardList";
		}
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
		
		//좋아요 기능
		int likeCnt = boardService.likeCheck(boardVO, loginUser.getUserId());
		int boardLikeCnt = boardService.boardLikeCnt(boardVO);
		
		board.setBoardLikeCount(boardLikeCnt);  //좋아요 총 개수 카운트
		System.out.println(likeCnt);
		//request.setAttribute == model
		//session, request, model, applicationcontext, jsp // 이것들에 담긴 건 EL표기법으로 사용 가능
		model.addAttribute("board", board);
		model.addAttribute("fileList", fileList);
		model.addAttribute("likeCnt", likeCnt);
//		model.addAttribute("loginUser", loginUser); loginUser 세션에 있어서 model에 넣을 필요 없음(01.07)
		
		
		if(boardVO.getBoardCategory().equals("R")) {
			return "WEB-INF/views/board/readRecBoard";
		} else {
			return "/WEB-INF/views/board/readBoard";
		}
		
	}

//	createBoard (게시글 등록)
//		* 게시판 유형(1,2,3)에 따른 동적 쿼리' -> header.jsp에서 쿼리스트링으로 게시판 유형 구분해서 작동하도록 함 z
	@RequestMapping(value="/createBoard.do", method=RequestMethod.GET)
	public String createBoardView(HttpSession session, @RequestParam("boardCategory") String boardCategory, Model model) {

//		boardService.createBoard(boardVO)
		model.addAttribute("boardCategory", boardCategory);
		if("R".equals(boardCategory)) {
			return "WEB-INF/views/board/createRecBoard";
		}  else {
			return "/WEB-INF/views/board/createBoard";
		}
	}
	
	@RequestMapping(value="/createBoard.do", method=RequestMethod.POST, produces="text/html; charset=UTF-8")
	public String createBoard(HttpSession session, BoardVO boardVO, HttpServletRequest request,
			MultipartHttpServletRequest multipartServletRequest) throws IOException {
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
//		System.out.println("boardVO============================" + boardVO.toString());
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
		
		if(boardVO.getBoardCategory().equals("R")) {
			return "redirect:/board/readBoardList.do?boardCategory="+boardVO.getBoardCategory();
		} else {
		return "redirect:/board/readBoardList.do?boardCategory="+boardVO.getBoardCategory();
//		return "redirect:/board/readBoard.do?boardCategory="+boardVO.getBoardCategory();
		}
		 
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
		if(boardVO.getBoardCategory().equals("R")) {
			return "redirect:/board/readBoardList.do";
		} else {
		return "redirect:/board/readBoard.do";
		}
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
	@ResponseBody
	@RequestMapping("/insertBoardLike.do")
	public String insertBoardLike(@RequestParam Map<String, String> likeMap) throws JsonProcessingException {
		System.out.println("likeMap.toString()111 = "+likeMap.toString());
		
		boardService.insertBoardLike(likeMap);
		
		BoardVO boardVO = new BoardVO();
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		boardVO.setBoardCategory(likeMap.get("boardCategory"));
		boardVO.setBoardSeq(Integer.parseInt(likeMap.get("boardSeq")));
		
		int likeYn = boardService.likeCheck(boardVO, likeMap.get("loginUser"));
		int boardLikeCnt = boardService.boardLikeCnt(boardVO);
		
		jsonMap.put("likeYn", likeYn);
		jsonMap.put("boardLikeCnt", boardLikeCnt);
		jsonMap.put("likeMap", likeMap);
		
		String json = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(jsonMap);  //Object -> json 문자(writeValueAsString())
		
		return json;
	}
		/*  좋아요 기능 작동 구조에 대한 메모
//		return "redirect:/board/readBoard";
 		
 		redirect를 할거면 ajax를 쓰는 의미가 없다. 화면 새로고침 안되는 방식으로 처리해야 한다.
 		사용할 방법은 ajax에서 보낸 데이터를 받아서 기능을 처리한 후에
 		바뀐 좋아요에 대한 정보를 다시 ajax의 success부분으로 보내준 다음
 		ajax 처리부분에서 화면에 보이는 부분을 메소드를 사용해서 변경해주는 작업을 해서 완료한다.
 		그렇게 하려면
 		1. Controller에서 받은 요청을 기능적으로 처리한다.
 		2. ajax로 보낸 data를 이용해서 처리된 후의 data를 다시 jsp(화면)로 보낸다(ajax의 success부분에서 쓸 자료)
 			- 자료를 주고 받는 방법은 JSON 객체를 이용하는 것이 편하다
 			- 그럴려면 JSON 객체를 생성해야 하고, 그 객체에 boardSeq, boardCategory, userId 정보를 담아서 보내면 된다.
 			- JSON객체는 이름이 긴 메소드를 사용해서 만든다. deleteBoardLike()에서 사용한 아래의 메소드 참고
 				String json = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(jsonMap);
			- json 객체에 담길 데이터는 맵으로 담는다. 맵에 해당 게시물의 카테고리, Seq, 로그인유저의 로그인 정보를 담아서 보낸다.
			- 담는 방법은 put메소드 사용.
				- deleteBoardLike()를 보면 Map은 String타입으로 만들었다. boardSeq는 int타입이기 때문에 Integer.parseInt()로 변환해줘야 한다.
			- json객체에 jsp에서 필요한 데이터를 다 담았다면 메소드를 종료한다. return json; (화면에 대한 처리를 하지 않고 json객체를 return한다.)
			- json객체를 받은 ajax의 success부분에서는 JSON을 객체형태로 다시 변환해준다.(왜였지?) 
	            	//JSON.parse() : JSON 문자열을 JavaScript 객체로 바꿔준다.
	            	//JSON.stringify() : JavaScript객체를 JSON문자열로 바꿔준다.
        	- 
		
		*/
		
	
	@ResponseBody
	@RequestMapping("/deleteBoardLike.do")
	public String deleteBoardLike(@RequestParam Map<String, String> likeMap) throws JsonProcessingException {  //likeMap에 화면에서 보낸 data 있다
		System.out.println(likeMap.toString());
		
//		BoardVO board = BoardVO.builder()    //이런것도 있음.. 
//							   .boardSeq(1)
//							   .boardCategory("F")
//							   .build();
		
		BoardVO boardVO = new BoardVO();  //값이 0, null로 초기화 된 객체
		ObjectMapper mapper = new ObjectMapper();  //ObjectMapper 클래스에서 제공하는 메소드를 사용하기 위해 객체 생성.(return 데이터를 JSON으로 변환하기 위해서)
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		boardVO.setBoardCategory(likeMap.get("boardCategory")); //화면에서 보낸 Category Key로 사용하는거고
		boardVO.setBoardSeq(Integer.parseInt(likeMap.get("boardSeq")));  //boardSeq는 int라서 변환해야함.
		
		//01.29 ajax쓸때 json으로 변환하고 return json으로 받아서 화면 ajax success부분으로 돌려줘서 화면 리로드 말고 해당 부분만 수정되게 만들어야 한다.
		boardService.deleteBoardLike(likeMap);
		
		int likeYn = boardService.likeCheck(boardVO, likeMap.get("loginUser")); //아이디 넣음
		int boardLikeCnt = boardService.boardLikeCnt(boardVO);
		
		//메소드 실행(좋아요 취소)된 후의 정보를 다시 Map에 담는다.(ajax success 부분으로 돌려줄 데이터 생성)
		jsonMap.put("likeYn", likeYn);  //유저가 좋아요 눌렀는지 여부
		jsonMap.put("boardLikeCnt", boardLikeCnt);  //게시글에 눌러진 좋아요 개수 카운트
		jsonMap.put("likeMap", likeMap);  //boardSeq, Category, 로그인유저 정보 담긴 매개변수

		
		//writeValueAsString()메소드는 ObjectMapper 클래스의 메소드이고 매개변수에 있는 객체를 JSON형태로 변환
		String json = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(jsonMap);  
		
		return json;
	}
	
	
//	deleteBoardLike (좋아요 삭제)
	
	@RequestMapping("/myLikeList.do")
	public String myLike(HttpSession session, Model model,
			Map<String, String> likeParam, Criteria cri) {
		
		//로그인 유저 VO
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		
		if(loginUser==null) {
			return "/WEB-INF/views/user/login";
		}
		
//		//추천게시판, 일반게시판 페이지 맞게 표시
//		if(likeParam.get("boardCategory").equals("R")) {
//			cri.setAmount(9);
//		} else {
//			cri.setAmount(10);
//		}
		List<BoardVO> boardList = boardService.getMyLikeList(likeParam, cri, loginUser.getUserId());
		
		model.addAttribute("boardList", boardList);
		
		//총 게시물 개수 가져오는 변수
		int total = boardService.getBoardCnt(likeParam);
		System.out.println("total : "+total);
		System.out.println("Criteria : " + cri.toString());
		System.out.println(likeParam.toString());
		
		return "/WEB-INF/views/board/myLikeList";
	}
	
	
}
