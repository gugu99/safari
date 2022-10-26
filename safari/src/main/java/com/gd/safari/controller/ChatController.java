package com.gd.safari.controller;


import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.service.IChatService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ChatController {
	@Autowired
	private IChatService chatService;
	
	// 채팅 페이지 이동
	@GetMapping("/member/chat")
	public String chat(Model model, HttpSession session, Map<String, Object> paramMap) {
		log.debug(TeamColor.CSK + "채팅방 메인 페이지");
		// log.debug(TeamColor.CSK + (String)session.getAttribute("login"));
		
		paramMap.put("workNo", (int)session.getAttribute("workNo"));
		paramMap.put("workMemberEmail", (String)session.getAttribute("login"));
		
		Map<String, Object> map = chatService.getChatListByWorkNo(paramMap);
		
		model.addAttribute("chatRoomList", map.get("chatRoomList"));
		model.addAttribute("workspaceMemberList", map.get("workspaceMemberList"));
		log.debug(TeamColor.CSK + "workspaceMemberList: " + map.get("workspaceMemberList"));

		return "chat/chat";
	}

}
