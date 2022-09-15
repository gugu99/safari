package com.gd.safari.vo;

import lombok.Data;

@Data
public class Schedule {
	private int scheduleNo;					// 일정 번호
	private int projectNo;					// 프로젝트 번호
	private String scheduleStart;			// 일정 시작일
	private String scheduleEnd;				// 일정 마감일
	private String scheduleTitle;			// 일정 제목
	private String scheduleLocation;		// 일정 장소
	private String scheduleDetailLocation;	// 일정 상세 장소
	private String scheduleContent;			// 일정 내용
	private String scheduleAuth;			// 일정 공개 범위
	private String createDate;				// 생성일
	private String updateDate;				// 수정일
}
