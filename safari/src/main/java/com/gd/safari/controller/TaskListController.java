package com.gd.safari.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.safari.commons.TeamColor;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TaskListController {
	
	// 업무리스트 페이지 이동
	@GetMapping("/safari/taskList")
	public String taskList(HttpSession session, @RequestParam(value = "projectNo") int projectNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무리스트 페이지");
		
		session.setAttribute("projectNo", projectNo);
		log.debug(TeamColor.CSH + "프로젝트 번호 : " + session.getAttribute("projectNo"));
		
		return "task/taskList";
	}
}
