package com.gd.safari.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.service.IScheduleCommentService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ScheduleCommentController {
	
	@Autowired
	IScheduleCommentService scheduleCommentService;
	
	// 댓글 작성하기
	@PostMapping("/safari/addScheduleComment")
	public String addScheduleComment(@RequestParam Map<String, Object> map) {
		
		log.debug(TeamColor.GDE + "map --- " + map);
		
		int row = scheduleCommentService.addScheduleComment(map);
		
		if(row == 1) { // 댓글 작성 성공하면
			log.debug(TeamColor.GDE + "댓글 작성 성공!");
		}
		
		return "redirect:/safari/scheduleList";
	}
	
	// 댓글 삭제하기
	@GetMapping("/safari/removeScheduleComment")
	public String removeScheduleComment(@RequestParam int scheduleCmtNo) {
		
		log.debug(TeamColor.GDE + "scheduleCmtNo --- " + scheduleCmtNo);
		
		int row = scheduleCommentService.removeScheduleComment(scheduleCmtNo);
		
		if (row == 1) {
			log.debug(TeamColor.GDE + "댓글 삭제 성공!");
		}
		
		return "redirect:/safari/scheduleList";
	}
}
