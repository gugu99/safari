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
	@Autowired private IMailService mailService;
	
	// 메일 확인
	@PostMapping("/account/mailConfirm")
	public @ResponseBody String mailConfirm(@RequestParam(value = "email") String email) {
		log.debug(TeamColor.CSH + this.getClass() + " 로그인 페이지");
		String code;
		// 꼭 예외처리를 하지 않아도 되는 익셉션을 발생시킨다.
		try {
			code = mailService.sendSimpleMessage(email);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
		
		log.debug(TeamColor.CSH + "인증코드 : " + code);
		
		return code;
	}
	
	// 로그인 페이지 이동
	@GetMapping("/account/login")
	public String login(Model model) { 
		log.debug(TeamColor.CSH + this.getClass() + " 로그인 페이지");
		
		log.debug(TeamColor.CSH + model.getAttribute("errorMsg"));
		
		return "account/login";
	}
	
	// 로그인 액션
	@PostMapping("/account/login")
	public String login(HttpSession session, Model model, Member member) {
		log.debug(TeamColor.CSH + this.getClass() + " 로그인 액션");
		// 서비스 호출
		Member loginMember = memberService.getMemberByLogin(member);
		// 로그인 실패
		if(loginMember == null) {
			log.debug(TeamColor.CSH + "로그인 실패");
			// 모델에 에러메세지 담기
			model.addAttribute("errorMsg", "Login Fail");
			return "redirect:/account/login?errorMsg=" + model.getAttribute("errorMsg");
			
		// active 값에 따른 분기	
		} else if("X".equals(loginMember.getActive())) {
			log.debug(TeamColor.CSH + "로그인 실패 : 탈퇴한 계정입니다.");
			// 모델에 에러메세지 담기
			model.addAttribute("errorMsg", "Login Fail - Deleted Account");
			return "account/login";
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
	public String register() {
		log.debug(TeamColor.CSH + this.getClass() + " 회원가입 페이지");
		return "account/register";
	}
	
	// 회원가입 액션
	@PostMapping("/account/register")
	public String register(Model model, Member member) {
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
			// 모델에 에러메세지 담기
			model.addAttribute("errorMsg", "Insert Account Fail");
			return "account/register";
		}
		
		return "redirect:/account/login";
	}
	
	// 중복된 이메일 검사
	@PostMapping("/account/duplicateEmail")
	public @ResponseBody String duplicateEmail(@RequestParam (value = "memberEmail") String memberEmail) {
		log.debug(TeamColor.CSH + this.getClass() + " 중복된 이메일 검사");
		// 디버깅
		log.debug(TeamColor.CSH + memberEmail);
		
		// 리턴받을 변수 초기화
		// 리턴값 boolean - true (email 사용가능)
		boolean emailAvailable = memberService.getMemberEmailByDuplicate(memberEmail);
		// json으로 만들 변수 초기화
		String jsonStr = "";
		
		// 메서드의 결과에 따라 json 분기
		if(emailAvailable) { // 성공
			jsonStr = "memberEmail ok";
		} else { // 실패
			jsonStr = "not ok";
		}
		
		return jsonStr;
	}
	
	// 유효한 이메일 검사 (회원이고 활성화된 이메일)
	@PostMapping("/account/checkEmail")
	public @ResponseBody String checkEmail(@RequestParam (value = "memberEmail") String memberEmail) {
		log.debug(TeamColor.CSH + this.getClass() + " 유효한 이메일 검사");
		// 디버깅
		log.debug(TeamColor.CSH + memberEmail);
		
		// 리턴받을 변수 초기화
		// 리턴값 boolean - true (email 사용가능)
		boolean emailAvailable = memberService.getMemberEmailByCheck(memberEmail);
		// json으로 만들 변수 초기화
		String jsonStr = "";
		
		// 메서드의 결과에 따라 json 분기
		if(emailAvailable) { // 성공
			jsonStr = "memberEmail ok";
		} else { // 실패
			jsonStr = "not ok";
		}
		
		return jsonStr;
	}
	
	// 비밀번호 찾기 페이지 이동
	@GetMapping("/account/recover-password")
	public String recoverPassword() {
		log.debug(TeamColor.CSH + this.getClass() + " 비밀번호 찾기 페이지");
		return "account/recover-password";
	}
	
	// 비밀번호 찾기 액션
	@PostMapping("/account/recover-password")
	public String recoverPassword(Model model, Member member) {
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
			// 모델에 에러메세지 담기
			model.addAttribute("errorMsg", "Recover Password Fail");
			return "account/recover-password";
		}
		
		return "redirect:/account/login";
	}
	
	// 비밀번호 변경 액션
	@PostMapping("account/change-password")
	public String changePassword(Model model, Map<String, Object> map) {
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
			// 모델에 에러메세지 담기
			model.addAttribute("errorMsg", "Recover Password Fail");
			return "account/recover-password";
		}
		
		return "redirect:/account/login";
	}
	
	// 계정잠금해제 페이지 이동
	@GetMapping("/account/unlock-user")
	public String unlockUser() {
		log.debug(TeamColor.CSH + this.getClass() + " 계정잠금해제 페이지");
		return "account/unlock-user";
	}
	
	// 계정잠금해제 액션
	@PostMapping("/account/unlock-user")
	public String unlockUser(Model model, Member member) {
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
			// 모델에 에러메세지 담기
			model.addAttribute("errorMsg", "Unlock User Fail");
			return "account/unlock-user";
		}
		
		return "redirect:/account/login";
	}
	
	// 계정삭제(탈퇴) 페이지 이동
	@GetMapping("/safari/delete-account")
	public String deleteAccount() {
		log.debug(TeamColor.CSH + this.getClass() + " 계정삭제(탈퇴) 페이지");
		return "account/delete-account";
	}
	
	// 계정삭제(탈퇴) 액션
	@PostMapping("/safari/delete-account")
	public String deleteAccount(Model model, Member member) {
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
			// 모델에 에러메세지 담기
			model.addAttribute("errorMsg", "Delete Account Fail");
			return "account/delete-account";
		}
		
		return "redirect:/safari/logout";
	}
}
