package com.spring.ott.VO;

import lombok.Data;

@Data
public class BoardFileVO {
	private int boardSeq;
	private int fileSeq;
	private String originalFileName;
	private String fileName;
	private String filePath;
	
	@Override
	public String toString() {
		return "BoardFileVO [boardSeq=" + boardSeq + ", fileSeq=" + fileSeq + ", originalFileName=" + originalFileName
				+ ", fileName=" + fileName + ", filePath=" + filePath + "]";
	}

}
