package com.spring.ott.VO;

import lombok.Data;

@Data
public class BoardFileVO {
	private int boardSeq;
	private int imgSeq;
	private String boardCategory;
	private String imgFile;
	private String imgOriginFile;

}
