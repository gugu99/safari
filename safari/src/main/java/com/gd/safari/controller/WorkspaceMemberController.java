package com.gd.safari.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.service.IWorkspaceMemberService;
import com.gd.safari.vo.WorkspaceMember;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class WorkspaceMemberController {
	@Autowired private IWorkspaceMemberService workspaceMemberService;
	
	@GetMapping("/safari/workspaceMemberList")
	public String workspaceMemberList (Model model,HttpSession session) {
		int workNo = (Integer)session.getAttribute("workNo");								// 세션 워크넘버 가져오
		List<WorkspaceMember> list = workspaceMemberService.getWorkspaceMemberList(workNo); // 워크스페이스멤버 리스트 출력
		model.addAttribute("workspaceMemberList", list); 								    // 매핑
		log.debug(TeamColor.CJM+list +"Controller workName"); 							    // 워크스페이스 멤버 리스트 디버깅
		
		return "workmember/workspaceMemberList";  										    //workspaceMember List 출력 
	}
	
}
