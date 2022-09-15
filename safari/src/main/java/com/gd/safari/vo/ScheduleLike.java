package com.gd.safari.vo;

import lombok.Data;

@Data
public class ScheduleLike {
	private int scheduleNo;		// 일정 번호
	private String memberEmail;	// 일정 좋아요 누른 사람
	private String createDate;	// 생성일
}
