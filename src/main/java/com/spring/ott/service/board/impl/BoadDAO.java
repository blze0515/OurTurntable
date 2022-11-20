package com.spring.ott.service.board.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.spring.ott.Criteria;
import com.spring.ott.VO.BoardVO;

@Repository
public class BoadDAO {

	@Autowired
	SqlSessionTemplate mybatis;
	
	public void createBoard(BoardVO boardVO) {
		System.out.println("---------------------------------------------userId = " + boardVO.getUserId());
		mybatis.insert("BoardDAO.createBoard", boardVO);
	}
	
	public int createNextBoardSeq() {
		return mybatis.selectOne("BoardDAO.createNextBoardSeq");
	}
	
	public List<BoardVO> getBoardList(Map<String, String> paramMap, Criteria cri) {
		Map<String, Object> pMap = new HashMap<String, Object>();
		pMap.put("boardSearch", paramMap);
		cri.setStartNum((cri.getPageNum() - 1) * cri.getAmount());
		pMap.put("cri", cri);
		
		return mybatis.selectList("BoardDAO.getBoardList", pMap);
	}

	public int getBoardCnt(Map<String, String> paramMap) {
								//BoardDAO=mapper의 namespace
		return mybatis.selectOne("BoardDAO.getBoardCnt", paramMap);
											//getBoardCnt=mapper - select 태그의 id
	}
	
	public BoardVO getBoard(int boardSeq) {
		return mybatis.selectOne("BoardDAO.getBoard", boardSeq);
	}
	
	public void updateBoardCnt(int boardSeq) {
		mybatis.update("BoardDAO.updateBoardCnt", boardSeq);
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

	
	public void createBoardFile(List<MultipartFile> fileList) {
		//List를 insert하는 방법
		//1. for문을 사용하여 list.size만큼 insert구문 호출
		/*
		 * for(BoardFileVO boardFile : fileList) {
		 * mybatis.insert("BoardDAO.insertBoardFile", boardFile); }
		 */
		
		//2. mybatis의 <foreach> 태그 사용
		mybatis.insert("BoardDAO.createBoardFile", fileList);
	}

	
}
