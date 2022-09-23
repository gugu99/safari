package com.gd.safari.restController;

import java.util.Arrays;
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
import com.gd.safari.vo.ProjectForm;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class RestProjectController {
	@Autowired 
	private IProjectService projectService;
	@Autowired
	private IProjectMemberService projectMemberService;
	
	@GetMapping("/safari/restModifyProject")
	public Map<String, Object> restModifyProject(HttpSession session, int projectNo) {
		// 세션에 저장해놓은 workspace no를 받아온다
		int workNo = (int)session.getAttribute("workNo");
		
		// project, projectManagerList, projectMemberList를 반환
		return projectService.getProjectDetailByProjectNo(workNo, projectNo);
	}
	
	@PutMapping("/safari/modifyProject")
	public Project restModifyProject(HttpSession session, @RequestParam Map<String, Object> map){
		log.debug(TeamColor.CSK + "map: " + map);
		map.put("workNo", (int)session.getAttribute("workNo"));
		return projectService.modifyProject(map);
	}
	
	@PutMapping("/safari/modifyMember")
	public Map<String, Object> restModifyMember(HttpSession session, ProjectMember projectMember){
		log.debug(TeamColor.CSK + "projectMember: " + projectMember);
		int workNo = (int)session.getAttribute("workNo");
		
		Map<String, Object> map = projectMemberService.modifyProjectMember(workNo, projectMember);
		log.debug(TeamColor.CSK + "map: " + map);

		return map;
	}

}
