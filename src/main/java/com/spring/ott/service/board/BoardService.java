package com.spring.ott.service.board;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.spring.ott.Criteria;
import com.spring.ott.VO.BoardFileVO;
import com.spring.ott.VO.BoardVO;

public interface BoardService {
	
	void createBoard(BoardVO boardVO);

	List<BoardVO> getBoardList(Map<String, String> paramMap, Criteria cri);
	
	BoardVO getBoard(int boardSeq);
	
	void updateBoardCnt(int boardSeq);
	
	void updateBoard(BoardVO boardVO);
	
	void deleteBoard(int boardSeq);
	
	/* List<BoardVO> getBoardListSearch(Map<String, String> paramMap); */
	
	int getBoardCnt(Map<String, String> paramMap);
	
	int createNextBoardSeq();
	
	void createBoardFile(List<BoardFileVO> imgList);
	
	List<BoardFileVO> getBoardFile(int boardSeq);
	
	void deleteBoardFile(BoardFileVO boardFileVO);


	
}
