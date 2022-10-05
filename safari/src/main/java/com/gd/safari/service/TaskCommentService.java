package com.gd.safari.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.mapper.ITaskCommentMapper;
import com.gd.safari.vo.TaskComment;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class TaskCommentService implements ITaskCommentService {
	@Autowired private ITaskCommentMapper taskCommentMapper;
	
	// 업무 코멘트리스트 가져오기
	@Override
	public List<Map<String, Object>> getTaskComment(int taskNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무 코멘트리스트 가져오기");
		return taskCommentMapper.selectTaskComment(taskNo);
	}

	// 수정하기 위한 업무 코멘트 가져오기
	@Override
	public Map<String, Object> getTaskCommentByTaskCmtNo(int taskCmtNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 수정하기 위한 업무 코멘트 가져오기");
		return taskCommentMapper.selectTaskCommentByTaskCmtNo(taskCmtNo);
	}
	
	// 고정된 코멘트 있을 경우 가져오기
	@Override
	public Map<String, Object> getFixTaskCommentByTaskNo(int taskNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 고정된 코멘트 있을 경우 가져오기");
		return taskCommentMapper.selectFixTaskCommentByTaskNo(taskNo);
	}
	
	// 업무 코멘트 생성
	@Override
	public int addTaskComment(TaskComment taskComment) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무 코멘트 생성");
		return taskCommentMapper.insertTaskComment(taskComment);
	}
	
	// 업무 코멘트 수정
	@Override
	public int modifyTaskComment(TaskComment taskComment) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무 코멘트 수정");
		return taskCommentMapper.updateTaskComment(taskComment);
	}

	// 업무 코멘트 고정하기
	@Transactional
	@Override
	public int modifyFixTaskComment(int taskCmtNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무 코멘트 고정하기");
		// 지정한 업무 코멘트 외의 것은 업무코멘트 해제하기 (하나만 고정가능)
		taskCommentMapper.updateUnfixedTaskComment(taskCmtNo);
		// 해제한 후 고정하기
		return taskCommentMapper.updateFixTaskComment(taskCmtNo);
	}
	
	
	// 업무 코멘트 삭제
	@Override
	public int removeTaskComment(TaskComment taskComment) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무 코멘트 삭제");
		return taskCommentMapper.deleteTaskComment(taskComment);
	}
}
