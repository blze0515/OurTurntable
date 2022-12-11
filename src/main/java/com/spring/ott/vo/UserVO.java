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

}
