package com.gd.safari.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.safari.vo.ScheduleMember;

@Mapper
public interface IScheduleMemberMapper {
	
	// 일정 멤버 추가
	int insertScheduleMember(ScheduleMember scheduleMember);
	// 일정 참석 여부 조회 - 일정 참석여부 수정에 사용
	String selectScheduleAttend(Map<String, Object> map);
	// 일정 멤버 수정(참석여부)
	int updateScheduleAttend(Map<String, Object> map);
	// 일정 멤버 조회 - 일정 수정 폼에 사용
	List<Map<String, Object>> selectScheduleMemberEmailByScheduleNo(int scheduleNo, int projectNo, int workNo);
	// 일정 멤버 조회
	List<String> selectScheduleMember(ScheduleMember scheduleMember);
	// 일정 전체 멤버 삭제 - 일정 삭제에 사용
	// On Delete CASCADE 사용하기로 변경 -> 삭제
//	int deleteScheduleMember(int scheduleNo);
	
	// 일정 멤버 한명 삭제 - 일정 수정에 사용
	int deleteScheduleMemberByScheduleNoAndScheduleMemberEmail(ScheduleMember scheduleMember);
}
