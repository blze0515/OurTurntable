package com.spring.ott.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/main")
public class MainController {
	
	@RequestMapping("/about.do")
	public String about() {
		return "services";
	}
}
   