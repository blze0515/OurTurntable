package com.spring.ott;

import lombok.Data;

@Data
//���� �����ִ� �������� ��ȣ, �� �������� ǥ���� �Խù� ����, ������ ���� ��ȣ�� ������ ��ü
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