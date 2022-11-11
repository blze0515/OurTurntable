package com.spring.ott.service.board.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ott.Criteria;
import com.spring.ott.VO.BoardFileVO;
import com.spring.ott.VO.BoardVO;
import com.spring.ott.service.board.BoardService;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoadDAO boardDAO;
	
	public void insertBoard(BoardVO boardVO) {
		boardDAO.insertBoard(boardVO);
	}
	
	@Override
									//Map<Key(type����), value>
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
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateBoard(BoardVO boardVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteBoard(int boardSeq) {
		boardDAO.deleteBoard(boardSeq);
		
	}

	
	@Override
	public int getNextBoardSeq() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void insertBoardFile(List<BoardFileVO> fileList) {
		// TODO Auto-generated method stub
		
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
