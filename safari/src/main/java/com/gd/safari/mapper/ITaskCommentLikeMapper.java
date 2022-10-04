package com.gd.safari.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.safari.vo.TaskCommentLike;

@Mapper
public interface ITaskCommentLikeMapper {
	// 해당 업무번호에 따른 업무코멘트 좋아요 가져오기
	List<Map<String, Object>> selectTaskCommentLike(int taskNo);
	// 좋아요를 눌렀는지 안눌렀는지 확인
	TaskCommentLike selectTaskCommentLikeCheck(TaskCommentLike taskCommentLike);
	// 업무코멘트 좋아요 생성
	int insertTaskCommentLike(TaskCommentLike taskCommentLike);
	// 업무코멘트 좋아요 삭제
	int deleteTaskCommentLike(TaskCommentLike taskCommentLike);
}
