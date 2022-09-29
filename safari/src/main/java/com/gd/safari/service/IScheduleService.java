package com.gd.safari.service;

import java.util.Map;

public interface IScheduleService {

	// 일정 리스트
	Map<String, Object> getScheduleList(Map<String, Object> map);
	// 일정 생성
	void addSchedule(Map<String, Object> map);
	// 일정 한개 데이터 조회
	Map<String, Object> getScheduleOneByScheduleNo(int scheduleNo, int projectNo, int workNo);
	// 일정 수정
	int modifySchedule(Map<String, Object> map);
	// 일정 삭제
	void removeSchedule(int scheduleNo);
}
