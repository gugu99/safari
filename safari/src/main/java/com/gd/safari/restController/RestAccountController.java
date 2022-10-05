package com.gd.safari.restController;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;

import javax.servlet.http.HttpSession;

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
import com.gd.safari.service.IWorkspaceService;
import com.gd.safari.vo.Workspace;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class RestAccountController {
	@Autowired private IMemberService memberService;
	@Autowired private IMailService mailService;
	@Autowired private IWorkspaceService workSpaceService;
	@Autowired private ConfigUtils configUtils;
	
	// 회원가입 메일 확인
	@PostMapping("/account/mailConfirmForRegister")
	public String mailConfirmForRegister(@RequestParam(value = "email") String email) {
		log.debug(TeamColor.CSH + this.getClass() + " 회원가입 메일 확인");
		String code;
		// 꼭 예외처리를 하지 않아도 되는 익셉션을 발생시킨다.
		try {
			code = mailService.sendSimpleMessageForRegister(email);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
		
		log.debug(TeamColor.CSH + "인증코드 : " + code);
		
		return code;
	}
	
	// 휴면계정 활성화 메일 확인
	@PostMapping("/account/mailConfirmForUnlockUser")
	public String mailConfirmForUnlockUser(@RequestParam(value = "email") String email) {
		log.debug(TeamColor.CSH + this.getClass() + " 휴면계정 활성화 메일 확인");
		String code;
		// 꼭 예외처리를 하지 않아도 되는 익셉션을 발생시킨다.
		try {
			code = mailService.sendSimpleMessageForUnlockUser(email);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
		
		log.debug(TeamColor.CSH + "인증코드 : " + code);
		
		return code;
	}

	// 비밀번호 복구 메일 확인
	@PostMapping("/account/mailConfirmForRecoverPw")
	public String mailConfirmForRecoverPw(@RequestParam(value = "email") String email) {
		log.debug(TeamColor.CSH + this.getClass() + " 비밀번호 복구 메일 확인");
		String code;
		// 꼭 예외처리를 하지 않아도 되는 익셉션을 발생시킨다.
		try {
			code = mailService.sendSimpleMessageForRecoverPw(email);
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
    
    // 탈퇴를 위한 소유권 이전하기
 	// 워크스페이스 내가 관리자인 리스트
    @GetMapping("/safari/myWorkspaceList")
    public List<Workspace> myWorkspaceList(HttpSession session) {
		log.debug(TeamColor.CSH + this.getClass() + " 워크스페이스 내가 관리자인 리스트");
    	
		// 서비스 호출
    	List<Workspace> workspaceList = workSpaceService.getMyWorkspaceByMemberEmail((String)session.getAttribute("login"));
    	
    	// 디버깅
    	log.debug(TeamColor.CSH + "워크스페이스리스트 : " + workspaceList);
    	
    	return workspaceList;
    }
}
