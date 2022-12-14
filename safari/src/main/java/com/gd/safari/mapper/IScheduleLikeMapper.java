package com.gd.safari.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gd.safari.vo.ScheduleLike;

@Mapper
public interface IScheduleLikeMapper {

	// 일정 좋아요 했는지 안했는지 이메일 조회
	String selectScheduleLikeByScheduleNoAndMemberEmail(ScheduleLike scheduleLike);
	// 일정 좋아요 추가
	int insertScheduleLike(ScheduleLike scheduleLike);
	// 일정 좋아요 삭제
	// On Delete CASCADE 사용하기로 변경 -> 삭제
//	int deleteScheduleLike(int scheduleNo);
}
