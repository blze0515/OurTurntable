package com.spring.ott.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardVO {
	private int rownum;
	private int boardSeq;
	//boardCategory�� header���� �Խ��� �޴� �����Ҷ� ������Ʈ������ �����ȴ�.
	private String boardCategory;
	private String userId;
	private String boardTitle;
	private String boardContent;
	private Date boardRgstdate;
	private Date boardMdfdate;
	private int boardViewcount;
	private String boardMfile;
	//���̺��� OriginalFileName �÷� �߰� �ϰ� ���뵵 �� ��.('22.11.20)
	private String originalFileName;
	
	private String boardRshopname;
	private String boardRshopaddress;
	private String boardRshopurl;
	
	private String boardSyoutubelink;
	private char boardSuploadyn;
	

	
}