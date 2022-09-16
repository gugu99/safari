package com.gd.safari.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.service.IMailService;
import com.gd.safari.service.IMemberService;
import com.gd.safari.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AccountController {
	@Autowired private IMemberService memberService;
	
	// 로그인 페이지 이동
	@GetMapping("/account/login")
	public String login(Model model, @RequestParam(value = "errorMsg", required=false) String errorMsg) {
		log.debug(TeamColor.CSH + this.getClass() + " 로그인 페이지");
		// 모델값에 에러메세지 담기
		model.addAttribute("errorMsg", errorMsg);
		return "account/login";
	}
	
	// 로그인 액션
	@PostMapping("/account/login")
	public String login(HttpSession session, Member member) {
		log.debug(TeamColor.CSH + this.getClass() + " 로그인 액션");
		// 서비스 호출
		Member loginMember = memberService.getMemberByLogin(member);
		// 로그인 실패
		if(loginMember == null) {
			log.debug(TeamColor.CSH + "로그인 실패");
			return "redirect:/account/login?errorMsg=Login Fail";
			
		// active 값에 따른 분기	
		} else if("X".equals(loginMember.getActive())) {
			log.debug(TeamColor.CSH + "로그인 실패 : 탈퇴한 계정입니다.");
			return "redirect:/account/login?errorMsg=Login Fail - Deleted Account";
		} else if("N".equals(loginMember.getActive())) {
			log.debug(TeamColor.CSH + "로그인 실패 : 비활성화된 계정입니다.");
			return "redirect:/account/unlock-user";
		}
		// 세션에 담기
		session.setAttribute("login", loginMember);
		
		return "redirect:/safari/index";
	}
	
	// 로그아웃 액션
	@GetMapping("/safari/logout")
	public String logout(HttpSession session) { 
		log.debug(TeamColor.CSH + this.getClass() + " 로그아웃 액션");
		// 세션 무효화
		session.invalidate();
		
		return "redirect:/account/login";
	}
	
	// 회원가입 페이지 이동
	@GetMapping("/account/register")
	public String register(Model model, @RequestParam(value = "errorMsg", required=false) String errorMsg) {
		log.debug(TeamColor.CSH + this.getClass() + " 회원가입 페이지");
		// 모델값에 에러메세지 담기
		model.addAttribute("errorMsg", errorMsg);
		return "account/register";
	}
	
	// 회원가입 액션
	@PostMapping("/account/register")
	public String register(Member member) {
		log.debug(TeamColor.CSH + this.getClass() + " 회원가입 액션");
		// 디버깅
		log.debug(TeamColor.CSH + member);
		// 서비스 호출
		int row = memberService.addMember(member);
		
		// 서비스메서드의 리턴값이 1이라면 성공
		if(row == 1) {
			log.debug(TeamColor.CSH + "회원가입 성공");
		} else {
			log.debug(TeamColor.CSH + "회원가입 실패");
			return "redirect:/account/register?errorMsg=Insert Member Fail";
		}
		
		return "redirect:/account/login";
	}
	
	// 비밀번호 찾기 페이지 이동
	@GetMapping("/account/recover-password")
	public String recoverPassword(Model model, @RequestParam(value = "errorMsg", required=false) String errorMsg) {
		log.debug(TeamColor.CSH + this.getClass() + " 비밀번호 찾기 페이지");
		// 모델값에 에러메세지 담기
		model.addAttribute("errorMsg", errorMsg);
		return "account/recover-password";
	}
	
	// 비밀번호 찾기 액션
	@PostMapping("/account/recover-password")
	public String recoverPassword(Member member) {
		log.debug(TeamColor.CSH + this.getClass() + " 비밀번호 찾기 액션");
		// 디버깅
		log.debug(TeamColor.CSH + member);
		// 서비스 호출
		int row = memberService.modifyMemberPwByRecoverPw(member);
		
		// 서비스메서드의 리턴값이 1이라면 성공
		if(row == 1) {
			log.debug(TeamColor.CSH + "비밀번호 찾기 성공");
		} else {
			log.debug(TeamColor.CSH + "비밀번호 찾기 실패");
			return "redirect:/account/recover-password?errorMsg=Recover Password Fail";
		}
		
		return "redirect:/account/login";
	}
	
	// 비밀번호 변경 액션
	@PostMapping("account/change-password")
	public String changePassword(Map<String, Object> map) {
		log.debug(TeamColor.CSH + this.getClass() + " 비밀번호 변경 액션");
		// 디버깅
		log.debug(TeamColor.CSH + map);
		// 서비스 호출
		int row = memberService.modifyMemberPw(map);
		
		// 서비스메서드의 리턴값이 1이라면 성공
		if(row == 1) {
			log.debug(TeamColor.CSH + "비밀번호 변경 성공");
		} else {
			log.debug(TeamColor.CSH + "비밀번호 변경 실패");
			return "redirect:/account/change-password?errorMsg=Change Password Fail";
		}
		
		return "redirect:/account/login";
	}
	
	// 계정잠금해제 페이지 이동
	@GetMapping("/account/unlock-user")
	public String unlockUser(Model model, @RequestParam(value = "errorMsg", required=false) String errorMsg) {
		log.debug(TeamColor.CSH + this.getClass() + " 계정잠금해제 페이지");
		// 모델값에 에러메세지 담기
		model.addAttribute("errorMsg", errorMsg);
		return "account/unlock-user";
	}
	
	// 계정잠금해제 액션
	@PostMapping("/account/unlock-user")
	public String unlockUser(Member member) {
		log.debug(TeamColor.CSH + this.getClass() + " 계정잠금해제 액션");

		// 디버깅
		log.debug(TeamColor.CSH + member);
		// 서비스 호출
		int row = memberService.modifyMemberActiveYByUnlockUser(member);
		
		// 서비스메서의 리턴값이 1이라면 성공
		if(row == 1) {
			log.debug(TeamColor.CSH + "계정잠금해제 성공");
		} else {
			log.debug(TeamColor.CSH + "계정잠금해제 실패");
			return "redirect:/account/unlock-user?errorMsg=Unlock User Fail";
		}
		
		return "redirect:/account/login";
	}
	
	// 계정삭제(탈퇴) 페이지 이동
	@GetMapping("/safari/delete-account")
	public String deleteAccount(Model model, @RequestParam(value = "errorMsg", required=false) String errorMsg) {
		log.debug(TeamColor.CSH + this.getClass() + " 계정삭제(탈퇴) 페이지");
		// 모델값에 에러메세지 담기
		model.addAttribute("errorMsg", errorMsg);
		return "account/delete-account";
	}
	
	// 계정삭제(탈퇴) 액션
	@PostMapping("/safari/delete-account")
	public String deleteAccount(Member member) {
		log.debug(TeamColor.CSH + this.getClass() + " 계정삭제(탈퇴) 액션");
		
		// 디버깅
		log.debug(TeamColor.CSH + member);
		// 서비스 호출
		int row = memberService.modifyMemberActiveXByDeleteAccount(member);
		
		// 서비스메서드의 리턴값이 1이라면 성공
		if(row == 1) {
			log.debug(TeamColor.CSH + "계정삭제(탈퇴) 성공");
		} else {
			log.debug(TeamColor.CSH + "계정삭제(탈퇴) 실패");
			return "redirect:/safari/delete-account?errorMsg=Delete Account Fail";
		}
		
		return "redirect:/safari/logout";
	}
}
