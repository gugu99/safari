package com.gd.safari.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.mapper.ITaskCommentLikeMapper;
import com.gd.safari.vo.TaskCommentLike;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class TaskCommentLikeService implements ITaskCommentLikeService {
	@Autowired private ITaskCommentLikeMapper taskCommentLikeMapper;

	// 해당 업무번호에 따른 업무코멘트 좋아요 가져오기
	@Override
	public List<Map<String, Object>> getTaskCommentLike(int taskNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 해당 업무번호에 따른 업무코멘트 좋아요 가져오기");
		return taskCommentLikeMapper.selectTaskCommentLike(taskNo);
	}

	// 좋아요를 눌렀는지 안눌렀는지 확인
	@Override
	public TaskCommentLike getTaskCommentLikeCheck(TaskCommentLike taskCommentLike) {
		log.debug(TeamColor.CSH + this.getClass() + " 좋아요를 눌렀는지 안눌렀는지 확인");
		return taskCommentLikeMapper.selectTaskCommentLikeCheck(taskCommentLike);
	}
	
	// 업무코멘트 좋아요 생성
	@Override
	public int addTaskCommentLike(TaskCommentLike taskCommentLike) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무코멘트 좋아요 생성");
		return taskCommentLikeMapper.insertTaskCommentLike(taskCommentLike);
	}

	// 업무코멘트 좋아요 삭제
	@Override
	public int removeTaskCommentLike(TaskCommentLike taskCommentLike) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무코멘트 좋아요 삭제");
		return taskCommentLikeMapper.deleteTaskCommentLike(taskCommentLike);
	}
}
