package com.gd.safari.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TodoListController {
	
	// 할일 페이지 이동
	@GetMapping("/todoList")
	public String task() {
		return "todo/todoList";
	}
}
