package com.spring.ott.VO;

import java.sql.Date;

import lombok.Data;

@Data
public class UserVO {
	private String userId;
	private String userName;
	private String userNickname;
	private String userEmail;
	private String userTel;
	private String userADDRESS;
	private String userZipcode;
	private Date userRgsdate;
	private Date userMdfdate;
	private String userActiveyn;
	private String userRole;
	private String userPw;
	private String userProfileImg;
	
	private String relationPartner;
	private Date relationDate;
}
