package com.gd.safari.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.mapper.ILogMapper;
import com.gd.safari.mapper.ITaskMapper;
import com.gd.safari.mapper.ITaskMemberMapper;
import com.gd.safari.vo.TaskMember;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class TaskMemberService implements ITaskMemberService {
	@Autowired private ITaskMapper taskMapper;
	@Autowired private ITaskMemberMapper taskMemberMapper;
	@Autowired private ILogMapper logMapper;
	
	// 해당 업무의 업무 멤버리스트 조회 - email, name - 피드백에서 사용할 메서드
	@Override
	public List<Map<String, Object>> getMemberListNameAndEmailByTaskNo(int taskNo) {
		return taskMemberMapper.selectMemberListNameAndEmailByTaskNo(taskNo);
	}
	
	

	// 프로젝트멤버 가져오기
	@Override
	public List<Map<String, Object>> getTaskMember(int projectNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 프로젝트멤버 가져오기");
		return taskMemberMapper.selectTaskMember(projectNo);
	}

	// 해당 업무번호에 없는 프로젝트멤버 조회/해당 업무번호에 따른 업무멤버 조회 - 프로젝트번호, 업무번호 필요하여 map으로 사용
	@Override
	public List<Map<String, Object>> getTaskMemberByProjectNoAndTaskNo(Map<String, Integer> map) {
		log.debug(TeamColor.CSH + this.getClass() + " 해당 프로젝트번호에 따른 업무멤버 조회");
		
		// 해당 업무번호에 없는 프로젝트멤버 조회/해당 업무번호에 따른 업무멤버 조회 분기
		List<Map<String, Object>> memberList = taskMemberMapper.selectTaskMemberByProjectNoAndTaskNo(map);
		List<Map<String, Object>> result = new ArrayList<>();
		
		// for문을 이용하여 분리
		for(Map<String, Object> m : memberList) {
			// 업무번호가 없는 프로젝트 멤버
			if(m.get("taskNo") == null) {
				// 담기
				result.add(m);
			}
		}
		
		// 디버깅
		log.debug(TeamColor.CSH + result);
		
		return result;
	}

	// 해당 업무번호에 따른 업무멤버 조회 (위에 것에서 파생되는 메서드)
	@Override
	public List<Map<String, Object>> getTaskMemberByTaskNo(Map<String, Integer> map) {
		log.debug(TeamColor.CSH + this.getClass() + " 해당 업무번호에 따른 업무멤버 조회");
		
		// 해당 업무번호에 없는 프로젝트멤버 조회/해당 업무번호에 따른 업무멤버 조회 분기
		List<Map<String, Object>> memberList = taskMemberMapper.selectTaskMemberByProjectNoAndTaskNo(map);
		List<Map<String, Object>> result = new ArrayList<>();
		
		// for문을 이용하여 분리
		for(Map<String, Object> m : memberList) {
			// 업무번호가 있는 프로젝트 멤버 - 특정 업무에 배정되어 있음
			if(m.get("taskNo") != null) {
				// 담기
				result.add(m);
			}
		}
		
		// 디버깅
		log.debug(TeamColor.CSH + result);
		
		return result;
	}
	
	// 업무멤버 생성
	@Override
	public int addTaskMember(Map<String, Object> m) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무멤버 생성");
		
		// 파라미터 해체하기
		TaskMember taskMember = (TaskMember) m.get("taskMember");

		// 메서드 먼저 실행
		int row = taskMemberMapper.insertTaskMember(taskMember);
		
		// 로그 파라미터 만들기
		Map<String, Object> logM = new HashMap<>();
		logM.put("logContent", m.get("workMemberName") + " 님이 '" + taskMemberMapper.selectTaskMemberForLog(taskMember) + "' 님을 '" + taskMapper.selectTaskTitleForLog(taskMember.getTaskNo()) + "' 업무에 배정했습니다.");
		logM.put("projectNo", m.get("projectNo"));
		
		// 디버깅
		log.debug(TeamColor.CSH + logM);
		// 로그 처리하기
		logMapper.insertLog(logM);
		
		return row;
	}
	
	// 업무멤버 삭제
	@Override
	public int removeTaskMember(Map<String, Object> m) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무멤버 삭제");
		
		// 파라미터 해체하기
		TaskMember taskMember = (TaskMember) m.get("taskMember");

		// 로그 파라미터 만들기
		Map<String, Object> logM = new HashMap<>();
		logM.put("logContent", m.get("workMemberName") + " 님이 '" + taskMemberMapper.selectTaskMemberForLog(taskMember) + "' 님을 '" + taskMapper.selectTaskTitleForLog(taskMember.getTaskNo()) + "' 업무에서 제거했습니다.");
		logM.put("projectNo", m.get("projectNo"));
		
		// 디버깅
		log.debug(TeamColor.CSH + logM);
		// 로그 처리하기
		logMapper.insertLog(logM);
		
		return taskMemberMapper.deleteTaskMember(taskMember);
	}
}
