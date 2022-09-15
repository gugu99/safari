package com.gd.safari.vo;

import lombok.Data;

@Data
public class ProfileImg {
	private int workMemberNo;	// 워크스페이스멤버 번호
	private String filename;	// 프로필 파일 이름
	private String fileExt;		// 파일 확장자
	private String originName;	// 파일 원래이름
	private String fileType;	// 파일 타입
	private long fileSize;		// 파일사이즈
	private String createDate;	// 생성일
	private String updateDate;	// 수정일
	
}
