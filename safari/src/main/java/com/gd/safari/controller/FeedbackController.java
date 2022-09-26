package com.gd.safari.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class FeedbackController {
	
	// 피드백 리스트
	@GetMapping("/safari/feedback")
	public String feedback() {
		return "feedback/feedback";
	}
}
