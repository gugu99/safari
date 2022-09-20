package com.gd.safari.vo;

import lombok.Data;

@Data
public class ScheduleCommentList {
	private int scheduleCmtNo;			// 일정 댓글 번호
	private String cmtMemberEmail;		// 댓글 쓴사람
	private String cmtWorkMemberName;	// 댓글 작성자
	private String scheduleCmtContent;	// 일정 댓글 내용
	private String cmtCreateDate;		// 생성일
	private int scheduleNo;				// 일정 번호
	private int scheduleCmtLikeCnt;		// 일정 댓글 좋아요 개수
	
}
