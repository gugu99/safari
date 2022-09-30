package com.gd.safari.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

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
	@PostMapping("/member/addWorkspaceGuestByInvite")
	public String addWorkspaceGuestByInvite(WorkspaceGuest workspaceGuest,
			@RequestParam(value = "memberEmail1", required = false) String[] memberEmail1) {

		// workspaceMember 디버깅
		log.debug(TeamColor.CJM + workspaceGuest + "Controller workspaceGuest");

		// workspace workMemberEmail배열 디버깅
		log.debug(TeamColor.CJM + Arrays.toString(memberEmail1) + "workMemberEmail workspace");

		// workMemberEmail null 배열 확인
		int emailLength = memberEmail1.length;

		// 메일 전송하는 메서드
		if (emailLength != 0) {
			log.debug(TeamColor.CJM + this.getClass() + " 로그인 페이지");
			String code;
			// 꼭 예외처리를 하지 않아도 되는 익셉션을 발생시킨다.
			code = memberMailService.sendSimpleMessage(memberEmail1);
			log.debug(TeamColor.CJM + "인증코드 : " + code);
			workspaceGuest.setWorkGuestCode(code);
			workspaceGuestService.addWorkspaceGuestByInvite(workspaceGuest, memberEmail1);

		}
		// 인덱스로 리다이렉트
		return "redirect:/member/workspaceGuestList";

	}
	
	// 워크스페이스게스트 정렬 리스트
	@GetMapping("/member/workspaceGuestList")
	public String workspaceMemberList (Model model,HttpSession session,
			@RequestParam Map<String,Object> map) {
		
		// 세션 워크넘버 가져오기
		int workNo = (Integer)session.getAttribute("workNo");	
		
		// 워크스페이스에 워크넘버 넣기
		map.put("workNo", workNo);
		
		// 워크스페이스멤버 리스트 출력
		List<WorkspaceMember> list = workspaceGuestService.getWorkspaceGuestList(map); 
		
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
		
		// 멤버 및 Guest 명수 가져오기
		ArrayList<Integer> count = workspaceGuestService.getWorkspaceGuestCount(workNo);
		
		model.addAttribute("allMemberCount", count.get(0));
		model.addAttribute("WMemberCount", count.get(1));
		model.addAttribute("NMemberCount", count.get(2));
		model.addAttribute("allGuestCount", count.get(3));
		model.addAttribute("NGuestCount", count.get(4));
		model.addAttribute("WGuestCount", count.get(5));
		 // 워크스페이스멤버리스트 페이지 forward
		return "workmember/workspaceGuestList";  										   
	}
	
	// 워크스페이스 게스트 추방
	@PostMapping("/member/modifyWorkspaceGuestByActive")
	public String modifyWorkspaceGuestByActive(WorkspaceGuest workspaceGuest) {
			
		// workspaceMember 디버깅
		log.debug(TeamColor.CJM + workspaceGuest + "Controller workspaceGuest");
		
		// 워크스페이스 게스트 추방
		workspaceGuestService.modifyWorkspaceGuestByActive(workspaceGuest);
		
		// 게스트리스트로 리다이렉트
		return "redirect:/member/workspaceGuestList";

	}
	
	// 워크스페이스 게스트 승인
	@PostMapping("/member/modifyWorkspaceGuestActiveApprove")
	public String modifyWorkspaceGuestActiveApprove(WorkspaceGuest workspaceGuest) {
				
			// workspaceMember 디버깅
			log.debug(TeamColor.CJM + workspaceGuest + "Controller workspaceGuest");
			
			// 워크스페이스 게스트 승인
			workspaceGuestService.modifyWorkspaceGuestActiveApprove(workspaceGuest);
			
			// 게스트리스트로 리다이렉트
			return "redirect:/member/workspaceGuestList";

	}
	
	// 워크스페이스 게스트 코드인증 메서드
	@PostMapping("/member/updateWorkspaceGuestCodeNull")
	public String updateWorkspaceGuestCodeNull(WorkspaceGuest workspaceGuest,HttpSession session) {
				
			// workspaceMember 디버깅
			log.debug(TeamColor.CJM + workspaceGuest + "Controller workspaceGuest");
			
			// 세션에서 어드민 이메일 가져오기
			String adminEmail = ((String) session.getAttribute("login"));
			
			// 세션에서 워크스페이스넘버 가져오기
			int workNo = (Integer)session.getAttribute("workNo");
		
			// 워크스페이스 게스트 넘버 넣어주기
			workspaceGuest.setWorkNo(workNo);
			
			// 워크스페이스 게스트 이메일 넣어주기
			workspaceGuest.setMemberEmail(adminEmail);
			
			// 워크스페이스 게스트 승인
			workspaceGuestService.updateWorkspaceGuestCodeNull(workspaceGuest);
			
			// 게스트리스트로 리다이렉트
			return "redirect:/safari/index";

		}
	
	
	
}
