package com.gd.safari.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.mapper.ITaskCommentMapper;

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

}
