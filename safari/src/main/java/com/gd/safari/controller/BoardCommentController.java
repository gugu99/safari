package com.gd.safari.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.service.IBoardCommentService;
import com.gd.safari.vo.BoardComment;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class BoardCommentController {
	@Autowired
	private IBoardCommentService boardCommentService;
	
	// 게시글 댓글 작성하기
	@PostMapping("/member/addBoardComment")
	public String addBoardComment(BoardComment boardComment) {
		log.debug(TeamColor.GDE + boardComment);
		
		// 게시글 댓글 작성하기
		int row = boardCommentService.addBoardComment(boardComment);
		log.debug(TeamColor.GDE + "row --- " + row);
		
		return "redirect:/member/boardList";
	}
	
	// 게시글 댓글 삭제하기
	@GetMapping("/member/removeBoardComment")
	public String removeBoardComment(@RequestParam int boardCmtNo) {
		log.debug(TeamColor.GDE + "boardCmtNo --- " + boardCmtNo);
		
		// 게시글 댓글 삭제하기
		int row = boardCommentService.removeBoardComment(boardCmtNo);
		log.debug(TeamColor.GDE + "row --- " + row);
		
		return "redirect:/member/boardList";
	}
}
