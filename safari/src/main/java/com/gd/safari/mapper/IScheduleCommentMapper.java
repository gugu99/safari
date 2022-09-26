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
	// 댓글 한개 삭제
	int deleteScheduleComment(int scheduleCmtNo);
	// 댓글 삭제하기(일정 안의 댓글 삭제)
	// On Delete CASCADE 사용하기로 변경 -> 삭제
//	int deleteScheduleCommentByScheduleNo(int scheduleNo);
}
