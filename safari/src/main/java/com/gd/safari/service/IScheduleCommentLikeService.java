package com.gd.safari.service;

import com.gd.safari.vo.ScheduleCommentLike;

public interface IScheduleCommentLikeService {
	// 일정 좋아요 했는지 안했는지 이메일 조회하고 일정 좋아요 추가
	int addScheduleCommentLike(ScheduleCommentLike scheduleCommentLike);
}
