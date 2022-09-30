package com.gd.safari.restController;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.service.IWorkspaceGuestService;
import com.gd.safari.vo.WorkspaceGuest;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class RestWorkspaceGuestController {
	@Autowired private IWorkspaceGuestService workspaceGuestService;
	
	
	@PostMapping("/member/existGuestEmail")
	public @ResponseBody String existWorkspaceEmail(WorkspaceGuest workspaceGuest ,HttpSession session) {
														
		// workspaceMember 디버깅
		log.debug(TeamColor.CJM +workspaceGuest + "workspaceMember 검사");
		
		// session에 workNo set
		workspaceGuest.setWorkNo((int)session.getAttribute("workNo"));
		
		// 리턴값 boolean - true (email 사용가능)
		String emailAvailable = workspaceGuestService.getWorkspaceGuestEmailByConfirm(workspaceGuest);
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
	
	@PostMapping("/member/workspaceGuestCode")
	public @ResponseBody String duplicateGuestEmail(HttpSession session,WorkspaceGuest workspaceGuest) {
		
		// 세션 workNo
		int workNo = (int)session.getAttribute("workNo");
		
		// 세션 email 넣기 
		String memberEmail = ((String) session.getAttribute("login"));
		
		// 세트 워크넘버 넣기
		workspaceGuest.setWorkNo(workNo);
		
		// 멤버 이메일 넣기
		workspaceGuest.setMemberEmail(memberEmail);
		
		// code 불러오기
		String code = workspaceGuestService.getWorkspaceGuestOneCode(workspaceGuest);	  
		
		// code 멤버 디버깅
		log.debug(TeamColor.CJM+code +"RestController code"); 
		
		// return 코드
		return code;
	}

}
