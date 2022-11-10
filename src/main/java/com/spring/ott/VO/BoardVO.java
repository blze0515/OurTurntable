package com.spring.ott.VO;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardVO {
	private int boardSeq;
	private char boardCategory;
	private String userId;
	private String boardTitle;
	private String boardContent;
	private Date boardRgstdate;
	private Date boardMdfdate;
	private int boardViewcount;
	private String boardMfile;
	private String boardRshopname;
	private String boardRshopaddress;
	private String boardRshopurl;
	private String boardSyoutubelink;
	private char boardSuploadyn;
	

	
}
