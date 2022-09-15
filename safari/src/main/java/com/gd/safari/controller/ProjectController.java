package com.gd.safari.controller;

import java.util.Arrays;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.safari.commons.TeamColor;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ProjectController {
	
	// 전체 프로젝트 개괄, 프로젝트 추가 페이지
	@GetMapping("/safari/project")
	public String project() {
		return "project/project";
	}
	
	@PostMapping("/safari/project")
	public String project(@RequestParam Map<String, Object> map) {
		log.debug(TeamColor.CSK + "프로젝트 추가");
		log.debug(TeamColor.CSK + map);
		
		// TODO
		
		return "project/project";
	}
	
	// 개별 프로젝트 요약 페이지
	@GetMapping("/safari/projectSummary")
	public String projectSummary() {
		return "project/projectSummary";
	}
	
	
	@PostMapping("/safari/projectGroup")
	public String projectGroup(@RequestParam String projectGroupName) {
		log.debug(TeamColor.CSK + "프로젝트 그룹 추가");
		log.debug(TeamColor.CSK + projectGroupName);

		return "project/project";
	}
}
