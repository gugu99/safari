package com.gd.safari.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ProjectController {
	
	// 전체 프로젝트 개괄, 프로젝트 추가 페이지
	@GetMapping("/safari/project")
	public String project() {
		return "project/project";
	}
	
	// 개별 프로젝트 요약 페이지
	@GetMapping("/safari/projectSummary")
	public String projectSummary() {
		return "project/projectSummary";
	}
	
	
}
