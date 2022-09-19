package com.gd.safari.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.service.IWorkspaceMemberService;
import com.gd.safari.service.IWorkspaceService;
import com.gd.safari.vo.Member;
import com.gd.safari.vo.Workspace;
import com.gd.safari.vo.WorkspaceMember;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class WorkspaceController {

	@Autowired private IWorkspaceService workspaceService;
	@Autowired private IWorkspaceMemberService workspaceMemberService;
	
	// 워크스페이스생성폼요청
	@GetMapping("/safari/addWorkspace")
	public String addWorkspace () {
		return "workspace/addWorkspace";
	}
	// 워크스페이스생성
	@PostMapping("/safari/addWorkspace")
	public String addWorkspace (Workspace workspace,
								@RequestParam(value = "workMemberName") String workMemberName,
								HttpSession session) {
		log.debug(TeamColor.CJM+workspace +"Controller workspace"); 						 // workspace 디버깅
		log.debug(TeamColor.CJM+workMemberName +"Controller workMemberName");				 // workMemberName 디버깅
		String adminEmail = ((String)session.getAttribute("login"));						 // session email가져와서 workspace vo에 삽입 
		workspace.setAdminEmail(adminEmail);												 // workspace에 사용자 email넣기
		int row = workspaceService.addWorkspace(workspace,workMemberName);					 // 워크스페이스 생성 메서드
		return "redirect:/safari/index";													 // 인덱스로 리다이렉트
	}
	
	// 워크스페이스 메인창
	@GetMapping("/safari/workspaceMain")
	public String workspaceMain (HttpSession session,WorkspaceMember workspaceMember) {
		log.debug(TeamColor.CJM+workspaceMember +"Controller workNo"); 						// workspaceMember 디버깅
		String memberEmail = ((String)session.getAttribute("login"));						// session email가져와서 workmember vo에 삽입
		workspaceMember.setWorkMemberEmail(memberEmail);									// workspaceMember에 사용자 email넣기		
		int workMemberNo =  workspaceMemberService.getWorkspaceMemberNo(workspaceMember);	// workMemberNo 불러오는 메서드
		session.setAttribute("workNo", workspaceMember.getWorkNo());						// 세션 workNo 추가
		session.setAttribute("workMemberNo", workMemberNo);									// 세션 workspaceMember 추가
		return "redirect:/safari/project";													// projectList로 redirect
	}
	
	
	// 워크스페이스삭제
	@PostMapping("/safari/removeWorkspace")
	public String removeWorkspace(@RequestParam(value = "workNo") int workNo ,
								  Member member , 
								  HttpSession session) {
		log.debug(TeamColor.CJM+workNo +"Controller workNo"); 								// workNo 디버깅
		log.debug(TeamColor.CJM+member +"Controller memberPw"); 							// memberPw 디버깅
		String adminEmail = ((String)session.getAttribute("login"));						// session email가져와서 member vo에 삽입
		member.setMemberEmail(adminEmail);													// 관리자 이메일 삽입 
		int row = workspaceService.removeWorkspace(workNo,member);							// 워크스페이스 삭제 서비스
		return "redirect:/safari/index";													// 인덱스 forward
	}
	
	// 워크스페이스수정
		@PostMapping("/safari/modifyWorkspace")
		public String modifyWorkspace(Workspace workspace) {
			log.debug(TeamColor.CJM+workspace +"Controller workspace"); 					// workspace 디버깅
			int row = workspaceService.modifyWorkspace(workspace);							// 워크스페이스 삭제 서비스
			return "redirect:/safari/index";												// 인덱스 forward
			
		}
	
	

}
