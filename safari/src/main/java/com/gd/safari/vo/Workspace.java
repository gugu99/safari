package com.gd.safari.vo;

import lombok.Data;

@Data
public class Workspace {

	private int workNo; 		// 워크스페이스 번호 
	private String workName;	// 워크스페이스 이름
	private String createDate;	// 워크스페이스 생성일
	private String updateDate;	// 워크스페이스 수정일
	private String adminEmail;	// 워크스페이스 생성자 이메일
	
}
