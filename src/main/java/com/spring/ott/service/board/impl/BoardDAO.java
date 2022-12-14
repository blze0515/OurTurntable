package com.spring.ott.service.board.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.ott.Criteria;
import com.spring.ott.vo.BoardFileVO;
import com.spring.ott.vo.BoardVO;

@Repository
public class BoardDAO {

	@Autowired
	SqlSessionTemplate mybatis;
	
	public void createBoard(BoardVO boardVO) {
		System.out.println("---------------------------------------------userId = " + boardVO.getUserId());
		mybatis.insert("BoardDAO.createBoard", boardVO);
	}
	
	public int createNextBoardSeq(String boardCategory) {
		return mybatis.selectOne("BoardDAO.createNextBoardSeq", boardCategory);
	}
	
	public List<BoardVO> getBoardList(Map<String, String> paramMap, Criteria cri) {
		Map<String, Object> pMap = new HashMap<String, Object>();
		pMap.put("boardSearch", paramMap);
		cri.setStartNum((cri.getPageNum() - 1) * cri.getAmount());
		pMap.put("cri", cri);
		
		return mybatis.selectList("BoardDAO.getBoardList", pMap);
	}

	public int getBoardCnt(Map<String, String> paramMap) {
								//BoardDAO=mappings?? namespace
		return mybatis.selectOne("BoardDAO.getBoardCnt", paramMap);
											//getBoardCnt=mapper - select ?±??? id
	}
	
	public BoardVO getBoard(BoardVO boardVO) {
		return mybatis.selectOne("BoardDAO.getBoard", boardVO);
	}
	
	public void updateBoardCnt(BoardVO boardVO) {
		mybatis.update("BoardDAO.updateBoardCnt", boardVO);
	}
	
	public void updateBoard(BoardVO boardVO) {
		mybatis.update("BoardDAO.updateBoard", boardVO);
	}
	
	public void deleteBoard(int boardSeq) {
//		BoardFileVO boardFileVO = new BoardFileVO();
//		boardFileVO.setBoardSeq(boardSeq);
		
//		mybatis.delete("BoardDAO.deleteBoardFile", boardFileVO);
		
		mybatis.delete("BoardDAO.deleteBoard", boardSeq);
		
		mybatis.update("BoardDAO.updateBoardSeq", boardSeq);
	}
//	
//	public int getBoardCnt(Map<String, String> paramMap) {
//		return mybatis.selectOne("BoardDAO.getBoardCnt", paramMap);
//	}

	
	public void createBoardFile(List<BoardFileVO> imgList) {
		//List?? insert?ϴ? ????
		//1. for???? ?????Ͽ? list.size??ŭ insert???? ȣ??
		/*
		 * for(BoardFileVO boardFile : fileList) {
		 * mybatis.insert("BoardDAO.insertBoardFile", boardFile); }
		 */
		
		//2. mybatis?? <foreach> ?±? ????
		mybatis.insert("BoardDAO.createBoardFile", imgList);
	}

	//selectList ?˻?
	public List<BoardFileVO> getBoardFileList(BoardVO boardVO) {
		return mybatis.selectList("BoardDAO.getBoardFileList", boardVO);
	}
}
