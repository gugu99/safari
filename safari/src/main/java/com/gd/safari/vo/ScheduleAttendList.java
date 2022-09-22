package com.gd.safari.vo;

import lombok.Data;

@Data
public class ScheduleAttendList {
	int scheduleNo; 			// 일정 번호
	String scheduleAttendance;  // 일정 참석 여부
	int attendCnt; 				// 참석여부 개수
}
