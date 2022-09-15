package com.gd.safari.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.service.IWorkspaceService;
import com.gd.safari.vo.Member;
import com.gd.safari.vo.Workspace;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class HomeController {
	@Autowired private IWorkspaceService workspaceService;
	// 홈 페이지 이동(로그인 전)
	@GetMapping({"/","/home"})
	public String home() {
		return "home";
	}
	
	// 인덱스 페이지 이동(로그인 후)
	// 워크스페이스 리스트
	@GetMapping("/safari/index")
		public String index(HttpSession session ,Model model) {
			String adminEmail = ((Member)session.getAttribute("login")).getMemberEmail();   // 세션 이메일불러오기
			log.debug(TeamColor.CJM+adminEmail +"Controller adminEmail"); 					// adminEmail 디버깅
			List<Workspace> list= workspaceService.getWorkspaceList(adminEmail);		    // workList 실행
			model.addAttribute("workspaceList", list);
			return "workspace/index"; 														// index 이동
		}
	
}
