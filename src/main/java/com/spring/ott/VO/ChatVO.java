package com.spring.ott.VO;

import java.sql.Date;

import lombok.Data;

@Data
public class ChatVO {
	private int chatSeq;
	private int chatroomSeq;
	private String userId;
	private String chatReceiveId;
	private String chatContent;
	private Date chatRgsdate;
	private char chatReadyn;
}
