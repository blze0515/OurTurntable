package com.spring.ott.service.board;

import java.util.List;
import java.util.Map;

import com.spring.ott.Criteria;
import com.spring.ott.vo.BoardFileVO;
import com.spring.ott.vo.BoardVO;

public interface BoardService {
	
	void createBoard(BoardVO boardVO);

	List<BoardVO> getBoardList(Map<String, String> paramMap, Criteria cri);
	
	BoardVO getBoard(BoardVO boardVO);
	
	void updateBoardCnt(BoardVO boardVO);
	
	void updateBoard(BoardVO boardVO);
	
	void deleteBoard(int boardSeq);
	
	/* List<BoardVO> getBoardListSearch(Map<String, String> paramMap); */
	
	int getBoardCnt(Map<String, String> paramMap);
	
	int createNextBoardSeq(String boardCategory);
	
	void createBoardFile(List<BoardFileVO> imgList);
	
	//등록한 파일들을 순서대로 불러오기
	List<BoardFileVO> getBoardFileList(BoardVO boardVO);
	
	void deleteBoardFile(BoardFileVO boardFileVO);
	//좋아요 추가
	void insertBoardLike(Map<String, String> likeMap);

	int likeCheck(BoardVO boardVO, String userId);

	int boardLikeCnt(BoardVO boardVO);
	//좋아요 제거
	void deleteBoardLike(Map<String, String> likeMap);

	List<BoardVO> getMyLikeList(Map<String, String> paramMap, Criteria cri, String userId);


	
}
