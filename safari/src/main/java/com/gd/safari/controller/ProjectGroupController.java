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
import com.gd.safari.service.IProjectGroupService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ProjectGroupController {
	@Autowired
	private IProjectGroupService projectGroupService;
	
	// 프로젝트 그룹 추가
	@PostMapping("/safari/projectGroup")
	public String projectGroup(@RequestParam String projectGroupName) {
		log.debug(TeamColor.CSK + "프로젝트 그룹 추가");
		log.debug(TeamColor.CSK + projectGroupName);
		
		projectGroupService.addProjectGroup(projectGroupName);

		return "redirect:/safari/project";
	}
	
	// 프로젝트 그룹 수정 폼 띄우기
	@GetMapping("/safari/modifyProjectGroup")
	public String modifyProjectGroup(HttpSession session, Model model, @RequestParam int projectGroupNo) {
		log.debug(TeamColor.CSK + "@GetMapping addProjToProjGroup");
		log.debug(TeamColor.CSK + "projectGroupNo" + projectGroupNo);
		
		int workNo = (int)session.getAttribute("workNo");
		
		Map<String, Object> map = projectGroupService.getAllProjectByProjectGroupNo(workNo, projectGroupNo);
		
		model.addAttribute("projectList", map.get("projectList"));
		model.addAttribute("projectGroup", map.get("projectGroup"));
		
		return "project/modifyProjectGroup";
	}
	
	// 프로젝트 그룹 정보 수정 및 그룹에 프로젝트 삽입/삭제
	@PostMapping("/safari/modifyProjectGroup")
	public String modifyProjectGroup(@RequestParam Map<String, Object> map) {
		log.debug(TeamColor.CSK + "@PostMapping addProjToProjGroup" + map);
		
		projectGroupService.modifyProjectGroup(map);
		
		return "redirect:/safari/project"; // TODO 프로젝트 그룹 선택된 페이지로 보내기 
	}
	
	@GetMapping("/safari/deleteProjectGroup")
	public String deleteProjectGroup(@RequestParam int projectGroupNo) {
		log.debug(TeamColor.CSK + "프로젝트 그룹 삭제");
		
		projectGroupService.deleteProjectGroup(projectGroupNo);
		
		return "redirect:/safari/project";
	}
}
