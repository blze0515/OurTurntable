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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.ott.service.point.PointService;
import com.spring.ott.service.user.UserService;
import com.spring.ott.vo.UserVO;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	UserService userService;
	
	@Autowired
	PointService pointService;
	
	
	@GetMapping("/createUser.do")
	public String createUserView() {
		return "/WEB-INF/views/user/createUser";
	}
	
//	createUser ( 쉶 썝媛  엯)
	@PostMapping("/createUser.do")
	public String createUser(UserVO userVO) {
		
		//회원가입 정보가 넘어오지 않았을 때는 회원가입 화면으로
		//if(userVO.getUserId() == null || userVO.getUserId().equals("")) {
			//return "/WEB-INF/views/user/createUser";
		//} else {
			//회원가입 정보가 넘어왔을 때는 회원가입 처리 후 로그인 화면으로
			userService.createUser(userVO);
			System.out.println("회원가입 성공 " + userVO.toString());
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
		//1. 존재하는 아이디인지 체크
		System.out.println("id = "+userVO.getUserId() + ", pw = " + userVO.getUserPw());
		
		int idCheck = userService.idCheck(userVO.getUserId());
		
		if(idCheck < 1) {
			jsonMap.put("message", "idFail");
		} else {
			//2. 패스워드 확인
			int pwCheck = userService.pwCheck(userVO);
			
			if(pwCheck < 1) {
				jsonMap.put("message", "pwFail");
			} else {
				//3. 로그인 처리
//				login(userVO)에는 로그인한 id,pw확인하고 UserVO(*) 리턴.
				UserVO user = userService.login(userVO);
//키나 벨류 이런거 모를 때 session 안에 이 때 뭐가 들어있는지 알고 싶으면? (Map의 경우 keySet()이나 values()메소드로 확인 가능.

				
				//로그인 유저의 정보를 불러와서 session에 담는다.(웹에서 기본 30분 유지)
				session.setAttribute("loginUser", user);
//				System.out.println("로그인 직후 session : " + session.getAttribute("loginUser"));
				
				jsonMap.put("message", "loginSuccess");
			}
		}
		System.out.println("jsonMap 생성 초기(login 후) : " + jsonMap.toString());

//jsonStr은 jsonMap을 Object -> String 타입으로 바꾸려고 만든 것. 리턴을 String 형태로.
		String jsonStr = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(jsonMap);
		
		System.out.println("jsonStr ============ : " + jsonStr);
		
		return jsonStr;
	}
	
	@RequestMapping("/idCheck.do")
	//회원가입 시 id 중복확인 기능
	//ViewResolver를 타게 되면 ResponseBody를 HTML 구조로 만들어서 화면을 리턴
	//ViewResolver를 안태우고 반환 값 자체를 ResponseBody로 만들려면 @ResponseBody 사용
	@ResponseBody
	public String idCheck(UserVO userVO) throws JsonProcessingException {
		//Json 객체로 변환해주는 클래스 ObjectMapper
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
		//세션내에 저장되어 있는 내용들을 초기화
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
	
	@GetMapping("deleteUser.do")
	public String deleteUserView() {
		
		return "WEB-INF/views/user/deleteUser";
	}
	
	@PostMapping("deleteUser.do")
	public String deleteUser(HttpSession session) {
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		
		pointService.deletePoint(loginUser.getUserId());
		userService.deleteUser(loginUser);
		
		session.invalidate();
		
		return "/index";
	}
	
	//정보 수정하기 전에 비밀번호 확인
	@GetMapping("/updateUserCheck.do")
	public String updateUserCheckView() {
		return "WEB-INF/views/user/updateUserCheck";
	}
	
	@PostMapping("/updateUserCheck.do")
	@ResponseBody
	public String updateUserCheck(UserVO userVO) throws JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		System.out.println("id = "+userVO.getUserId() + ", pw = " + userVO.getUserPw());
		//1. id확인
		int idCheck = userService.idCheck(userVO.getUserId());
		if(idCheck<0) {
			jsonMap.put("message", "idFail");
		} else {
			//2. 패스워드 확인
			//pwCheck()메소드는 userId와 userPw를 T_OTT_USER에서 count한 int 값을 리턴한다.
			int pwCheck = userService.pwCheck(userVO);
			
			//해당 유저의 pw를 확인한 값의 수(count)가 1보다 작으면(없으면) jsonMap에 "pwFail"을 "message"에 담는다.
			if(pwCheck < 1) {
				jsonMap.put("message", "pwFail");
			} else {
				//3. 비밀번호 확인 통과하면 updateUserCheck.jsp에서 ajax로 정보 수정하는 페이지로 이동
				//   비밀번호가 일치하면 
				jsonMap.put("message", "updateCheck Success");
			}
		}
		

//		jsonStr은 jsonMap을 Object -> String 타입으로 바꾸려고 만든 것. 리턴을 String 형태로.
		String jsonStr = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(jsonMap);
		System.out.println("jsonStr = "+jsonStr.toString());
		
		return jsonStr;
	}
	
	//비밀번호 확인 후 정보 수정하는 화면으로 이동
	@GetMapping("/updateUser")
	public String updateUserView() {
		return "WEB-INF/views/user/updateUser";
	}
	//정보 수정하는 화면으로 이동
	@PostMapping("/updateUser.do")
	public String updateUser(HttpSession session, UserVO userVO) {
		
		userService.updateUser(userVO);
		System.out.println("updateUser.do ======="+userVO);
		
		
		//키나 벨류 이런거 모를 때 session 안에 이 때 뭐가 들어있는지 알고 싶으면? (Map의 경우 keySet()이나 values()메소드로 확인 가능.

						
						//로그인 유저의 정보를 불러와서 session에 담는다.(웹에서 기본 30분 유지)
						
		
//		session.invalidate(); 로 로그아웃 시키고 다시 로그인하면서 변경사항 session에 반영할지, 수정 가능한 값들을 session에 set으로 각각 넣을지 고민중.
//		session.invalidate();
		UserVO user = userService.login(userVO);	
		session.setAttribute("loginUser", user);
		//다시 로그인해야 되는 문제 발생
		
		return "redirect:/mypage/readMypage.do";
	}
}
