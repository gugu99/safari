package com.gd.safari.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.service.IFeedbackService;
import com.gd.safari.vo.WorkspaceMember;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class FeedbackController {
	@Autowired
	private IFeedbackService feedbackService;
	
	// 피드백 리스트
	@GetMapping("/member/feedback")
	public String feedback(HttpSession session, Model model, WorkspaceMember workspaceMember, Map<String, Object> sender) {
		log.debug(TeamColor.CSK + "피드백 리스트 띄우기");
		
		// 세션에 저장된 값 - workMemberNo, workNo, login
		sender.put("senderWorkMemberNo", session.getAttribute("workMemberNo"));
		sender.put("workNo", session.getAttribute("workNo"));
		sender.put("senderWorkMemberEmail", session.getAttribute("login"));
		
		log.debug(TeamColor.GDE + "sender --- " + sender);
		
		// 세션의 값 세팅
		// workNo, workMemberEmail
		workspaceMember.setWorkNo((int)session.getAttribute("workNo"));

		log.debug(TeamColor.CSK + "session -> workspaceMember: " + workspaceMember);
		
		Map<String, Object> map = feedbackService.getFeedbackListAndMemberInfoByWorkspaceMember(workspaceMember, sender);
		
		model.addAttribute("member", map.get("member")); // 해당 회원의 정보
		model.addAttribute("feedbackList", map.get("feedbackList")); // 해당 회원의 피드백 리스트
		model.addAttribute("taskList", map.get("taskList")); // 해당 회원에게 피드백 줄 수 있는 업무리스트
		model.addAttribute("login", session.getAttribute("login")); // 수정, 삭제 권한 체크를 위해
		
		return "feedback/feedback";
	}
	
	// 피드백 작성하기
	@PostMapping("/member/addFeedback")
	public String addFeedback(HttpSession session, @RequestParam Map<String, Object> map) {
		log.debug(TeamColor.GDE + "map --- " + map);
		
		// 세션에 저장되어있는 로그인 이메일을 피드백 sender로 사용하기 위해 가져온다.
		String feedbackSender = (String) session.getAttribute("login");
		map.put("feedbackSender", feedbackSender);
		
		// 피드백 작성
		feedbackService.addFeedback(map);
		
		return "redirect:/member/feedback?workMemberNo=" + map.get("workMemberNo");
	}
	
	// 피드백 수정 폼
	@GetMapping("/member/modifyFeedback")
	public String modifyFeedback(Model model, @RequestParam int feedbackNo, @RequestParam int workMemberNo) {
		log.debug(TeamColor.GDE + "feedbackNo --- " + feedbackNo);
		
		// 피드백, 피드백 수신자리스트, 피드백 준 업무의 멤버리스트 가져오기
		Map<String, Object> map = feedbackService.getFeedbackOne(feedbackNo);
		log.debug(TeamColor.GDE + map);
		
		// 모델에 담기
		model.addAttribute("feedbackReceiverList", map.get("feedbackReceiverList"));
		model.addAttribute("feedbackOne", map.get("feedbackOne"));
		model.addAttribute("workMemberNo", workMemberNo);
		
		return "feedback/modifyFeedback";
	}
	
	// 피드백 수정 action
	@PostMapping("/member/modifyFeedback")
	public String modifyFeedback(@RequestParam Map<String, Object> map) {
		log.debug(TeamColor.GDE + "map --- " + map);
		
		// 피드백 수정하기 - 피드백 수신자, 피드백 내용, 공개권한
		feedbackService.modifyFeedback(map);
		
		return "redirect:/member/feedback?workMemberNo=" + map.get("workMemberNo");
	}
	
	@GetMapping("/member/removeFeedback")
	public String removeFeedback(HttpSession session, @RequestParam Map<String, Object> map) {
		map.put("feedbackSender", (String)session.getAttribute("login"));
		log.debug(TeamColor.CSK + "map: " + map);
		
		feedbackService.removeFeedback(map);
		
		return "redirect:/member/feedback?workMemberNo=" + map.get("workMemberNo");
	}
}
