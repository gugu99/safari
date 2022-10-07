package com.gd.safari.vo;

import java.util.List;

import lombok.Data;

@Data
public class BoardList {
	private int boardNo; 			// 보드 번호(PK)
	private int workNo;				// 워크스페이스번호(FK)
	private String boardTitle;		// 보드 제목
	private String boardContent;	// 보드 내용
	private String workMemberName;  // 멤버이름
	private String boardLocation;	// 보드 장소(api로 지도를 보여준다.)
	private String boardDetailLocation; // 보드 상세주소
	private String boardAuth;		// 보드 공개 범위
	private String boardFix;		// 보드 고정
	private String boardWriter;		// 보드 작성자
	private String createDate;		// 생성일
	private String updateDate;		// 수정일
	private String filename;				// 프로필 이미지 파일이름
	private String fileExt;					// 프로필 이미지 확장자
	private int boardLikeCnt;			// 일정 좋아요 개수
	private List<BoardFileList> boardFiles;
	private List<BoardCommentList> boardComments;
}
