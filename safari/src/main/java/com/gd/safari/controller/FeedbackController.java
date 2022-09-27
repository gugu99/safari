package com.gd.safari.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.service.IFeedbackService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class FeedbackController {
	@Autowired
	private IFeedbackService feedbackService;
	
	// 피드백 리스트
	@GetMapping("/safari/feedback")
	public String feedback() {
		return "feedback/feedback";
	}
	
	// 피드백 작성하기
	@PostMapping("/safari/addFeedback")
	public String addFeedback(HttpSession session, @RequestParam Map<String, Object> map) {
		log.debug(TeamColor.GDE + "map --- " + map);
		
		// 세션에 저장되어있는 로그인 이메일을 피드백 sender로 사용하기 위해 가져온다.
		String feedbackSender = (String) session.getAttribute("login");
		map.put("feedbackSender", feedbackSender);
		
		// 피드백 작성
		feedbackService.addFeedback(map);
		
		return "redirect:/safari/feedback";
	}
}