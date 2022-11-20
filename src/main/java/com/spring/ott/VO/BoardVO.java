package com.spring.ott.VO;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardVO {
	private int boardSeq;
	private String boardCategory;
	private String userId;
	private String boardTitle;
	private String boardContent;
	private Date boardRgstdate;
	private Date boardMdfdate;
	private int boardViewcount;
	private String boardMfile;
	//테이블에 컬럼 추가
	private String originalFileName;
	private String boardRshopname;
	private String boardRshopaddress;
	private String boardRshopurl;
	private String boardSyoutubelink;
	private char boardSuploadyn;
	

	
}
