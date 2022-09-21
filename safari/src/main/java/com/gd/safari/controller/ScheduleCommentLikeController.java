package com.gd.safari.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.service.IScheduleCommentLikeService;
import com.gd.safari.vo.ScheduleCommentLike;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ScheduleCommentLikeController {
	@Autowired
	IScheduleCommentLikeService scheduleCommentLikeService;
	
	// 댓글 좋아요 추가하기
	@GetMapping("/safari/addScheduleCommentLike")
	public String addScheduleCommentLike(RedirectAttributes redirectAttributes, HttpSession session, ScheduleCommentLike scheduleCommentLike) {
		log.debug(TeamColor.GDE + "scheduleCommentLike --- " + scheduleCommentLike);
		
		// 세션에 저장된 로그인 이메일 가져오기
		String memberEmail = (String)session.getAttribute("login");
		log.debug(TeamColor.GDE + "memberEmail --- " + memberEmail);
		
		// 세션에서 받아온 이메일 setter
		scheduleCommentLike.setMemberEmail(memberEmail);
		log.debug(TeamColor.GDE + "scheduleCommentLike --- " + scheduleCommentLike);
		
		// 댓글 좋아요 추가
		int row = scheduleCommentLikeService.addScheduleCommentLike(scheduleCommentLike);
		
		if (row == 0) { // 댓글에 이미 좋아요를 했으면
			redirectAttributes.addFlashAttribute("scheduleCmtLikeMsg", "이미 좋아요한 댓글입니다.");
			return "redirect:/safari/scheduleList";
		}
		
		redirectAttributes.addFlashAttribute("scheduleCmtLikeMsg", "댓글 좋아요 성공!");
		
		return "redirect:/safari/scheduleList";
	}
}
