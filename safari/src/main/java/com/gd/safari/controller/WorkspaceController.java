package com.gd.safari.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.service.IWorkspaceService;
import com.gd.safari.vo.Member;
import com.gd.safari.vo.Workspace;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class WorkspaceController {

	@Autowired private IWorkspaceService workspaceService;
	// 워크스페이스생성
	@PostMapping("/safari/addWorkspace")
	public String addWorkspace (@RequestParam(value = "workName") String workName,
								@RequestParam(value = "workMemberName") String workMemberName,
								HttpSession session) {
		Workspace workspace = new Workspace();
		log.debug(TeamColor.CJM+workName +"Controller workName"); // workName 디버깅
		log.debug(TeamColor.CJM+workMemberName +"Controller workMemberName"); // workMemberName 디버깅
		String adminEmail = ((Member)session.getAttribute("login")).getMemberEmail(); // session email가져와서 workspace vo에 삽입 
		workspace.setAdminEmail(adminEmail);
		workspace.setWorkName(workName);
		int row = workspaceService.addWorkspace(workspace,workMemberName); // 워크스페이스 생성 메서드
		return "redirect:/safari/index";
	}
	
	@GetMapping("/safari/workspaceMain")
	public String workspaceIndex (HttpSession session,@RequestParam(value = "workNo") int workNo) {
		session.setAttribute("workNo", workNo);
		return "workspace/workspaceMain";
	}
	
	
	// 워크스페이스삭제
	@GetMapping("/safari/removeWorkspace")
	public String removeWorkspace(@RequestParam(value = "workNo") int workNo) {
		log.debug(TeamColor.CJM+workNo +"Controller workNo"); // workNo 디버깅
		int row = workspaceService.removeWorkspace(workNo);
		return "redirect:/safari/index";
	}
	

	
	

}
