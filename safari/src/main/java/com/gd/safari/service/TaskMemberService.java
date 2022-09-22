package com.gd.safari.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.mapper.IProjectMemberMapper;
import com.gd.safari.mapper.ITaskMemberMapper;
import com.gd.safari.vo.TaskMember;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class TaskMemberService implements ITaskMemberService {
	@Autowired private ITaskMemberMapper taskMemberMapper;
	@Autowired private IProjectMemberMapper projectMemberMapper;
	
	// 프로젝트 멤버 조회 (IProjectMemberMapper에서 받아오기)
	@Override
	public List<Map<String, Object>> getProjectMemberList(int projectNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 프로젝트 멤버 조회");
		return projectMemberMapper.selectProjectMemberList(projectNo);
	}
	
	// 해당 프로젝트번호 따른 업무멤버 조회
	@Override
	public List<Map<String, Object>> getTaskMemberByTask(int projectNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 해당 프로젝트번호 따른 업무멤버 조회");
		
		return taskMemberMapper.selectTaskMemberByTask(projectNo);
	}
	
	// 업무멤버 생성
	@Override
	public int addTaskMember(TaskMember taskMember) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무멤버 생성");
		
		return taskMemberMapper.insertTaskMember(taskMember);
	}
	
	// 업무멤버 삭제
	@Override
	public int removeTaskMember(TaskMember taskMember) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무멤버 삭제");
		
		return taskMemberMapper.deleteTaskMember(taskMember);
	}

}
