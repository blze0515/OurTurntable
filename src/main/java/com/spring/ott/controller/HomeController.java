package com.spring.ott.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	@RequestMapping("/")
	public String home() {
		System.out.println("111111111111111111111111111111111");
		return "redirect:/main/main.do";
	}
}
