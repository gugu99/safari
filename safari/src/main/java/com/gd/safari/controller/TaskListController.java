package com.gd.safari.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TaskListController {
	
	// 업무 페이지 이동
	@GetMapping("/safari/taskList")
	public String task() {
		return "task/taskList";
	}
}
