package com.gd.safari.controller;


import java.util.Arrays;

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

	@Autowired
	private IWorkspaceService workspaceService;
	@Autowired
	private IWorkspaceMemberService workspaceMemberService;
	@Autowired
	private IMemberMailService memberMailService;

	// 워크스페이스생성폼요청
	@GetMapping("/safari/addWorkspace")
	public String addWorkspace() {
		return "workspace/addWorkspace";
	}

	// 워크스페이스생성
	@PostMapping("/safari/addWorkspace")
	public String addWorkspace(Workspace workspace, WorkspaceMember workspaceMember, HttpSession session,
			@RequestParam(value="workMemberEmail",required = false) String[] workMemberEmail,
			@RequestParam(value="detailWorkMemeberAddr") String detailWorkMemeberAddr) {
		// workspace 디버깅
		log.debug(TeamColor.CJM + workspace + "Controller workspace");			

		// workspaceMember 디버깅
		log.debug(TeamColor.CJM + workspaceMember + "Controller workspaceMember"); 			
		
		// session email가져와서 workspace vo에 삽입
		String adminEmail = ((String) session.getAttribute("login")); 			
		
		// workspace에 사용자 email넣기
		workspace.setAdminEmail(adminEmail); 												 
		
		// 주소와 상세주소 set
		workspaceMember.setWorkMemberAddr(workspaceMember.getWorkMemberAddr()+" "+detailWorkMemeberAddr); 
		
		// 워크스페이스 생성 메서드
		int workNo = workspaceService.addWorkspace(workspace, workspaceMember); 			
		
		// workspace workMemberEmail배열 디버깅
		log.debug(TeamColor.CJM + Arrays.toString(workMemberEmail) + "workMemberEmail workspace");
		
		// workMemberEmail null 배열 확인
		int emailLength =workMemberEmail.length;
		
		// 메일 전송하는 메서드
		if (emailLength!=0) {
			log.debug(TeamColor.CJM + this.getClass() + " 로그인 페이지");
			String code;
			// 꼭 예외처리를 하지 않아도 되는 익셉션을 발생시킨다.
			code = memberMailService.sendSimpleMessage(workMemberEmail);
			log.debug(TeamColor.CJM + "인증코드 : " + code);
			workspaceMember.setWorkMemberNo(workNo);
			workspaceMember.setWorkMemberCode(code);
			workspaceMemberService.inviteAddWorkspaceMember(workspaceMember,workMemberEmail);
			
		}
		// 인덱스로 리다이렉트
		return "redirect:/safari/index"; 

	}

	// 워크스페이스 메인창
	@GetMapping("/safari/workspaceMain")
	public String workspaceMain(HttpSession session, WorkspaceMember workspaceMember, Model model) {
		// workspaceMember 디버깅
		log.debug(TeamColor.CJM + workspaceMember + "Controller workspaceMember"); 
		
		// session email가져와서 workmember vo에 삽입
		String memberEmail = ((String) session.getAttribute("login")); 
		
		// workspaceMember에 사용자 email넣기
		workspaceMember.setWorkMemberEmail(memberEmail); 
		
		// workMemberNo 불러오는 메서드
		int workMemberNo = workspaceMemberService.getWorkspaceMemberNo(workspaceMember); 
		
		// workMemberLevel 불러오는 메서드
		int workMemberLevel = workspaceMemberService.getWorkspaceMemberLevel(workspaceMember);
		
		// 세션 workNo 추가
		session.setAttribute("workNo", workspaceMember.getWorkNo()); 
		
		// 세션 workspaceMember 추가
		session.setAttribute("workMemberNo", workMemberNo); 
		
		// 활동여부 만들기
		String Active = workspaceMemberService.getWorkspaceMemberOneActive(workMemberNo);
		
		// 세션 workspaceMemberLevel 추가
		session.setAttribute("workMemberLevel", workMemberLevel);
		
		// 활동중인지확인
		// Active 디버깅
		log.debug(TeamColor.CJM + Active + "Controller active"); 
		if (Active.equals("N")) {
			model.addAttribute("active", "탈퇴한 멤버입니다.");
		// Active가 N 면 addWorkspaceMember폼으로
			return "redirect:/safari/index"; 
			
		} else if (Active.equals("W")) {
			
		// Active가 W 면 Index로
			return "workmember/addWorkspaceMember"; 
		}
		
		// projectList로 redirect
		return "redirect:/safari/project"; 
	}

	// 워크스페이스삭제
	@PostMapping("/safari/removeWorkspace")
	public String removeWorkspace(@RequestParam(value = "workNo") int workNo, Member member, HttpSession session) {
		// workNo 디버깅
		log.debug(TeamColor.CJM + workNo + "Controller workNo"); 
		
		// memberPw 디버깅
		log.debug(TeamColor.CJM + member + "Controller memberPw"); 
		
		// session email가져와서 member vo에 삽입
		String adminEmail = ((String) session.getAttribute("login")); 
		
		// 관리자 이메일 삽입
		member.setMemberEmail(adminEmail); 
		
		// 워크스페이스 삭제 서비스
		int row = workspaceService.removeWorkspace(workNo, member); 
		
		// 인덱스 forward
		return "redirect:/safari/index"; 
	}

	// 워크스페이스수정
	@PostMapping("/safari/modifyWorkspace")
	public String modifyWorkspace(Workspace workspace) {
		
		// workspace 디버깅
		log.debug(TeamColor.CJM + workspace + "Controller workspace"); 
		
		// 워크스페이스 수정 서비스
		int row = workspaceService.modifyWorkspace(workspace); 
		
		// 인덱스 forward
		return "redirect:/safari/index"; 

	}
	
	//워크스페이스 관리자 변경
	@PostMapping("/safari/modifyWorkspaceAdmin")
	public String modifyWorkspaceAdmin(Workspace workspace,WorkspaceMember workspaceMember,
										HttpSession session) {
		
		// workspace 디버깅
		log.debug(TeamColor.CJM + workspace + "Controller workspace");
		
		// workspaceMember 디버깅
		log.debug(TeamColor.CJM + workspaceMember + "Controller workspaceMember");
		
		// session에서 현재워크스페이스 넘버 가져오기
		int workNo = (Integer)session.getAttribute("workNo");
		
		// workspace vo 에 바뀔 workspace 넘버 넣기
		
		workspace.setWorkNo(workNo);
		
		// session에서 현재관리자 워크스페이스넘버 가져오기
		int workMemberNo = (int)session.getAttribute("workMemberNo");
		
		// 워크스페이스 수정 서비스 과거 관리자 레벨 받아오기
		int lastAdminLevel = workspaceService.modifyWorkspaceAdminEmail(workspace,workspaceMember,workMemberNo); 
		log.debug(TeamColor.CJM + lastAdminLevel + "Controller lastAdminLevel");
		
		// session에 레벨 조정 하기
		session.setAttribute("workMemberLevel", 1);
		
		// 워크스페이스리스트로 리다이렉트
		return "redirect:/safari/workspaceMemberList"; 

	}

}
