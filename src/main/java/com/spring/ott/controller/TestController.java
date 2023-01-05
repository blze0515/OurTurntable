package com.spring.ott.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.ott.service.test.TestService;

@Controller
@RequestMapping("/test")
public class TestController {

	@Autowired
	TestService testService;
	
	@GetMapping("/readTest.do")
	public String readTestView() {
		return "/WEB-INF/views/readTest";
	}
	
}
