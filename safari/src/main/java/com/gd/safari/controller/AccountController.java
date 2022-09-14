package com.gd.safari.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AccountController {
	
	// 로그인 페이지 이동
	@GetMapping("/login")
	public String login() { 
		return "account/login";
	}
	
	// 회원가입 페이지 이동
	@GetMapping("/register")
	public String register() {
		return "account/register";
	}
	
	// 비밀번호 찾기 페이지 이동
	@GetMapping("/recover-password")
	public String recoverPassword() {
		return "account/recover-password";
	}
}
