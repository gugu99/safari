package com.gd.safari.vo;

import lombok.Data;

@Data
public class BoardFile { 		// 보드(게시판)파일을 위한 vo
	private int boardFileNo;	// 보드파일 번호(PK)
	private int boardNo;		// 보드 번호(FK)
	private String uploader;	// 업로드한 사람
	private String filename;	// 파일이름
	private String fileExt;		// 파일 확장자
	private String originName;	// 파일 본래 이름
	private String fileType;	// 파일 타입
	private long fileSize;		// 파일 사이즈
	private String createDate;	// 생성일
	private String updateDate;	// 수정일
}
