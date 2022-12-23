package com.spring.ott.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class PointVO {
	private int pointSeq;
	private String userId;
	private char pointCommonCode;
	private String pointReceiver;
	private int pointMoney;
	private Date pointRgstdate;
	private Date pointRecentPayment;
}
