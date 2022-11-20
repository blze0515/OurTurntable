package com.spring.ott.service.board.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.spring.ott.Criteria;
import com.spring.ott.VO.BoardFileVO;
import com.spring.ott.VO.BoardVO;
import com.spring.ott.service.board.BoardService;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoadDAO boardDAO;
	
	public void createBoard(BoardVO boardVO) {
		boardDAO.createBoard(boardVO);
	}
	
	@Override
									//Map<Key(type지정), value>
	public List<BoardVO> getBoardList(Map<String, String> paramMap, Criteria cri) {
		return boardDAO.getBoardList(paramMap, cri);
	}
	
	@Override
	public int getBoardCnt(Map<String, String> paramMap) {
		// TODO Auto-generated method stub
		return boardDAO.getBoardCnt(paramMap);
	}


	@Override
	public BoardVO getBoard(int boardSeq) {
		return boardDAO.getBoard(boardSeq);
	}

	@Override
	public void updateBoardCnt(int boardSeq) {
		boardDAO.updateBoardCnt(boardSeq);
		
	}

	@Override
	public void updateBoard(BoardVO boardVO) {
		boardDAO.updateBoard(boardVO);
		
	}

	@Override
	public void deleteBoard(int boardSeq) {
		boardDAO.deleteBoard(boardSeq);
		
	}

	
	//@Override (@Override 있으니까 빨간줄 떠서 지움)  
	public int createNextBoardSeq() {
		return boardDAO.createNextBoardSeq();
	}

	@Override
	public void createBoardFile(List<BoardFileVO> imgList) {
		boardDAO.createBoardFile(imgList);	
	}

	@Override
	public List<BoardFileVO> getBoardFile(int boardSeq) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteBoardFile(BoardFileVO boardFileVO) {
		// TODO Auto-generated method stub
		
	}




	
}
