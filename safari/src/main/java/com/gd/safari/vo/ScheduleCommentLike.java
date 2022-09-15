package com.gd.safari.vo;

import lombok.Data;

@Data
public class ScheduleCommentLike {
	private int scheduleCmtNo;	// 일정 댓글 번호
	private String memberEmail;	// 일정 댓글 좋아요 누른 사람
	private String createDate;	// 생성일
}
