package com.spring.ott.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.ott.service.user.UserService;
import com.spring.ott.vo.UserVO;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	UserService userService;
	
	
	@GetMapping("/createUser.do")
	public String createUserView() {
		return "/WEB-INF/views/user/createUser";
	}
	
//	createUser ( ?? ????  ??)
	@PostMapping("/createUser.do")
	public String createUser(UserVO userVO) {
		
		//ȸ?????? ?????? ?Ѿ????? ?ʾ??? ???? ȸ?????? ȭ??????
		//if(userVO.getUserId() == null || userVO.getUserId().equals("")) {
			//return "/WEB-INF/views/user/createUser";
		//} else {
			//ȸ?????? ?????? ?Ѿ????? ???? ȸ?????? ó?? ?? ?α??? ȭ??????
			userService.createUser(userVO);
			System.out.println("ȸ?????? ???? " + userVO.toString());
			return "/WEB-INF/views/user/login";
		//}
	}
	
	
//	login(readUser)
	
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public String loginView() {
		return "/WEB-INF/views/user/login";
	}
	
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	@ResponseBody
	public String login(HttpSession session, UserVO userVO) throws JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		//1. ?????ϴ? ???̵????? üũ
		
		int idCheck = userService.idCheck(userVO.getUserId());
		
		if(idCheck < 1) {
			jsonMap.put("message", "idFail");
		} else {
			//2. ?н????? Ȯ??
			int pwCheck = userService.pwCheck(userVO);
			
			if(pwCheck < 1) {
				jsonMap.put("message", "pwFail");
			} else {
				//3. ?α??? ó??
//				login(userVO)???? ?α????? id,pwȮ???ϰ? UserVO(*) ????.
				UserVO user = userService.login(userVO);
//Ű?? ???? ?̷??? ???? ?? session ?ȿ? ?? ?? ???? ?????ִ??? ?˰? ???????
//				System.out.println("Ȩ?????? ???? ?? session : " + session);

				
				//?α??? ?????? ?????? ?ҷ??ͼ? session?? ???´?.(?????? ?⺻ 30?? ????)
				session.setAttribute("loginUser", user);
//				System.out.println("?α??? ???? session : " + session.getAttribute("loginUser"));
				
				jsonMap.put("message", "loginSuccess");
			}
		}
		System.out.println("jsonMap ???? ?ʱ?(login ??) : " + jsonMap.toString());

//jsonStr?? jsonMap?? Object -> String Ÿ?????? ?ٲٷ??? ???? ??. ?????? String ???·?.
		String jsonStr = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(jsonMap);
		
		System.out.println("jsonStr ============ : " + jsonStr);
		
		return jsonStr;
	}
	
	@RequestMapping("/idCheck.do")
	//ȸ?????? ?? id ?ߺ?Ȯ?? ????
	//ViewResolver?? Ÿ?? ?Ǹ? ResponseBody?? HTML ?????? ????? ȭ???? ????
	//ViewResolver?? ???¿??? ??ȯ ?? ??ü?? ResponseBody?? ???????? @ResponseBody ????
	@ResponseBody
	public String idCheck(UserVO userVO) throws JsonProcessingException {
		//Json ??ü?? ??ȯ???ִ? Ŭ???? ObjectMapper
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int resultIdCheck = userService.idCheck(userVO.getUserId());
		
		jsonMap.put("resultIdCheck", resultIdCheck);
		
		String json = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(jsonMap);
		
		System.out.println("jsonString======================" + json);
		
		return json;
	}
	
	@PostMapping("/logout.do")
	public String logout(HttpSession session) {
		//???ǳ??? ?????Ǿ? ?ִ? ???????? ?ʱ?ȭ
		session.invalidate();
		
		return "redirect:/index.jsp";
	}
	
	@GetMapping("/updatePw.do")
	public String updatePwView() {
		return "/WEB-INF/views/user/updatePw";
	}
	
	@PostMapping("updatePw.do")
	public String updatePw() {
		return "";
	}
	
	
	
//	createSession (로그 ??)
	
	
//	deleteSession (로그 ?? ??)
	
	
//	readUserIdCheck ( ?? ?? ?? 중복체크)

	
//	createFollow ( ??로우)
	
	
//	createBlock (차단)
	
	
//	deleteFollow ( ??로우  ?? ??)
	
	
//	deleteBlock (차단  ?? ??)
	


}
