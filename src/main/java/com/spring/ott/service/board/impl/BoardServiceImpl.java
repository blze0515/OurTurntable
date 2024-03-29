package com.spring.ott.service.board.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ott.Criteria;
import com.spring.ott.service.board.BoardService;
import com.spring.ott.vo.BoardFileVO;
import com.spring.ott.vo.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoardDAO boardDAO;
	
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
	public BoardVO getBoard(BoardVO boardVO) {
		return boardDAO.getBoard(boardVO);
	}

	@Override
	public void updateBoardCnt(BoardVO boardVO) {
		boardDAO.updateBoardCnt(boardVO);
		
	}

	@Override
	public void updateBoard(BoardVO boardVO) {
		boardDAO.updateBoard(boardVO);
		
	}

	@Override
	public void deleteBoard(int boardSeq) {
		boardDAO.deleteBoard(boardSeq);
		
	}

	
	@Override 
	public int createNextBoardSeq(String boardCategory) {
		return boardDAO.createNextBoardSeq(boardCategory);
	}

	@Override
	public void createBoardFile(List<BoardFileVO> imgList) {
		boardDAO.createBoardFile(imgList);	
	}

	@Override
	public List<BoardFileVO> getBoardFileList(BoardVO boardVO) {
		// TODO Auto-generated method stub
		return boardDAO.getBoardFileList(boardVO);
	}

	@Override
	public void deleteBoardFile(BoardFileVO boardFileVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertBoardLike(Map<String, String> likeMap) {
		boardDAO.insertBoardLike(likeMap);
		
	}

	@Override
	public int likeCheck(BoardVO boardVO, String userId) {
		Map<String, String> likeCheckMap = new HashMap<String, String>();
		likeCheckMap.put("boardSeq", String.valueOf(boardVO.getBoardSeq()));
		likeCheckMap.put("boardCategory", boardVO.getBoardCategory());
		likeCheckMap.put("loginUser", userId);
		//DAO에서 int를 리턴하는 함수를 만들어서 리턴문에 넣어야함
		
		
		return boardDAO.likeCheck(likeCheckMap);
	}

	@Override
	public int boardLikeCnt(BoardVO boardVO) {
		// TODO Auto-generated method stub
		return boardDAO.boardLikeCnt(boardVO);
	}

	@Override
	public void deleteBoardLike(Map<String, String> likeMap) {
		boardDAO.deleteBoardLike(likeMap);
	}

	@Override
	public List<BoardVO> getMyLikeList(Map<String, String> paramMap, Criteria cri, String userId) {
		// TODO Auto-generated method stub
		return boardDAO.getMyLikeList(paramMap, cri, userId);
	}




	
}
