package com.gd.safari.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.service.ITaskService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TaskController {
	@Autowired private ITaskService taskService;
	
	
	// 업무 상세보기 페이지 액션
//	@PostMapping("/safari/taskDetail")
//	public String taskDetail(@RequestParam (value = "map") Map<String, Object> map) {
//		log.debug(TeamColor.CSH + this.getClass() + " 업무 상세보기 페이지 액션");
//		// 디버깅
//		log.debug(TeamColor.CSH + map);
//		
//		
//		return "";
//	}
}
