package com.gd.safari.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ChatController {
	
	// 채팅 페이지 이동
	@GetMapping("/chat")
	public String chat() {
		return "chat/chat";
	}
}
