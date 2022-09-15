package com.gd.safari.vo;

import lombok.Data;

@Data
public class File {
	private int fileNo;			// 파일번호
	private int taskNo;			// 업무번호
	private String uploader;	// 파일올린사람
	private String filename;	// 파일이름
	private String fileExt;		// 파일확장자
	private String originName;	// 파일 원래이름
	private String fileType;	// 파일 타입
	private long fileSize;		// 파일 크기
	private String createDate;	// 파일 올린날짜	
	private String updateDate;	// 파일 수정한날짜
	
}
