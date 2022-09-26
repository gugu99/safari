package com.gd.safari.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gd.safari.vo.ScheduleCommentLike;

@Mapper
public interface IScheduleCommentLikeMapper {
	
	// 일정 댓글 좋아요 했는지 안했는지 이메일 조회
	String selectScheduleCommentLikeByScheduleCmtNoAndMemberEmail(ScheduleCommentLike scheduleCommentLike);
	// 일정 댓글 좋아요 추가
	int insertScheduleCommentLike(ScheduleCommentLike scheduleCommentLike);
	// 일정 댓글 좋아요 삭제
	// On Delete CASCADE 사용하기로 변경 -> 삭제
//	int deleteScheduleCommentLike(int scheduleCmtNo);
}
