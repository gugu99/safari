package com.gd.safari.restController;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
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
	
}
