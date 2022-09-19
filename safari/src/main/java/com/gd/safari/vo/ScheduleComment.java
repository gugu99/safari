package com.gd.safari.vo;

import lombok.Data;

@Data
public class ScheduleComment {
	private int scheduleCmtNo;			// 일정 댓글 번호
	private String cmtMemberEmail;			// 댓글 쓴사람
	private String scheduleCmtContent;	// 일정 댓글 내용
	private String cmtCreateDate;			// 생성일
	private int scheduleNo;				// 일정 번호
}
