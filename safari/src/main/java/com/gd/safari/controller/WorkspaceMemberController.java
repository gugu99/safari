package com.gd.safari.controller;

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
import com.gd.safari.service.IProfileImgService;
import com.gd.safari.service.IWorkspaceMemberService;
import com.gd.safari.vo.WorkspaceMember;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class WorkspaceMemberController {
	@Autowired private IWorkspaceMemberService workspaceMemberService;
	@Autowired private IProfileImgService profileImgService;
	
	@GetMapping("/safari/workspaceMemberList")
	public String workspaceMemberList (Model model,HttpSession session) {
		int workNo = (Integer)session.getAttribute("workNo");								// 세션 워크넘버 가져오기
		List<WorkspaceMember> list = workspaceMemberService.getWorkspaceMemberList(workNo); // 워크스페이스멤버 리스트 출력
		model.addAttribute("workspaceMemberList", list); 								    // workspaceMemberList 매핑
		log.debug(TeamColor.CJM+list +"Controller WorkspaceMemberList"); 					// 워크스페이스 멤버 리스트 디버깅
		
		return "workmember/workspaceMemberList";  										    // 워크스페이스멤버리스트 페이지 forward
	}
	
	@GetMapping("/safari/workspaceMemberOne")
	public String getWorkspaceMemberOne (Model model,HttpSession session) {
		int workMemberNo = (int)session.getAttribute("workMemberNo");
		
		Map<String,Object> list = workspaceMemberService.getWorkspaceMemberOne(workMemberNo); // 워크스페이스멤버 리스트 출력
		model.addAttribute("profileImg",profileImgService.getProfileImgOne(workMemberNo));	  // profileImg 매핑
		model.addAttribute("workspaceMemberOne", list); 								      // workspaceMemberOne 매핑
		log.debug(TeamColor.CJM+list +"Controller workspaceMemberOne"); 					  // 워크스페이스 멤버 리스트 디버깅
		log.debug(TeamColor.CJM+model.getAttribute("profileImg") +"Controller profileImg");   // 워크스페이스 멤버 리스트 디버깅
		return "workmember/workspaceMemberOne";  										      // 워크스페이스멤버 상세보기 페이지 forward
		
	}
	@GetMapping("/safari/modifyWorkspaceMember")
	public String modifyWorkspaceMember (Model model,HttpSession session) {
		int workMemberNo = (int)session.getAttribute("workMemberNo");
		Map<String,Object> list = workspaceMemberService.getWorkspaceMemberOne(workMemberNo); // 워크스페이스멤버 리스트 출력
		model.addAttribute("profileImg",profileImgService.getProfileImgOne(workMemberNo));	  // profileImg 매핑
		model.addAttribute("workspaceMemberOne", list); 								      // workspaceMemberOne 매핑
		log.debug(TeamColor.CJM+list +"Controller workspaceMemberOne"); 					  // 워크스페이스 멤버 리스트 디버깅
		log.debug(TeamColor.CJM+model.getAttribute("profileImg") +"Controller profileImg");   // 워크스페이스 멤버 리스트 디버깅
		return "workmember/modifyWorkspaceMember";  										      // 워크스페이스멤버 수정페이지 forward
		
	}
	
	@PostMapping("/safari/modifyWorkspaceMember")
	public String modifyWorkspaceMember (WorkspaceMember workspaceMember ,HttpSession session,
										@RequestParam(value = "detailWorkMemeberAddr") String detailWorkMemeberAddr) {
		log.debug(TeamColor.CJM+workspaceMember +"Controller workspaceMember"); 					  // 워크스페이스 멤버 디버깅
		log.debug(TeamColor.CJM+detailWorkMemeberAddr +"Controller detailWorkMemeberAddr"); 		  // 워크스페이스 상세주소 디버깅
		int workMemberNo = (int)session.getAttribute("workMemberNo");
		workspaceMember.setWorkMemberNo(workMemberNo);
		if(detailWorkMemeberAddr !=null) {
		workspaceMember.setWorkMemberAddr(workspaceMember.getWorkMemberAddr()+" "+detailWorkMemeberAddr);}
		workspaceMemberService.modifyWorkspaceMember(workspaceMember);
		return "redirect:/safari/workspaceMemberOne";  										      // 워크스페이스멤버 수정페이지 forward
		
	}
	
	
}
