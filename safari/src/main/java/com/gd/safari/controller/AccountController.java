package com.gd.safari.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.service.IMemberService;
import com.gd.safari.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AccountController {
	@Autowired private IMemberService accountService;
	
	// 로그인 페이지 이동
	@GetMapping("/login")
	public String login() { 
		log.debug(TeamColor.CSH + "로그인 페이지");
		return "account/login";
	}
	
	// 로그인 액션 이동
	@PostMapping("/login")
	public String login(HttpSession session, Member member) {
		log.debug(TeamColor.CSH + "로그인 액션");
		
		Member loginMember = accountService.getMemberByLogin(member);
		session.setAttribute("login", loginMember);
		
		return "redirect:/index";
	}
	
	// 회원가입 페이지 이동
	@GetMapping("/register")
	public String register() {
		log.debug(TeamColor.CSH + "회원가입 페이지");
		return "account/register";
	}
	
	// 비밀번호 찾기 페이지 이동
	@GetMapping("/recover-password")
	public String recoverPassword() {
		log.debug(TeamColor.CSH + "비밀번호 찾기 페이지");
		return "account/recover-password";
	}
}
