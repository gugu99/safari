package com.gd.safari.vo;

import lombok.Data;

@Data
public class Board { 				// 보드(게시판)를 위한 vo
	private int boardNo; 			// 보드 번호(PK)
	private int workNo;			// 워크스페이스 번호(FK)
	private String boardTitle;		// 보드 제목
	private String boardContent;	// 보드 내용
	private String boardLocation;	// 보드 장소(api로 지도를 보여준다.)
	private String boardDetailLocation; // 보드상세 주소
	private String boardAuth;		// 보드 공개 범위
	private String boardFix;		// 보드 고정
	private String boardWriter;		// 보드 작성자
	private String createDate;		// 생성일
	private String updateDate;		// 수정일
}
