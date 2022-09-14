package com.gd.safari.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ProjectController {
	
	// 비밀번호 찾기 페이지 이동
	@GetMapping("/project-summary")
	public String projectSummary() {
		return "project/project-summary";
	}
}
