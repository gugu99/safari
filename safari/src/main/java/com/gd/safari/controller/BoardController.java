package com.gd.safari.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class BoardController {

	
	@GetMapping("/safari/boardList")
	public String addWorkspace() {
		return "board/boardList";
	}
}
