package com.gd.safari.restController;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.service.ITaskMemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class RestFeedbackController {
	@Autowired
	private ITaskMemberService taskMemberService;
	
	@GetMapping("/safari/getFeedbackReceiverList")
	public List<Map<String, Object>> restGetTaskMemberBytaskNo(@RequestParam(value = "taskNo") int taskNo){
		// ajax로 받아온 taskNo 파라미터
		log.debug(TeamColor.GDE + "taskNo --- " + taskNo);
		// 해당 업무의 업무 멤버리스트 조회 - email, name
		List<Map<String, Object>> list = taskMemberService.getMemberListNameAndEmailByTaskNo(taskNo);
		log.debug(TeamColor.GDE + "list --- " + list);
		//json으로 반환
		return list;
	}
}
