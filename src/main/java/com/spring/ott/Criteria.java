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
	
	//board-mapping에 LIMIT #{cri.amount} OFFSET #{cri.startNum} 이부분
	//LIMIT(몇 개) OFFSET(0부터) <- 0부터 시작(index[0])
	
	@Override
	//object가 최상위 객체이고 (object 클래스 가보면)@~~~어쩌고로 출력되는데 알아보기 쉽게 출력하기위해서 쓴것임.
	public String toString() {
		return "Criteria [pageNum=" + pageNum + ", amount=" + amount + ", startNum=" + startNum + "]";
	}
	
}
