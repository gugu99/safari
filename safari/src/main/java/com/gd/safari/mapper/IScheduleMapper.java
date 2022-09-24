package com.gd.safari.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.safari.vo.Schedule;
import com.gd.safari.vo.ScheduleList;

@Mapper
public interface IScheduleMapper {
	
	// 일정 리스트 (일정, 일정 멤버, 일정 댓글)
	List<ScheduleList> selectScheduleList(int projectNo, int workNo);
	// 일정 생성
	int insertSchedule(Map<String, Object> map);
	// 일정 한개 데이터 조회 - 일정 수정 폼에 사용
	Schedule selectScheduleOneByScheduleNo(int scheduleNo);
	// 일정 수정
	int updateSchedule(Map<String, Object> map);
	// 일정 삭제
	int deleteSchedule(int scheduleNo);
}
