package com.spring.ott.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ChatVO {
	private int chatSeq;
	private int chatroomSeq;
	private String userId;
	private String chatReceiveId;
	private String chatContent;
	private Date chatRgstdate;
	private char chatReadyn;
}
