package com.gd.safari.controller;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.service.IMemberMailService;
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
	@Autowired private IMemberMailService memberMailService;
	
	// 워크스페이스생성폼요청
	@GetMapping("/safari/addWorkspace")
	public String addWorkspace () {
		return "workspace/addWorkspace";
	}
	// 워크스페이스생성
	@PostMapping("/safari/addWorkspace")
	public String addWorkspace (Workspace workspace,
								WorkspaceMember workspaceMember,
								HttpSession session,
								HttpServletRequest request) {
		log.debug(TeamColor.CJM+workspace +"Controller workspace"); 						 // workspace 디버깅
		log.debug(TeamColor.CJM+workspaceMember +"Controller workspaceMember");				 // workMemberName 디버깅
		String adminEmail = ((String)session.getAttribute("login"));						 // session email가져와서 workspace vo에 삽입 
		workspace.setAdminEmail(adminEmail);												 // workspace에 사용자 email넣기
		int workNo = workspaceService.addWorkspace(workspace,workspaceMember);					 // 워크스페이스 생성 메서드
		
		String[] arrayParam = request.getParameterValues("workMemberEmail");				 // email 값 배열로 보내기 
		String testEmail= arrayParam[0];
		for(String a : arrayParam) {
			log.debug(TeamColor.CJM+a +"arrayParam workspace"); 					 		 // workspace arrayParam
			}						 
		if(!(testEmail.equals(""))) {
		log.debug(TeamColor.CJM + this.getClass() + " 로그인 페이지");
		String code;
		// 꼭 예외처리를 하지 않아도 되는 익셉션을 발생시킨다.
		try {
			code = memberMailService.sendSimpleMessage(arrayParam);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
		log.debug(TeamColor.CJM + "인증코드 : " + code);
		for(String a : arrayParam) {
			log.debug(TeamColor.CJM+workNo +"워크노는 무엇일까 workspace"); 					 		 // workspace arrayParam
			workspaceMember.setWorkMemberEmail(a);
			workspaceMember.setWorkMemberCode(code);
			workspaceMemberService.inviteAddWorkspaceMember(workspaceMember);
			}						 
		
		}
		return "redirect:/safari/index";													 // 인덱스로 리다이렉트
		
	}
	
	// 워크스페이스 메인창
	@GetMapping("/safari/workspaceMain")
	public String workspaceMain (HttpSession session,WorkspaceMember workspaceMember,Model model) {
		log.debug(TeamColor.CJM+workspaceMember +"Controller workNo"); 							// workspaceMember 디버깅
		String memberEmail = ((String)session.getAttribute("login"));							// session email가져와서 workmember vo에 삽입
		workspaceMember.setWorkMemberEmail(memberEmail);										// workspaceMember에 사용자 email넣기		
		int workMemberNo =  workspaceMemberService.getWorkspaceMemberNo(workspaceMember);		// workMemberNo 불러오는 메서드
		session.setAttribute("workNo", workspaceMember.getWorkNo());							// 세션 workNo 추가
		session.setAttribute("workMemberNo", workMemberNo);										// 세션 workspaceMember 추가
		String Active = workspaceMemberService.getWorkspaceMemberOneActive(workMemberNo);
			// 활동중인지확인
		log.debug(TeamColor.CJM+Active +"Controller active"); 									// Active 디버깅
		if(Active.equals("N")) {
			model.addAttribute("active", "탈퇴한 멤버입니다.");						
			return "workspace/index"; 															// Active가 N 면 addWorkspaceMember폼으로
		}else if (Active.equals("W")){
			return "workmember/addWorkspaceMember";										// Active가 W 면 Index로
		}
		return "redirect:/safari/project";														// projectList로 redirect
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
