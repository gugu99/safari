package com.gd.safari.restController;

import java.net.URI;
import java.net.URISyntaxException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gd.safari.ConfigUtils;
import com.gd.safari.commons.TeamColor;
import com.gd.safari.service.IMailService;
import com.gd.safari.service.IMemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class RestAccountController {
	@Autowired private IMemberService memberService;
	@Autowired private IMailService mailService;
	@Autowired private ConfigUtils configUtils;
	
	// 메일 확인
	@PostMapping("/account/mailConfirm")
	public String mailConfirm(@RequestParam(value = "email") String email) {
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
	public String duplicateEmail(@RequestParam (value = "memberEmail") String memberEmail) {
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
	public String checkEmail(@RequestParam (value = "memberEmail") String memberEmail) {
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
	
	// 구글 소셜로그인 페이지 이동
    @GetMapping("/account/google/login")
    public ResponseEntity<Object> moveGoogleInitUrl() {
		log.debug(TeamColor.CSH + this.getClass() + " 구글 소셜로그인 페이지 이동");
        URI redirectUrl = null;
        try {
        	// Bean에 등록 한 google 주소를 googleInitUrl이라는 이름으로 가져온다.
        	redirectUrl = new URI(configUtils.googleInitUrl()); 
            HttpHeaders httpHeaders = new HttpHeaders();
            httpHeaders.setLocation(redirectUrl);
            return new ResponseEntity<>(httpHeaders, HttpStatus.SEE_OTHER);
        } catch (URISyntaxException e) {
            e.printStackTrace();
        }

        return ResponseEntity.badRequest().build();
    }
}
