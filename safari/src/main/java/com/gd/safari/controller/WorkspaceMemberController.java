package com.gd.safari.controller;

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
import com.gd.safari.service.IProfileImgService;
import com.gd.safari.service.IWorkspaceMemberService;
import com.gd.safari.service.IWorkspaceService;
import com.gd.safari.vo.Workspace;
import com.gd.safari.vo.WorkspaceMember;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class WorkspaceMemberController {
	@Autowired private IWorkspaceMemberService workspaceMemberService;
	@Autowired private IProfileImgService profileImgService;
	@Autowired private IWorkspaceService workspaceService;
	@Autowired private IMemberMailService memberMailService;
	

	
	
	// 워크스페이스멤버 리스트 띄우기
	@GetMapping("/safari/workspaceMemberList")
	public String workspaceMemberList (Model model,HttpSession session) {
		
		// 세션 워크넘버 가져오기
		int workNo = (Integer)session.getAttribute("workNo");								
		
		// 워크스페이스멤버 리스트 출력
		List<WorkspaceMember> list = workspaceMemberService.getWorkspaceMemberList(workNo); 
		
		// 워크스페이스멤버 레벨 가져오기
		int workMemberLevel = (int)session.getAttribute("workMemberLevel");
		
		// workspaceMemberList 매핑
		model.addAttribute("workspaceMemberList", list); 								   
		
		// workMemberLevel 매핑
		model.addAttribute("workMemberLevel",workMemberLevel);
		
		// workNo 매핑
		model.addAttribute("workNo",workNo);
		
		// 워크스페이스 멤버 리스트 디버깅
		log.debug(TeamColor.CJM+list +"Controller WorkspaceMemberList"); 					
		
		 // 워크스페이스멤버리스트 페이지 forward
		return "workmember/workspaceMemberList";  										   
	}
	
	// 워크스페이스멤버 상세정보
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
	
	// 워크스페이스멤버 수정폼
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
	
	// 워크스페이스 멤버 수정하기
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
		
		  // 워크스페이스멤버 상세보기로 리다이렉트
		return "redirect:/safari/workspaceMemberOne";  										    
		
	}
	
	// 워크스페이스 초대된멤버 처음입장 할떄 정보수정
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
		
		// 워크스페이스멤버 index로이동
		return "redirect:/safari/index";  										    
		
	}
	
	// 워크스페이스 멤버 레벨 조정
	@PostMapping("/safari/modifyWorkspaceMemberByLevel")
	public String modifyWorkspaceMemberByLevel (WorkspaceMember workspaceMember) {
		
		// 워크스페이스 멤버 디버깅
		log.debug(TeamColor.CJM+workspaceMember +"Controller workspaceMember"); 					  
		
		// 워크멤버 레벨 수정메서드
		workspaceMemberService.modifyWorkspaceMemberByLevel(workspaceMember);
		
		// 워크스페이스멤버 멤버리스트 리다이렉트
		return "redirect:/safari/workspaceMemberList";  										    
		
	}
	
	// 워크스페이스 멤버 활동정지시키기
	@PostMapping("/safari/modifyWorkspaceMemberByActive")
	public String modifyWorkspaceMemberByActive (@RequestParam(value = "workMemberNo") int workMemberNo) {
		
		// 워크스페이스 넘버 디버깅
		log.debug(TeamColor.CJM+workMemberNo +"Controller workMemberNo"); 					  
		
		// 워크멤버 레벨 수정메서드
		workspaceMemberService.modifyWorkspaceMemberByActive(workMemberNo);
		
		// 워크스페이스멤버 멤버리스트 리다이렉트
		return "redirect:/safari/workspaceMemberList";  										    
		
	}
	
	// 워크스페이스생성
		@PostMapping("/safari/addWorkspaceMemberByInvite")
		public String addWorkspaceMemberByInvite( WorkspaceMember workspaceMember, HttpSession session,
				@RequestParam(value="workMemberEmail",required = false) String[] workMemberEmail) {
				
			// workspaceMember 디버깅
			log.debug(TeamColor.CJM + workspaceMember + "Controller workspaceMember"); 			
			
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
				workspaceMember.setWorkMemberCode(code);
				workspaceMemberService.inviteAddWorkspaceMember(workspaceMember,workMemberEmail);
				
			}
			// 인덱스로 리다이렉트
			return "redirect:/safari/workspaceMemberList"; 

		}
	
	
	
}
