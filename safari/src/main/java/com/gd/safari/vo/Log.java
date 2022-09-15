package com.gd.safari.vo;

import lombok.Data;

@Data
public class Log {
	private int logNo;			// 로그번호
	private int taskNo;			// 업무번호
	private String logMember;	// 로그멤버
	private String logContent;	// 로그내용
	private String createDate;	// 로그 생성일
	private int projectNo;		// 프로젝트번호
}
