package com.gd.safari.controller;

import java.util.Random;

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
	@Autowired private IMemberService memberService;
	
	// 로그인 페이지 이동
	@GetMapping("/account/login")
	public String login() { 
		log.debug(TeamColor.CSH + "로그인 페이지");
		return "account/login";
	}
	
	// 로그인 액션 이동
	@PostMapping("/account/login")
	public String login(HttpSession session, Member member) {
		log.debug(TeamColor.CSH + "로그인 액션");
		// 로그인 메서드 실행 후 세션에 담기
		Member loginMember = memberService.getMemberByLogin(member);
		session.setAttribute("login", loginMember);
		
		return "redirect:/safari/index";
	}
	
	// 회원가입 페이지 이동
	@GetMapping("/account/register")
	public String register() {
		log.debug(TeamColor.CSH + "회원가입 페이지");
		return "account/register";
	}
	
	// 회원가입 액션
	@PostMapping("/account/register")
	public String register(Member member) {
		log.debug(TeamColor.CSH + "회원가입 액션");
		// 인증번호 넣기
		member.setCertified(certified_key());
		// 디버깅
		log.debug(TeamColor.CSH + member);
		memberService.addMember(member);
		
		return "redirect:/account/login";
	}
	
	// 비밀번호 찾기 페이지 이동
	@GetMapping("/account/recover-password")
	public String recoverPassword() {
		log.debug(TeamColor.CSH + "비밀번호 찾기 페이지");
		return "account/recover-password";
	}
	
	// 계정잠금해제 페이지 이동
	@GetMapping("/lock/unlock-user")
	public String unlockUser() {
		log.debug(TeamColor.CSH + "계정잠금해제 페이지 이동");
		return "unlock-user";
	}
	
	// 인증번호 생성
    private String certified_key() {
		Random random = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;

		do {
			num = random.nextInt(75) + 48;
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				sb.append((char) num);
			} else {
				continue;
			}

		} while (sb.length() < 10);
		return sb.toString();
	}
}
