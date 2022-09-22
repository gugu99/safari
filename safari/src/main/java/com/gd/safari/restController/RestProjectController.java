package com.gd.safari.restController;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gd.safari.service.IProjectService;


@RestController
public class RestProjectController {
	@Autowired 
	private IProjectService projectService;
	
	@GetMapping("/safari/restModifyProject")
	public Map<String, Object> restModifyProject(HttpSession session, int projectNo) {
		// 세션에 저장해놓은 workspace no를 받아온다
		int workNo = (int)session.getAttribute("workNo");
		
		// project, projectManagerList, projectMemberList를 반환
		return projectService.getProjectDetailByProjectNo(workNo, projectNo);
	}

}
