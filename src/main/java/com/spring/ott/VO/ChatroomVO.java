package com.spring.ott.VO;

import java.sql.Date;

import lombok.Data;

@Data
public class ChatroomVO {
	private int chatroomSeq;
	private String chatroomMember1;
	private String chatroomMember2;
	private Date chatroomCreate;

}
