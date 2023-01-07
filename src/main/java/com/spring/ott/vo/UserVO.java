package com.spring.ott.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class UserVO {
	private String userId;
	private String userName;
	private String userNickname;
	private String userEmail;
	private String userTel;
	private String userAddress;
	private String userZipcode;
	private Date userRgstdate;
	private Date userMdfdate;
	private String userActiveyn;
	private String userRole;
	private String userPw;
	private String userProfileImg;
	
	//좋아요 기능 목적으로 userVO, boardVO에 요소 추가하고 DB에 collumn 추가 
	private int userLikeBoardSeq;

	/*
		userRole
		c : 일반회원
		v : 프리미엄 회원
		a : 관리자
	 */
	
	
}
