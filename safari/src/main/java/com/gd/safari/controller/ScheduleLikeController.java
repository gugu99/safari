package com.gd.safari.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.service.IScheduleLikeService;
import com.gd.safari.vo.ScheduleLike;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ScheduleLikeController {
	@Autowired
	IScheduleLikeService scheduleLikeService;
	
	// 일정 좋아요 추가하기
	@GetMapping("/member/addScheduleLike")
	public String addScheduleLike(RedirectAttributes redirectAttributes, HttpSession session, ScheduleLike scheduleLike) {
		log.debug(TeamColor.GDE + "scheduleLike --- " + scheduleLike);
		
		// 세션에 있는 로그인 이메일 가져오기
		String memberEmail = (String)session.getAttribute("login");
		log.debug(TeamColor.GDE + "memberEmail --- " + memberEmail);
		
		// 세션에서 받아온 이메일 setter
		scheduleLike.setMemberEmail(memberEmail);
		log.debug(TeamColor.GDE + "scheduleLike --- " + scheduleLike);
		
		// 좋아요 추가
		int row = scheduleLikeService.addScheduleLike(scheduleLike);
		
		if (row == 0) { // 좋아요를 이미했으면
			redirectAttributes.addFlashAttribute("scheduleLikeMsg", "이미 좋아요한 일정입니다.");
			return "redirect:/safari/scheduleList";
		}
		redirectAttributes.addFlashAttribute("scheduleLikeMsg", "좋아요 성공!");
		return "redirect:/safari/scheduleList";
	}
}
