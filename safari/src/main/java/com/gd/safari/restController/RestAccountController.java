package com.gd.safari.restController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.service.IMailService;
import com.gd.safari.service.IMemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class RestAccountController {
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
}
