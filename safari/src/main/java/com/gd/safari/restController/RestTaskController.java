package com.gd.safari.restController;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.service.ITaskService;
import com.gd.safari.vo.Task;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class RestTaskController {
	@Autowired private ITaskService taskService;
	
	// 프로젝트 번호에 맞는 업무 조회
	@PostMapping("/safari/task")
	public @ResponseBody List<Task> task(HttpSession session) {
		log.debug(TeamColor.CSH + this.getClass() + " 프로젝트 번호에 맞는 업무 조회");
		
		// 서비스호출
		// 리턴값 List<Task>
		List<Task> tasks = taskService.getTaskByProjectNo((int)session.getAttribute("projectNo"));
		
		log.debug(TeamColor.CSH + "조회에 따른 업무 개수 : " + tasks.size());
		
		return tasks;
	}
	// 업무 생성
	// 업무 수정
	// 업무 삭제
}
