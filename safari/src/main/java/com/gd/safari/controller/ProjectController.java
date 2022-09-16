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
import com.gd.safari.service.IProjectService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ProjectController {
	@Autowired
	private IProjectService projectService;
	
	// 전체 프로젝트 개괄, 프로젝트 추가 페이지
	@GetMapping("/safari/project")
	public String project(Model model, HttpSession session) {
		// 워크스페이스 페이지에서 세션에 담은 workspaceNo를 받아온다
		int workNo = (Integer)session.getAttribute("workNo");
		log.debug(TeamColor.CSK + workNo);
		
		Map<String, Object> map = projectService.getProjectListByWorkspace(workNo);

		// 전체 프로젝트 리스트, 워크스페이스 멤버 리스트, 프로젝트 그룹리스트
		model.addAttribute("projectList", map.get("projectList"));
		model.addAttribute("workspaceMemberList", map.get("workspaceMemberList"));
		model.addAttribute("projectGroupList", map.get("projectGroupList"));
		
		return "project/project";
	}
	
	// 프로젝트 추가
	@PostMapping("/safari/project")
	public String project(HttpSession session, @RequestParam Map<String, Object> map) {
		log.debug(TeamColor.CSK + "프로젝트 추가");
		
		// 워크스페이스 페이지에서 세션에 담은 workspaceNo를 받아온다
		int workNo = (Integer)session.getAttribute("workNo");
		map.put("workNo", workNo);
		
		log.debug(TeamColor.CSK + map);
		// log.debug(TeamColor.CSK + map.keySet()); // workNo, projectName, projectAuth, projectMemberList
		
		projectService.addProject(map);
		
		return "redirect:/safari/project";
	}
	
	// 프로젝트 그룹 추가
	@PostMapping("/safari/projectGroup")
	public String projectGroup(@RequestParam String projectGroupName) {
		log.debug(TeamColor.CSK + "프로젝트 그룹 추가");
		log.debug(TeamColor.CSK + projectGroupName);
		
		// TODO project group create

		return "redirect:/safari/project";
	}
	
	// 개별 프로젝트 요약 페이지
	@GetMapping("/safari/projectSummary")
	public String projectSummary() {
		return "project/projectSummary";
	}
	
	@GetMapping("/safari/modifyProject")
	public String modifyProject(Model model, int projectNo) {
		log.debug(TeamColor.CSK + "프로젝트 수정");
		log.debug(TeamColor.CSK + "projectNo: " + projectNo);
		
		// 프로젝트 VO, 프로젝트 멤버리스트<ProjectMember>를 반환
		Map<String, Object> map = projectService.getProjectDetailByProjectNo(projectNo);
		
		// 모델에 넣기 
		model.addAttribute("project", map.get("project"));
		model.addAttribute("memberList", map.get("memberList"));
		
		return "project/modifyProject";
	}
	
	
}
