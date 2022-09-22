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
		
		// 세션 워크넘버 가져오기
		int workNo = (Integer)session.getAttribute("workNo");								
		
		// 워크스페이스멤버 리스트 출력
		List<WorkspaceMember> list = workspaceMemberService.getWorkspaceMemberList(workNo); 
		
		// workspaceMemberList 매핑
		model.addAttribute("workspaceMemberList", list); 								   
		
		// 워크스페이스 멤버 리스트 디버깅
		log.debug(TeamColor.CJM+list +"Controller WorkspaceMemberList"); 					
		
		 // 워크스페이스멤버리스트 페이지 forward
		return "workmember/workspaceMemberList";  										   
	}
	
	@GetMapping("/safari/workspaceMemberOne")
	public String getWorkspaceMemberOne (Model model,HttpSession session) {
		int workMemberNo = (int)session.getAttribute("workMemberNo");
		
		// 워크스페이스멤버 리스트 출력메서드
		Map<String,Object> list = workspaceMemberService.getWorkspaceMemberOne(workMemberNo); 
		
		// profileImg 매핑
		model.addAttribute("profileImg",profileImgService.getProfileImgOne(workMemberNo));	  
		
		// workspaceMemberOne 매핑
		model.addAttribute("workspaceMemberOne", list); 								      
		
		// 워크스페이스 멤버 리스트 디버깅
		log.debug(TeamColor.CJM+list +"Controller workspaceMemberOne"); 					  
		
		 // 워크스페이스 멤버 리스트 디버깅
		log.debug(TeamColor.CJM+model.getAttribute("profileImg") +"Controller profileImg");  
		
		// 워크스페이스멤버 상세보기 페이지 forward
		return "workmember/workspaceMemberOne";  										      
		
	}
	@GetMapping("/safari/modifyWorkspaceMember")
	public String modifyWorkspaceMember (Model model,HttpSession session) {
		int workMemberNo = (int)session.getAttribute("workMemberNo");
		
		// 워크스페이스멤버 리스트 출력
		Map<String,Object> list = workspaceMemberService.getWorkspaceMemberOne(workMemberNo); 
		
		// profileImg 매핑
		model.addAttribute("profileImg",profileImgService.getProfileImgOne(workMemberNo));	  
		
		// workspaceMemberOne 매핑
		model.addAttribute("workspaceMemberOne", list); 								      
		
		// 워크스페이스 멤버 리스트 디버깅
		log.debug(TeamColor.CJM+list +"Controller workspaceMemberOne"); 					  
		
		// 워크스페이스 멤버 리스트 디버깅
		log.debug(TeamColor.CJM+model.getAttribute("profileImg") +"Controller profileImg");   
		
		 // 워크스페이스멤버 수정페이지 forward
		return "workmember/modifyWorkspaceMember";  										     
		
	}
	
	@PostMapping("/safari/modifyWorkspaceMember")
	public String modifyWorkspaceMember (WorkspaceMember workspaceMember ,HttpSession session,
										@RequestParam(value = "detailWorkMemeberAddr") String detailWorkMemeberAddr) {
		
		// 워크스페이스 멤버 디버깅
		log.debug(TeamColor.CJM+workspaceMember +"Controller workspaceMember"); 					  
		
		// 워크스페이스 상세주소 디버깅
		log.debug(TeamColor.CJM+detailWorkMemeberAddr +"Controller detailWorkMemeberAddr"); 		  
		
		// 세션 workMemberNo 불러오기
		int workMemberNo = (int)session.getAttribute("workMemberNo");
		
		// 워크멤버에 workMemberNo넣기
		workspaceMember.setWorkMemberNo(workMemberNo);
		
		// 워크멤버에 주소 + 상세주소넣기
		workspaceMember.setWorkMemberAddr(workspaceMember.getWorkMemberAddr()+" "+detailWorkMemeberAddr);
		
		// 워크멤버에수정메서드
		workspaceMemberService.modifyWorkspaceMember(workspaceMember);
		
		  // 워크스페이스멤버 수정페이지 forward
		return "redirect:/safari/workspaceMemberOne";  										    
		
	}
	
	@PostMapping("/safari/modifyWorkspaceMemberByInvite")
	public String modifyWorkspaceMemberByInvite (WorkspaceMember workspaceMember ,HttpSession session,
										@RequestParam(value = "detailWorkMemeberAddr") String detailWorkMemeberAddr) {
		
		// 워크스페이스 멤버 디버깅
		log.debug(TeamColor.CJM+workspaceMember +"Controller workspaceMember"); 					  
		
		// 워크스페이스 상세주소 디버깅
		log.debug(TeamColor.CJM+detailWorkMemeberAddr +"Controller detailWorkMemeberAddr"); 		  
		
		// 세션 workMemberNo 불러오기
		int workMemberNo = (int)session.getAttribute("workMemberNo");
		
		// 워크멤버에 workMemberNo넣기
		workspaceMember.setWorkMemberNo(workMemberNo);
		
		// 워크멤버에 주소 + 상세주소넣기
		workspaceMember.setWorkMemberAddr(workspaceMember.getWorkMemberAddr()+" "+detailWorkMemeberAddr);
		
		// 워크멤버에수정메서드
		workspaceMemberService.modifyWorkspaceMemberByInvite(workspaceMember);
		
		// 워크스페이스멤버 수정페이지 forward
		return "redirect:/safari/index";  										    
		
	}
	
	
}
