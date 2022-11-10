package com.spring.ott;

import lombok.Data;

@Data
//현재 보고있는 페이지의 번호, 한 페이지에 표시할 게시물 개수, 페이지 시작 번호를 가지는 객체
public class Criteria {
	private int pageNum;
	private int amount;
	private int startNum;
	
	public Criteria() {
		this(1, 10);
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	@Override
	public String toString() {
		return "Criteria [pageNum=" + pageNum + ", amount=" + amount + ", startNum=" + startNum + "]";
	}
	
}
