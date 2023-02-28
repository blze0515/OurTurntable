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
	
//	createUser ( �� ���  ��)
	@PostMapping("/createUser.do")
	public String createUser(UserVO userVO) {
		
		//ȸ������ ������ �Ѿ���� �ʾ��� ���� ȸ������ ȭ������
		//if(userVO.getUserId() == null || userVO.getUserId().equals("")) {
			//return "/WEB-INF/views/user/createUser";
		//} else {
			//ȸ������ ������ �Ѿ���� ���� ȸ������ ó�� �� �α��� ȭ������
			userService.createUser(userVO);
			System.out.println("ȸ������ ���� " + userVO.toString());
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
		//1. �����ϴ� ���̵����� üũ
		System.out.println("id = "+userVO.getUserId() + ", pw = " + userVO.getUserPw());
		
		int idCheck = userService.idCheck(userVO.getUserId());
		
		if(idCheck < 1) {
			jsonMap.put("message", "idFail");
		} else {
			//2. �н����� Ȯ��
			int pwCheck = userService.pwCheck(userVO);
			
			if(pwCheck < 1) {
				jsonMap.put("message", "pwFail");
			} else {
				//3. �α��� ó��
//				login(userVO)���� �α����� id,pwȮ���ϰ� UserVO(*) ����.
				UserVO user = userService.login(userVO);
//Ű�� ���� �̷��� �� �� session �ȿ� �� �� ���� ����ִ��� �˰� ������? (Map�� ��� keySet()�̳� values()�޼ҵ�� Ȯ�� ����.

				
				//�α��� ������ ������ �ҷ��ͼ� session�� ��´�.(������ �⺻ 30�� ����)
				session.setAttribute("loginUser", user);
//				System.out.println("�α��� ���� session : " + session.getAttribute("loginUser"));
				
				jsonMap.put("message", "loginSuccess");
			}
		}
		System.out.println("jsonMap ���� �ʱ�(login ��) : " + jsonMap.toString());

//jsonStr�� jsonMap�� Object -> String Ÿ������ �ٲٷ��� ���� ��. ������ String ���·�.
		String jsonStr = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(jsonMap);
		
		System.out.println("jsonStr ============ : " + jsonStr);
		
		return jsonStr;
	}
	
	@RequestMapping("/idCheck.do")
	//ȸ������ �� id �ߺ�Ȯ�� ���
	//ViewResolver�� Ÿ�� �Ǹ� ResponseBody�� HTML ������ ���� ȭ���� ����
	//ViewResolver�� ���¿�� ��ȯ �� ��ü�� ResponseBody�� ������� @ResponseBody ���
	@ResponseBody
	public String idCheck(UserVO userVO) throws JsonProcessingException {
		//Json ��ü�� ��ȯ���ִ� Ŭ���� ObjectMapper
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
		//���ǳ��� ����Ǿ� �ִ� ������� �ʱ�ȭ
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
	
	//���� �����ϱ� ���� ��й�ȣ Ȯ��
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
		//1. idȮ��
		int idCheck = userService.idCheck(userVO.getUserId());
		if(idCheck<0) {
			jsonMap.put("message", "idFail");
		} else {
			//2. �н����� Ȯ��
			//pwCheck()�޼ҵ�� userId�� userPw�� T_OTT_USER���� count�� int ���� �����Ѵ�.
			int pwCheck = userService.pwCheck(userVO);
			
			//�ش� ������ pw�� Ȯ���� ���� ��(count)�� 1���� ������(������) jsonMap�� "pwFail"�� "message"�� ��´�.
			if(pwCheck < 1) {
				jsonMap.put("message", "pwFail");
			} else {
				//3. ��й�ȣ Ȯ�� ����ϸ� updateUserCheck.jsp���� ajax�� ���� �����ϴ� �������� �̵�
				//   ��й�ȣ�� ��ġ�ϸ� 
				jsonMap.put("message", "updateCheck Success");
			}
		}
		

//		jsonStr�� jsonMap�� Object -> String Ÿ������ �ٲٷ��� ���� ��. ������ String ���·�.
		String jsonStr = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(jsonMap);
		System.out.println("jsonStr = "+jsonStr.toString());
		
		return jsonStr;
	}
	
	//��й�ȣ Ȯ�� �� ���� �����ϴ� ȭ������ �̵�
	@GetMapping("/updateUser")
	public String updateUserView() {
		return "WEB-INF/views/user/updateUser";
	}
	//���� �����ϴ� ȭ������ �̵�
	@PostMapping("/updateUser.do")
	public String updateUser(HttpSession session, UserVO userVO) {
		
		userService.updateUser(userVO);
		System.out.println("updateUser.do ======="+userVO);
		
		
		//Ű�� ���� �̷��� �� �� session �ȿ� �� �� ���� ����ִ��� �˰� ������? (Map�� ��� keySet()�̳� values()�޼ҵ�� Ȯ�� ����.

						
						//�α��� ������ ������ �ҷ��ͼ� session�� ��´�.(������ �⺻ 30�� ����)
						
		
//		session.invalidate(); �� �α׾ƿ� ��Ű�� �ٽ� �α����ϸ鼭 ������� session�� �ݿ�����, ���� ������ ������ session�� set���� ���� ������ ������.
//		session.invalidate();
		UserVO user = userService.login(userVO);	
		session.setAttribute("loginUser", user);
		//�ٽ� �α����ؾ� �Ǵ� ���� �߻�
		
		return "redirect:/mypage/readMypage.do";
	}
}
