package com.gd.safari.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.mapper.ITaskMapper;
import com.gd.safari.vo.Task;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class TaskService implements ITaskService {
	@Autowired private ITaskMapper taskMapper;
	
	// 프로젝트 번호에 맞는 업무 조회
	@Override
	public List<Task> getTaskByProjectNo(int projectNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 프로젝트 번호에 맞는 업무 조회");
		return taskMapper.selectTaskByProjectNo(projectNo);
	}
	
	// 업무 생성
	@Override
	public int addTask(Task task) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무 생성");
		return taskMapper.insertTask(task);
	}
	
	// 업무 수정
	@Override
	public int modifyTask(Task task) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무 수정");
		return taskMapper.updateTask(task);
	}
	
	// 업무 삭제
	@Override
	public int removeTask(int taskNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무 삭제");
		return taskMapper.deleteTask(taskNo);
	}

}
