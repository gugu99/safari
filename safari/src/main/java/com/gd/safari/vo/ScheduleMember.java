package com.gd.safari.vo;

import lombok.Data;

@Data
public class ScheduleMember {
	private int scheduleNo;			// 일정 번호
	private String scheduleMemberEmail;		// 일정 참석자
	private String scheduleAttend;	// 일정 참석 여부
	private String createDate;		// 생성일
	private String updateDate;		// 수정일
}
