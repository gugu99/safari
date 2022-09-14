package com.gd.safari.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ScheduleController {

	// 일정 리스트 페이지 이동
	@GetMapping("/safari/scheduleList")
	public String scheduleList() {
		return "schedule/scheduleList";
	}
}
