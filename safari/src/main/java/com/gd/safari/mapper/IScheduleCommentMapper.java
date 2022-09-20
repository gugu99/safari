package com.gd.safari.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IScheduleCommentMapper {
	// 댓글 작성하기
	int insertScheduleComment(Map<String, Object> map);
	// 댓글 삭제하기
	int deleteScheduleComment(int scheduleCmtNo);
}
