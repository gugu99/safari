package com.gd.safari.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.service.IWorkspaceService;
import com.gd.safari.service.WorkspaceService;
import com.gd.safari.vo.Member;
import com.gd.safari.vo.Workspace;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class WorkspaceController {

	@Autowired private IWorkspaceService workspaceService;
	// 워크스페이스생성
	@PostMapping("/addWorkspace")
	public String addWorkspace (Workspace workspace,HttpSession session) {
		log.debug(TeamColor.CJM+workspace +"Controller workspace"); // workspace 디버깅
		String adminEmail = ((Member)session.getAttribute("login")).getMemberEmail(); // session email가져와서 workspace vo에 삽입 
		workspace.setAdminEmail(adminEmail);
		int row = workspaceService.addWorkspace(workspace); // 워크스페이스 생성 메서드
		return "templete";
	}

	// 워크스페이스삭제
	@GetMapping("/removeWorkspace")
	public String removeWorkspace(@RequestParam(value = "workNo") int workNo) {
		log.debug(TeamColor.CJM+workNo +"Controller workNo"); // workNo 디버깅
		int row = workspaceService.removeWorkspace(workNo);
		return "templete";
	}
	

}
