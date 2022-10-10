package com.gd.safari.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.mapper.ITaskAnalyticsMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class TaskAnalyticsService implements ITaskAnalyticsService {
	@Autowired private ITaskAnalyticsMapper taskAnalyticsMapper;

	// 프로젝트 시작일/마감일/완료일/경과시간/남은시간/완료됨/남은업무 가져오기
	@Override
	public Map<String, Object> getTaskAnalytics(int projectNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 프로젝트 시작일/마감일/완료일/경과시간/남은시간/완료됨/남은업무 가져오기");
		return taskAnalyticsMapper.selectTaskAnalytics(projectNo);
	}

	// 프로젝트 개요 완료됨/마감일지남/계획됨/마감일없음 가져오기
	@Override
	public Map<String, Object> getAllTaskByProjectNo(int projectNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 프로젝트 개요 완료됨/마감일지남/계획됨/마감일없음 가져오기");
		return taskAnalyticsMapper.selectAllTaskByProjectNo(projectNo);
	}

	// 나에게 배정된 업무 완료됨/마감일지남/계획됨/마감일없음 가져오기
	@Override
	public Map<String, Object> getTaskByTaskMemberIsMe(Map<String, Object> m) {
		log.debug(TeamColor.CSH + this.getClass() + " 나에게 배정된 업무 완료됨/마감일지남/계획됨/마감일없음 가져오기");
		return taskAnalyticsMapper.selectTaskByTaskMemberIsMe(m);
	}

	// 내가 작성한 업무 완료됨/마감일지남/계획됨/마감일없음 가져오기
	@Override
	public Map<String, Object> getTaskByWriterIsMe(Map<String, Object> m) {
		log.debug(TeamColor.CSH + this.getClass() + " 내가 작성한 업무 완료됨/마감일지남/계획됨/마감일없음 가져오기");
		return taskAnalyticsMapper.selectTaskByWriterIsMe(m);
	}

	// 업무리스트 개요 완료됨/마감일지남/계획됨/마감일없음 가져오기
	@Override
	public List<Map<String, Object>> getTastListByProjectNo(int projectNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무리스트 개요 완료됨/마감일지남/계획됨/마감일없음 가져오기");
		return taskAnalyticsMapper.selectTastListByProjectNo(projectNo);
	}
}
