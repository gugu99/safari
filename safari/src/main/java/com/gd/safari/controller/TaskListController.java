package com.gd.safari.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.service.ITaskListService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TaskListController {
	@Autowired private ITaskListService taskListService;
	
	// 업무리스트 페이지 이동
	@GetMapping("/member/taskList")
	public String taskList(HttpSession session, Model model, @RequestParam(value = "projectNo") int projectNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무리스트 페이지");
		
		session.setAttribute("projectNo", projectNo);
		log.debug(TeamColor.CSH + "프로젝트 번호 : " + session.getAttribute("projectNo"));
		
		// 현재 프로젝트이름 가져오기
		model.addAttribute("projectName", taskListService.getProjectName(projectNo));
		
		return "task/taskList";
	}
	
	// 게스트 업무리스트 페이지 이동
	@GetMapping("/safari/guestTaskList")
	public String guestTaskList(HttpSession session, Model model, @RequestParam(value = "projectNo") int projectNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 게스트용 업무리스트 페이지");
		
		session.setAttribute("projectNo", projectNo);
		log.debug(TeamColor.CSH + "프로젝트 번호 : " + session.getAttribute("projectNo"));

		// 현재 프로젝트이름 가져오기
		model.addAttribute("projectName", taskListService.getProjectName(projectNo));
		
		return "task/guestTaskList";
	}
}
