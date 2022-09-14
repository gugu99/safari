package com.gd.safari.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	
	// 홈 페이지 이동(로그인 전)
	@GetMapping("/")
	public String home() {
		return "home";
	}
	
	// 인덱스 페이지 이동(로그인 후)
	@GetMapping("/index")
	public String index() {
		return "index";
	}
}
