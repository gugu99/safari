package com.gd.safari.restController;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.service.ITaskAnalyticsService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class RestTaskAnalyticsController {
	@Autowired private ITaskAnalyticsService taskAnalyticsService;
	
	// 프로젝트 개요
	@PostMapping("/member/allTaskAnalyticsByProjectNo")
	public Map<String, Object> allTaskAnalyticsByProjectNo(HttpSession session) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무 분석 - 프로젝트 개요");
		
		Map<String, Object> m = taskAnalyticsService.getAllTaskByProjectNo((int) session.getAttribute("projectNo"));
		
		// 디버깅
		log.debug(TeamColor.CSH + m);
		
		return m;
	}
	
	// 나에게 배정된 업무 완료됨/마감일지남/계획됨/마감일없음
	@PostMapping("/member/taskAnalyticsByTaskMemberIsMe")
	public Map<String, Object> taskAnalyticsByTaskMemberIsMe(HttpSession session, Map<String, Object> param) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무 분석 - 나에게 배정된 업무");
		
		// 파라미터 파싱
		param.put("projectNo", session.getAttribute("projectNo"));
		param.put("memberEmail", session.getAttribute("login"));
		
		
		Map<String, Object> m = taskAnalyticsService.getTaskByTaskMemberIsMe(param);
		
		// 디버깅
		log.debug(TeamColor.CSH + m);
		
		return m;
	}
	
	// 내가 작성한 업무 완료됨/마감일지남/계획됨/마감일없음
	@PostMapping("/member/taskAnalyticsByTaskWriterIsMe")
	public Map<String, Object> taskAnalyticsByTaskWriterIsMe(HttpSession session, Map<String, Object> param) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무 분석 - 내가 작성한 업무");
		
		// 파라미터 파싱
		param.put("projectNo", session.getAttribute("projectNo"));
		param.put("memberEmail", session.getAttribute("login"));
		
		
		Map<String, Object> m = taskAnalyticsService.getTaskByWriterIsMe(param);
		
		// 디버깅
		log.debug(TeamColor.CSH + m);
		
		return m;
	}
	
	// 업무리스트 개요 완료됨/마감일지남/계획됨/마감일없음 가져오기
	@PostMapping("/member/taskListAnalyticsByProjectNo")
	public List<Map<String, Object>> taskListAnalyticsByProjectNo(HttpSession session) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무 분석 - 업무리스트 개요");
		
		List<Map<String, Object>> list = taskAnalyticsService.getTastListByProjectNo((int) session.getAttribute("projectNo"));
		
		// 디버깅
		log.debug(TeamColor.CSH + list);
		
		return list;
	}
}
