package com.spring.ott.service.board.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ott.service.board.BoardService;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoadDAO boardDAO;

}
