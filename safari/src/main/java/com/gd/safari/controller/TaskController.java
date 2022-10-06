package com.gd.safari.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.service.ITaskService;
import com.gd.safari.vo.Task;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TaskController {
	@Autowired private ITaskService taskService;
	
	// 업무 수정 액션
	@PostMapping("/member/updateTask")
	public String updateTask(HttpSession session, Task task) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무 수정 액션");
		// 디버깅
		log.debug(TeamColor.CSH + task);
		
		// 파라미터 파싱
		Map<String, Object> m = new HashMap<>();
		m.put("task", task);
		m.put("projectNo", session.getAttribute("projectNo"));
		m.put("workMemberName", session.getAttribute("workMemberName"));
		
		// 서비스 호출
		int row = taskService.modifyTask(m);
		
		// 서비스메서드의 리턴값이 1이라면 성공
		if(row == 1) {
			log.debug(TeamColor.CSH + "업무수정 성공");
		} else {
			log.debug(TeamColor.CSH + "업무수정 실패");
		}

		// 프로젝트에 맞는 taskList로 넘기기
		int projectNo = (int) session.getAttribute("projectNo");
		log.debug(TeamColor.CSH + "프로젝트 번호 : " + session.getAttribute("projectNo"));
		
		return "redirect:/member/taskList?projectNo=" + projectNo;
	}
	
}
