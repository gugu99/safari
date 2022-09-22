package com.gd.safari.vo;

import lombok.Data;

@Data
public class ScheduleMemberList {
	private int scheduleNo;					// 일정 번호
	private String scheduleMemberEmail;		// 일정 참석자
	private String scheduleAttend;			// 일정 참석 여부
	private String createDate;				// 생성일
	private String updateDate;				// 수정일
	private String workMemberName;			// 일정 멤버 이름
	private String filename;				// 프로필 이미지 파일이름
	private String fileExt;					// 프로필 이미지 확장자
}
