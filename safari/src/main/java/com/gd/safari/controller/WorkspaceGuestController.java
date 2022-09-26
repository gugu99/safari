package com.gd.safari.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.service.IMemberMailService;
import com.gd.safari.service.IWorkspaceGuestService;
import com.gd.safari.vo.WorkspaceGuest;
import com.gd.safari.vo.WorkspaceMember;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class WorkspaceGuestController {
	@Autowired private IWorkspaceGuestService workspaceGuestService;
	@Autowired private IMemberMailService memberMailService;
	// 워크스페이스게스트 초대
	@PostMapping("/safari/addWorkspaceGuestByInvite")
	public String addWorkspaceGuestByInvite(WorkspaceGuest workspaceGuest,
			@RequestParam(value = "memberEmail", required = false) String[] memberEmail) {

		// workspaceMember 디버깅
		log.debug(TeamColor.CJM + workspaceGuest + "Controller workspaceGuest");

		// workspace workMemberEmail배열 디버깅
		log.debug(TeamColor.CJM + Arrays.toString(memberEmail) + "workMemberEmail workspace");

		// workMemberEmail null 배열 확인
		int emailLength = memberEmail.length;

		// 메일 전송하는 메서드
		if (emailLength != 0) {
			log.debug(TeamColor.CJM + this.getClass() + " 로그인 페이지");
			String code;
			// 꼭 예외처리를 하지 않아도 되는 익셉션을 발생시킨다.
			code = memberMailService.sendSimpleMessage(memberEmail);
			log.debug(TeamColor.CJM + "인증코드 : " + code);
			workspaceGuest.setWorkGuestCode(code);
			workspaceGuestService.addWorkspaceGuestByInvite(workspaceGuest, memberEmail);

		}
		// 인덱스로 리다이렉트
		return "redirect:/safari/workspaceMemberList";

	}
	@GetMapping("/safari/workspaceGuestList")
	public String workspaceMemberList (Model model,HttpSession session,
										WorkspaceGuest workspaceGuest) {
		
		// 세션 워크넘버 가져오기
		int workNo = (Integer)session.getAttribute("workNo");	
		
		// 워크스페이스에 워크넘버 넣기
		workspaceGuest.setWorkNo(workNo);
		
		// 워크스페이스멤버 리스트 출력
		List<WorkspaceMember> list = workspaceGuestService.getWorkspaceGuestList(workspaceGuest); 
		
		// 워크스페이스멤버 레벨 가져오기
		int workMemberLevel = (int)session.getAttribute("workMemberLevel");
		
		// workspaceGuestList 매핑
		model.addAttribute("workspaceGuestList", list); 								   
		
		// workMemberLevel 매핑
		model.addAttribute("workMemberLevel",workMemberLevel);
		
		// workNo 매핑
		model.addAttribute("workNo",workNo);
		
		// 워크스페이스 멤버 리스트 디버깅
		log.debug(TeamColor.CJM+list +"Controller WorkspaceGuestList"); 					
		
		 // 워크스페이스멤버리스트 페이지 forward
		return "workmember/workspaceGuestList";  										   
	}
}
