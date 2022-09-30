package com.gd.safari.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.service.IWorkspaceGuestService;
import com.gd.safari.service.IWorkspaceService;
import com.gd.safari.vo.Workspace;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class HomeController {
	@Autowired private IWorkspaceService workspaceService;
	@Autowired private IWorkspaceGuestService workspaceGuestService;
	// 홈 페이지 이동(로그인 전)
	@GetMapping({"/","/home"})
	public String home() {
		return "home";
	}

	// 인덱스 페이지 이동(로그인 후)
	// 워크스페이스 리스트
	@GetMapping("/safari/index")
		public String index(HttpSession session ,Model model,
				@RequestParam(value="errorMsg",required = false) String errorMsg) {
			// 세션 이메일불러오기
			String adminEmail = (String)session.getAttribute("login");   
			
			// adminEmail 디버깅
			log.debug(TeamColor.CJM+adminEmail +"Controller adminEmail"); 	
			
			// workList 실행
			List<Workspace> list= workspaceService.getWorkspaceList(adminEmail);
			
			// 게스트리스트 목록 넣기
			List<Map<String,Object>> GuestList = workspaceGuestService.getWorkspaceGuestListByEmail(adminEmail);
			
			// 모델에 게스트로 속한 리스트 보여주기
			model.addAttribute("GuestWorkspaceList", GuestList);
			
			// 워크스페이스 리스트 보여주기
			model.addAttribute("workspaceList", list);
			
			model.addAttribute("adminEmail",adminEmail);
			
			if(errorMsg != null ) {
			model.addAttribute("errorMsg",errorMsg);
				
			}
			
			// index 이동
			return "workspace/index"; 														
		}
	
}
