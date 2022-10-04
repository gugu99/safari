package com.gd.safari.service;

import java.util.List;
import java.util.Map;

import com.gd.safari.vo.TaskCommentLike;

public interface ITaskCommentLikeService {
	// 해당 업무번호에 따른 업무코멘트 좋아요 가져오기
	List<Map<String, Object>> getTaskCommentLike(int taskNo);
	// 좋아요를 눌렀는지 안눌렀는지 확인
	TaskCommentLike getTaskCommentLikeCheck(TaskCommentLike taskCommentLike);
	// 업무코멘트 좋아요 생성
	int addTaskCommentLike(TaskCommentLike taskCommentLike);
	// 업무코멘트 좋아요 삭제
	int removeTaskCommentLike(TaskCommentLike taskCommentLike);
}
