package com.gd.safari.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IScheduleMapper {
	
	// 일정 리스트
	List<Map<String, Object>> selectScheduleList();
	// 일정 생성
	int insertSchedule(Map<String, Object> map);
	// 일정 수정
	
	// 일정 삭제
}
