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
	public String addWorkspace (@RequestParam(value = "workName") String workName,
								@RequestParam(value = "workMemberName") String workMemberName,
								HttpSession session) {
		Workspace workspace = new Workspace();
		log.debug(TeamColor.CJM+workName +"Controller workName"); 						 	 // workName 디버깅
		log.debug(TeamColor.CJM+workMemberName +"Controller workMemberName");				 // workMemberName 디버깅
		String adminEmail = ((Member)session.getAttribute("login")).getMemberEmail();		 // session email가져와서 workspace vo에 삽입 
		workspace.setAdminEmail(adminEmail);
		workspace.setWorkName(workName);
		int row = workspaceService.addWorkspace(workspace,workMemberName);					 // 워크스페이스 생성 메서드
		return "redirect:/safari/index";
	}
	
	// 워크스페이스 메인창
	@GetMapping("/safari/workspaceMain")
	public String workspaceIndex (HttpSession session,@RequestParam(value = "workNo") int workNo) {
		log.debug(TeamColor.CJM+workNo +"Controller workNo"); 								// workNo 디버깅
		String memberEmail = ((Member)session.getAttribute("login")).getMemberEmail(); 		// session email가져와서 workmember vo에 삽입
		WorkspaceMember workspaceMember = new WorkspaceMember();					   		// 워크스페이스 멤버 workNo, member Email 삽입
		workspaceMember.setWorkNo(workNo);
		workspaceMember.setWorkMemberEmail(memberEmail);
		int workMemberNo =  workspaceMemberService.getWorkspaceMemberNo(workspaceMember);	// workMemberNo 불러오는 메서드
		session.setAttribute("workNo", workNo);												// 세션 workNo 추가
		session.setAttribute("workMemberNo", workMemberNo);							// 세션 workspaceMember 추가
		return "workspace/workspaceMain";
	}
	
	
	// 워크스페이스삭제
	@GetMapping("/safari/removeWorkspace")
	public String removeWorkspace(@RequestParam(value = "workNo") int workNo ,
								  @RequestParam(value = "memberPw") String memberPw , 
								  HttpSession session) {
		log.debug(TeamColor.CJM+workNo +"Controller workNo"); 								// workNo 디버깅
		log.debug(TeamColor.CJM+memberPw +"Controller memberPw"); 							// memberPw 디버깅
		Member member = new Member();
		String adminEmail = ((Member)session.getAttribute("login")).getMemberEmail(); 		// session email가져와서 member vo에 삽입
		member.setMemberEmail(adminEmail);													// 관리자 이메일 삽입 
		member.setMemberPw(memberPw);														// 관리자 비밀번호 삽입
		int row = workspaceService.removeWorkspace(workNo,member);							// 워크스페이스 삭제 서비스
		return "redirect:/safari/index";
	}
	

	
	

}
