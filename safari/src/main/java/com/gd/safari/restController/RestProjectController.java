package com.gd.safari.restController;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.service.IProjectMemberService;
import com.gd.safari.service.IProjectService;
import com.gd.safari.vo.Project;
import com.gd.safari.vo.ProjectMember;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class RestProjectController {
	@Autowired 
	private IProjectService projectService;
	@Autowired
	private IProjectMemberService projectMemberService;
	
	@GetMapping("/member/restModifyProject")
	public Map<String, Object> restModifyProject(HttpSession session, int projectNo) {
		// 세션에 저장해놓은 workspace no를 받아온다
		int workNo = (int)session.getAttribute("workNo");
		
		// project, projectManagerList, projectMemberList를 반환
		return projectService.getProjectDetailByProjectNo(workNo, projectNo);
	}
	
	@PutMapping("/member/modifyProject")
	public Project restModifyProject(HttpSession session, @RequestParam Map<String, Object> map){
		map.put("workNo", (int)session.getAttribute("workNo"));
		map.put("workMemberName", (String)session.getAttribute("workMemberName"));
		
		log.debug(TeamColor.CSK + "프로젝트 수정");
		log.debug(TeamColor.CSK + "map: " + map);
		
		return projectService.modifyProject(map);
	}
	
	@PutMapping("/member/modifyMember")
	public List<Map<String, Object>> restModifyMember(HttpSession session, ProjectMember projectMember){
		// 앞단에서 차집합을 구현하여 변동이 일어난 멤버만 받아온다
		log.debug(TeamColor.CSK + "projectMember: " + projectMember);
		int workNo = (int)session.getAttribute("workNo");
		
		return projectMemberService.modifyProjectMember(workNo, projectMember);
	}
	
	@GetMapping("/member/projectSummaryChart")
	public Map<String, Object> projectSummaryChart(HttpSession session){
		int workNo = (int)session.getAttribute("workNo");
		
		return projectService.getProjectSummaryChart(workNo);
	}
}
