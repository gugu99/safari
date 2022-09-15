package com.gd.safari.vo;

import lombok.Data;

@Data
public class Member {			// 멤버를 위한 vo
	private String memberEmail;	// 멤버 이메일(PK)
	private String memberPw;	// 멤버 비밀번호
	private String active;		// 멤버 활성화
	private String createDate;	// 생성일
}