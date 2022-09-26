package com.gd.safari.vo;

import lombok.Data;

@Data
public class WorkspaceGuest {
	private String memberEmail;		// 워크스페이스 게스트 멤버이메일 
	private int workNo;				// 워크스페이스 번호
	private String createDate;		// 게스트 생성일
	private String workGuestCode;	// 워크스페이스 코드
	private String active;			// 활동여부
}
