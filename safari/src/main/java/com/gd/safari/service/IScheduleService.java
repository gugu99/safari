package com.gd.safari.service;

import java.util.List;
import java.util.Map;

public interface IScheduleService {

	// 일정 리스트
	Map<String, Object> getScheduleList(int projectNo);
	// 일정 생성
	void addSchedule(Map<String, Object> map);
	// 일정 수정
	
	// 일정 삭제
}
