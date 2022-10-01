package com.gd.safari.restController;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.service.ITaskCommentService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class RestTaskCommentController {
	@Autowired private ITaskCommentService taskCommentService;

	// 업무 코멘트리스트 가져오기
	@GetMapping("/member/taskCommentList")
	public List<Map<String, Object>> taskCommentList(int taskNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무 코멘트리스트 가져오기");
		List<Map<String, Object>> taskCommentList = taskCommentService.getTaskComment(taskNo);
		return taskCommentList;
	}
}
