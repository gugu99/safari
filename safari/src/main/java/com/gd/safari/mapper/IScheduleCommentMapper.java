package com.gd.safari.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IScheduleCommentMapper {
	// 댓글 작성하기
	int insertScheduleComment(Map<String, Object> map);
	// 일정에 등록된 댓글 번호 조회하기
	List<Integer> selectScheduleCmtNoByScheduleNo(int scheduleNo);
	// 댓글 삭제하기
	int deleteScheduleComment(int scheduleNo);
}
