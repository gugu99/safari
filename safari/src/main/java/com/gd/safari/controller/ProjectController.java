package com.gd.safari.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ProjectController {
	
	
	// 전체 프로젝트 개괄 페이지
	@GetMapping("/project")
	public String project() {
		return "project/project";
	}
	
	// 프로젝트 추가 form
	@GetMapping("/addProject")
	public String addProject() {
		return "project/addProject";
	}
	
	// 개별 프로젝트 요약 페이지
	@GetMapping("/projectSummary")
	public String projectSummary() {
		return "project/projectSummary";
	}
}
