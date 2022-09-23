package com.gd.safari.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gd.safari.vo.ScheduleMember;

@Mapper
public interface IScheduleMemberMapper {
	
	// 일정 멤버 추가
	int insertScheduleMember(ScheduleMember scheduleMember);
	// 일정 참석 여부 조회
	String selectScheduleAttend(ScheduleMember scheduleMember);
	// 일정 멤버 수정(참석여부)
	int updateScheduleAttend(ScheduleMember scheduleMember);
	// 일정 멤버 삭제
	int deleteScheduleMember(int scheduleNo);
}
