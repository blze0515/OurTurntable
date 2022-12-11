package com.spring.ott.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardVO {
	private int rownum;
	private int boardSeq;
	//boardCategory는 header에서 게시판 메뉴 선택할때 쿼리스트링으로 지정된다.
	private String boardCategory;
	private String userId;
	private String boardTitle;
	private String boardContent;
	private Date boardRgstdate;
	private Date boardMdfdate;
	private int boardViewcount;
	private String boardMfile;
	//테이블에 OriginalFileName 컬럼 추가 하고 적용도 할 것.('22.11.20)
	private String originalFileName;
	
	private String boardRshopname;
	private String boardRshopaddress;
	private String boardRshopurl;
	
	private String boardSyoutubelink;
	private char boardSuploadyn;
	

	
}
