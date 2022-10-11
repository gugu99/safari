package com.gd.safari.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.service.IBoardLikeService;
import com.gd.safari.vo.BoardLike;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class BoardLikeController {
	@Autowired
	private IBoardLikeService boardLikeService;
	
	// 게시글 좋아요 추가하기
	@GetMapping("/member/addBoardLike")
	public String addBoardLike(RedirectAttributes redirectAttributes, HttpSession session, BoardLike boardLike) {
		log.debug(TeamColor.GDE + boardLike);
		
		// 세션에 있는 로그인 이메알 가져오기
		String memberEmail = (String)session.getAttribute("login");
		log.debug(TeamColor.GDE + "memberEmail --- " + memberEmail);
		
		// 세션에서 받아온 이메일 setter
		boardLike.setMemberEmail(memberEmail);
		log.debug(TeamColor.GDE + boardLike);
		
		// 게시글 좋아요 추가
		int row = boardLikeService.addBoardLike(boardLike);
		log.debug(TeamColor.GDE + "row --- " + row);
		
		if (row == 0) { // 이미 좋아요 한 게시글
			redirectAttributes.addFlashAttribute("boardLikeMsg", "이미 좋아요한 게시글입니다.");
			return "redirect:/member/boardList";
		}
		
		redirectAttributes.addFlashAttribute("boardLikeMsg", "게시글 좋아요 성공!");
		return "redirect:/member/boardList";
	}
}
