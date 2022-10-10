package com.gd.safari.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.service.ITaskAnalyticsService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TaskAnalyticsController {
	@Autowired private ITaskAnalyticsService taskAnalyticsService;
	
	// 업무 분석 이동
	@GetMapping("/member/task-analytics")
	public String taskAnalytics(HttpSession session, Model model) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무 분석 이동");
		
		Map<String, Object> m = taskAnalyticsService.getTaskAnalytics((int) session.getAttribute("projectNo"));
		
		// 디버깅
		log.debug(TeamColor.CSH + m);
		
		// 모델 값으로 넘기기
		model.addAttribute("m", m);
		
		return "task/task-analytics";
	}
}
