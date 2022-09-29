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
import com.gd.safari.vo.ProjectGroup;
import com.gd.safari.vo.ProjectGroupForm;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ProjectGroupController {
	@Autowired
	private IProjectGroupService projectGroupService;
	
	// 프로젝트 그룹 추가
	@PostMapping("/member/projectGroup")
	public String projectGroup(HttpSession session, ProjectGroup projectGroup) {
		log.debug(TeamColor.CSK + "프로젝트 그룹 추가");
		projectGroup.setWorkNo((int)session.getAttribute("workNo"));
		log.debug(TeamColor.CSK + projectGroup);

		projectGroupService.addProjectGroup(projectGroup);

		return "redirect:/member/project";
	}
	
	// 프로젝트 그룹 수정 폼 띄우기
	@GetMapping("/member/modifyProjectGroup")
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
	@PostMapping("/member/modifyProjectGroup")
	public String modifyProjectGroup(ProjectGroupForm projectGroupForm) {
		log.debug(TeamColor.CSK + "프로젝트 그룹 수정: " + projectGroupForm);
		
		projectGroupService.modifyProjectGroup(projectGroupForm);
		
		return "redirect:/member/project?projectGroupNo=" + projectGroupForm.getProjectGroupNo();
	}
	
	// 프로젝트 그룹 삭제
	@GetMapping("/member/deleteProjectGroup")
	public String deleteProjectGroup(@RequestParam int projectGroupNo) {
		log.debug(TeamColor.CSK + projectGroupNo + "번 프로젝트 그룹 삭제");
		
		projectGroupService.deleteProjectGroup(projectGroupNo);
		
		return "redirect:/member/project";
	}
}
