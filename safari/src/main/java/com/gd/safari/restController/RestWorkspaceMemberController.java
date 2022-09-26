package com.gd.safari.restController;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.service.IWorkspaceMemberService;
import com.gd.safari.vo.WorkspaceMember;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class RestWorkspaceMemberController {
	@Autowired private IWorkspaceMemberService workspaceMemberService;
	
	// 아이디에 맞는 Code 가져오기
	@PostMapping("/safari/workspaceCode")
	public @ResponseBody String duplicateEmail(HttpSession session) {
		 // 세션 workMemberNo
		int workMemberNo = (int)session.getAttribute("workMemberNo");				
		
		// code 불러오기
		String code = workspaceMemberService.getWorkspaceMemberOneCode(workMemberNo);	  
		
		// code 멤버 디버깅
		log.debug(TeamColor.CJM+code +"RestController code"); 
		
		// return 코드
		return code;
	}
	
	// 존재하는 email인지확인
	@PostMapping("/safari/existEmail")
	public @ResponseBody String existMail(@RequestParam (value = "workMemberEmail") String workMemberEmail ) {
		// workMemberEmail 디버깅
		log.debug(TeamColor.CJM +workMemberEmail + "이메일 검사");
		
		// 리턴값 boolean - true (email 사용가능)
		boolean emailAvailable = workspaceMemberService.getMemberEmailByConfirm(workMemberEmail);
		log.debug(TeamColor.CJM + emailAvailable);
		// json으로 만들 변수 초기화
		String jsonStr = "";
		
		// 메서드의 결과에 따라 json 분기
		if(emailAvailable) { // 성공
			jsonStr = "존재하는이메일";
		} else { // 실패
			jsonStr = "존재하지않는이메일";
		}
		
		return jsonStr;
	}
	
	// 존재하는 workMemberEmail 인지 확인
	@PostMapping("/safari/existWorkspaceEmail")
	public @ResponseBody String existWorkspaceEmail(WorkspaceMember workspaceMember ,HttpSession session) {
														
		// workspaceMember 디버깅
		log.debug(TeamColor.CJM +workspaceMember + "workspaceMember 검사");
		
		// session에 workNo set
		workspaceMember.setWorkNo((int)session.getAttribute("workNo"));
		
		// 리턴값 boolean - true (email 사용가능)
		String emailAvailable = workspaceMemberService.getWorkspaceMemberEmailByConfirm(workspaceMember);
		log.debug(TeamColor.CJM + emailAvailable);
		// json으로 만들 변수 초기화
		String jsonStr = "";
		
		// 메서드의 결과에 따라 json 분기
		if(emailAvailable!=null) { // 성공
			jsonStr = "이미사용";
		} else { // 실패
			jsonStr = "사용하지않음";
		}
		
		return jsonStr;
	}
	
}
