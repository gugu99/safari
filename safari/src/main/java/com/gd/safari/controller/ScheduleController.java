package com.gd.safari.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.service.IScheduleService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ScheduleController {
	
	@Autowired
	private IScheduleService scheduleService;

	// 일정 리스트 페이지 이동
	@GetMapping("/safari/scheduleList")
	public String scheduleList(HttpSession session, Model model) {
		
		int projectNo = (int)session.getAttribute("projectNo");
		log.debug(TeamColor.GDE + "projectNo --- " + projectNo);
		
		int workNo = (int)session.getAttribute("workNo");
		log.debug(TeamColor.GDE + "workNo --- " + workNo);
		
		Map<String, Object> map = scheduleService.getScheduleList(projectNo, workNo);
		log.debug(TeamColor.GDE + "scheduleList --- " + map.get("scheduleList"));
		log.debug(TeamColor.GDE + "projectMemberList --- " + map.get("projectMemberList"));
		
		model.addAttribute("scheduleList", map.get("scheduleList"));
		model.addAttribute("projectMemberList", map.get("projectMemberList"));
		
		
		return "schedule/scheduleList";
	}
	
	// 일정 추가 
	@PostMapping("/safari/scheduleList")
	public String addSchedule(HttpSession session, @RequestParam Map<String, Object> map) {
		log.debug(TeamColor.GDE + "map --- " + map);
		// 세션에 저장된 projectNo 가져와서 map에 넣어주기
		int projectNo = (int)session.getAttribute("projectNo");
		map.put("projectNo", projectNo);
		log.debug(TeamColor.GDE + "projectNo --- " + projectNo);
		
		// 일정 추가
		scheduleService.addSchedule(map);
		
		return "redirect:/safari/scheduleList";
	}
}
