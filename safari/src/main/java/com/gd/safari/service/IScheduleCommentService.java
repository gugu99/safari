package com.gd.safari.service;

import java.util.Map;

public interface IScheduleCommentService {
	// 댓글 작성하기
	int addScheduleComment(Map<String, Object> map);
	// 댓글 삭제하기
	int removeScheduleComment(int scheduleCmtNo);
}
