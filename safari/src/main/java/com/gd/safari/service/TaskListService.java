package com.gd.safari.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.mapper.ITaskListMapper;
import com.gd.safari.vo.TaskList;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class TaskListService implements ITaskListService {
	@Autowired private ITaskListMapper taskListMapper;
	
	// 업무리스트 보여주기
	@Override
	public List<TaskList> getTaskList() {
		log.debug(TeamColor.CSH + this.getClass() + " 업무리스트 보여주기");
		return taskListMapper.selectTaskList();
	}

	// 업무리스트 생성
	@Override
	public int addTaskList(TaskList tasklist) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무리스트 생성");
		return taskListMapper.insertTaskList(tasklist);
	}

	// 업무리스트 수정
	@Override
	public int modifyTaskList(TaskList tasklist) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무리스트 수정");
		return taskListMapper.updateTaskList(tasklist);
	}

	// 업무리스트 삭제
	@Override
	public int removeTaskList(int tasklistNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무리스트 삭제");
		return taskListMapper.deleteTaskList(tasklistNo);
	}

}
