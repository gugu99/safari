package com.gd.safari.restController;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.service.IWorkspaceMemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class RestWorkspaceMember {
	@Autowired private IWorkspaceMemberService workspaceMemberService;
	
	@PostMapping("/safari/workspaceCode")
	public @ResponseBody String duplicateEmail(HttpSession session) {
		int workMemberNo = (int)session.getAttribute("workMemberNo");					  // 세션 workMemberNo
		String code = workspaceMemberService.getWorkspaceMemberOneCode(workMemberNo);	  // code 불러오기
		log.debug(TeamColor.CJM+code +"RestController code"); 							  // code 멤버 디버깅
		return code;
	}
	
	@PostMapping("/safari/existEmail")
	public @ResponseBody String existMail(@RequestParam (value = "workMemberEmail") String workMemberEmail ) {
		log.debug(TeamColor.CJM +workMemberEmail + "이메일 검사");
		// 디버깅
		log.debug(TeamColor.CSH + workMemberEmail);
		
		// 리턴값 boolean - true (email 사용가능)
		boolean emailAvailable = workspaceMemberService.getMemberEmailByConfirm(workMemberEmail);
		log.debug(TeamColor.CSH + emailAvailable);
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
	
}
