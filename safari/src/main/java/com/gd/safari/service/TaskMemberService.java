package com.gd.safari.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.safari.mapper.ITaskMemberMapper;
import com.gd.safari.vo.TaskMember;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class TaskMemberService implements ITaskMemberService {
	@Autowired private ITaskMemberMapper taskMemberMapper;
	
	// 해당 프로젝트번호 따른 업무멤버 조회
	@Override
	public List<Map<String, Object>> getTaskMemberByTask(int projectNo) {
		return taskMemberMapper.selectTaskMemberByTask(projectNo);
	}
	
	// 업무멤버 생성
	@Override
	public int addTaskMember(TaskMember taskMember) {
		return taskMemberMapper.insertTaskMember(taskMember);
	}
	
	// 업무멤버 삭제
	@Override
	public int removeTaskMember(TaskMember taskMember) {
		return taskMemberMapper.deleteTaskMember(taskMember);
	}

}
