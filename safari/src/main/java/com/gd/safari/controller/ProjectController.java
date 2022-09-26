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
import com.gd.safari.vo.ProjectForm;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ProjectController {
	@Autowired
	private IProjectService projectService;
	
	// 전체 프로젝트 개관, 프로젝트 추가 페이지
	@GetMapping("/safari/project")
	public String project(Model model, HttpSession session, @RequestParam Map<String, Object> paramMap) {
		// paramMap: section(프로젝트 정렬 값), projectGroupNo(프로젝트 그룹 리스트)
		log.debug(TeamColor.CSK + "paramMap: " + paramMap);
		log.debug(TeamColor.CSK + "paramMap.keyset: " + paramMap.keySet());

		// 세션의 workNo, workspaceNo를 paramMap에 넣기
		paramMap.put("workNo", session.getAttribute("workNo"));
		paramMap.put("workMemberNo", session.getAttribute("workMemberNo"));
		
		// MyBatis 동적쿼리로 보여줄 리스트 반환
		Map<String, Object> map = projectService.getProjectListByWorkspace(paramMap);
		log.debug(TeamColor.CSK + "map " + map.keySet());
		log.debug(TeamColor.CSK + "map " + map);

		// 모델에 담기
		model.addAttribute("projectList", map.get("projectList")); // 전체 프로젝트 리스트
		model.addAttribute("workspaceMemberList", map.get("workspaceMemberList")); // 워크스페이스 멤버 리스트
		model.addAttribute("projectGroupList", map.get("projectGroupList")); // 프로젝트 그룹리스트
		model.addAttribute("workMemberNo", (int)session.getAttribute("workMemberNo")); // 프로젝트 생성자가 프로젝트 멤버로 바로 삽입되게 하기 위함
		model.addAttribute("title", map.get("title")); // 검색, 정렬 기준에 따른 부제목
		
		return "project/project";
	}
	
	// 프로젝트 추가
	@PostMapping("/safari/project")
	public String project(HttpSession session, ProjectForm projectForm) {
		log.debug(TeamColor.CSK + "프로젝트 추가");
		log.debug(TeamColor.CSK + "projectForm" + projectForm);
		
		projectService.addProject(projectForm);
		
		return "redirect:/safari/project";
	}
	
	// 개별 프로젝트 요약 페이지
	@GetMapping("/safari/projectSummary")
	public String projectSummary(HttpSession session) {
		int workNo = (int) session.getAttribute("workNo");
		
		projectService.getProjectSummary(workNo);
		
		return "project/projectSummary";
	}
	
	@GetMapping("/safari/modifyProject")
	public String modifyProject(Model model, HttpSession session, int projectNo) {
		log.debug(TeamColor.CSK + "프로젝트 수정 폼");
		log.debug(TeamColor.CSK + "projectNo: " + projectNo);
		
		model.addAttribute("projectNo", projectNo);
		return "project/modifyProject";
	}
	
	// 수정: RestProjectMapper
	
	// 삭제 메소드가 들어올 자리
	
	// 프로젝트 즐겨찾기
	// ${pageContext.request.contextPath}/safari/projectLike?projectNo=${p.projectNo}?projectLike=${p.projectLike}
	@GetMapping("/safari/projectBookmark")
	public String projectBookmark(HttpSession session, @RequestParam Map<String, Object> map) {
		log.debug(TeamColor.CSK + "프로젝트 즐겨찾기");
		log.debug(TeamColor.CSK + "map: " + map);
		
		// 세션에 저장한 workMemberNo를 받아온다
		map.put("workMemberNo", session.getAttribute("workMemberNo"));
		
		projectService.addOrRemoveProjectBookmark(map);
		
		// projectBookmark의 값이 빈 문자열이면 insert 대상
		// 북마크에 새로 추가되었으므로 북마크된 프로젝트 페이지를 리턴
		if("".equals(map.get("projectBookmark"))) {
			return "redirect:/safari/project?section=bookmark";
		}
		
		// 북마크에서 삭제된 경우 전체 프로젝트 페이지를 리턴
		return "redirect:/safari/project";
	}
}
