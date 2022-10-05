package com.gd.safari.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.PropertyNamingStrategy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.gd.safari.ConfigUtils;
import com.gd.safari.commons.TeamColor;
import com.gd.safari.service.IMemberService;
import com.gd.safari.vo.GoogleLogin;
import com.gd.safari.vo.GoogleLoginRequest;
import com.gd.safari.vo.GoogleLoginResponse;
import com.gd.safari.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AccountController {
	@Autowired private IMemberService memberService;
	@Autowired private ConfigUtils configUtils;
	
	// 로그인 페이지 이동
	@GetMapping("/account/login")
	public String login(Model model, @RequestParam(value = "errorMsg", required = false) String errorMsg) {
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
		session.setAttribute("login", loginMember.getMemberEmail());
		
		return "redirect:/safari/index";
	}
	
    // 구글 소셜로그인 재요청페이지 이동
    @SuppressWarnings("deprecation")
	@GetMapping("/account/google/login/redirect")
    public String redirectGoogleLogin(HttpSession session, @RequestParam(value = "code") String authCode) {
		log.debug(TeamColor.CSH + this.getClass() + " 구글 소셜로그인 재요청페이지 이동");
		
        // HTTP 통신을 위해 RestTemplate 활용
        RestTemplate restTemplate = new RestTemplate();
        GoogleLoginRequest requestParams = GoogleLoginRequest.builder()
                .clientId(configUtils.getGoogleClientId())
                .clientSecret(configUtils.getGoogleSecret())
                .code(authCode)
                .redirectUri(configUtils.getGoogleRedirectUrl())
                .grantType("authorization_code")
                .build();

        try {
            // Http Header 설정
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            HttpEntity<GoogleLoginRequest> httpRequestEntity = new HttpEntity<>(requestParams, headers);
            ResponseEntity<String> apiResponseJson = restTemplate.postForEntity(configUtils.getGoogleAuthUrl() + "/token", httpRequestEntity, String.class);

            // ObjectMapper를 통해 String to Object로 변환
            ObjectMapper objectMapper = new ObjectMapper();
            objectMapper.setPropertyNamingStrategy(PropertyNamingStrategy.SNAKE_CASE);
            objectMapper.setSerializationInclusion(JsonInclude.Include.NON_NULL); // NULL이 아닌 값만 응답받기(NULL인 경우는 생략)
            GoogleLoginResponse googleLoginResponse = objectMapper.readValue(apiResponseJson.getBody(), new TypeReference<GoogleLoginResponse>() {});

            // 사용자의 정보는 JWT Token으로 저장되어 있고, Id_Token에 값을 저장한다.
            String jwtToken = googleLoginResponse.getIdToken();

            // JWT Token을 전달해 JWT 저장된 사용자 정보 확인
            String requestUrl = UriComponentsBuilder.fromHttpUrl(configUtils.getGoogleAuthUrl() + "/tokeninfo").queryParam("id_token", jwtToken).toUriString();

            String resultJson = restTemplate.getForObject(requestUrl, String.class);

            if(resultJson != null) {
                GoogleLogin userInfo = objectMapper.readValue(resultJson, new TypeReference<GoogleLogin>() {});
                
                log.debug(TeamColor.CSH + userInfo);
                
                // 이메일 있는지 확인
                boolean result = memberService.getMemberEmailByCheckAll(userInfo.getEmail());
                // 있어도 없어도 객체에 담는다
                // 있다면(true) - 로그인
                // 없다면(false) - 회원가입
                Member member = new Member();
            	member.setMemberEmail(userInfo.getEmail());
            	member.setMemberPw(userInfo.getKid());
            	
            	// true 라면 로그인처리 false 라면 회원가입처리
                if(result) {
                	changePasswordWithGoogle(member);
                	login(session, member);
                	
                	return "redirect:/safari/index";
                	
                } else {
                	register(member);
                }
            } else {
                throw new Exception("Google OAuth failed!");
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }

        return "redirect:/account/login";
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
	public String register(Model model, @RequestParam(value = "errorMsg", required = false) String errorMsg) {
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
	public String recoverPassword(Model model, @RequestParam(value = "errorMsg", required = false) String errorMsg) {
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
	@PostMapping("/safari/change-password")
	public String changePasswordWithGoogle(HttpSession session, @RequestParam Map<String, Object> m) {
		log.debug(TeamColor.CSH + this.getClass() + " 비밀번호 변경 액션");
		
		// 파라미터 가공
		m.put("memberEmail", session.getAttribute("login"));
		// 디버깅
		log.debug(TeamColor.CSH + m);
		// 서비스 호출
		int row = memberService.modifyMemberPwByNewPw(m);
		
		// 서비스메서드의 리턴값이 1이라면 성공
		if(row == 1) {
			log.debug(TeamColor.CSH + "비밀번호 변경 성공");
		} else {
			log.debug(TeamColor.CSH + "비밀번호 변경 실패");
			return "redirect:/safari/workspaceMemberOne?errorMsg=Change Password Fail";
		}
		
		return "redirect:/safari/logout";
	}
		
	// 구글 로그인 비밀번호 변경 액션
	@PostMapping("/account/change-passwordWithGoogle")
	public void changePasswordWithGoogle(Member member) {
		log.debug(TeamColor.CSH + this.getClass() + " 구글 로그인 비밀번호 변경 액션");
		// 디버깅
		log.debug(TeamColor.CSH + member);
		// 서비스 호출
		int row = memberService.modifyMemberPwWithGoogle(member);
		
		// 서비스메서드의 리턴값이 1이라면 성공
		if(row == 1) {
			log.debug(TeamColor.CSH + "비밀번호 변경 성공");
		} else {
			log.debug(TeamColor.CSH + "비밀번호 변경 실패");
		}
	}
	
	// 계정잠금해제 페이지 이동
	@GetMapping("/account/unlock-user")
	public String unlockUser(Model model, @RequestParam(value = "errorMsg", required = false) String errorMsg) {
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
	
	// 계정삭제(탈퇴) 액션
	@PostMapping("/safari/delete-account")
	public String deleteAccount(HttpSession session, @RequestParam(value="memberEmail") String memberEmail) {
		log.debug(TeamColor.CSH + this.getClass() + " 계정삭제(탈퇴) 액션");
		
		// 디버깅
		log.debug(TeamColor.CSH + memberEmail);

		int row = 0;
		// 현재계정과 받아온 확인계정이 같은지 확인
		if(!session.getAttribute("login").equals(memberEmail)){ // 같지 않다면 실패로 돌리기
			row = 0;
		} else { // 같을시에만 서비스를 호출한다
			// 서비스 호출
			row = memberService.modifyMemberActiveXByDeleteAccount(memberEmail);
		}
		
		// 서비스메서드의 리턴값이 1이라면 성공
		if(row == 1) {
			log.debug(TeamColor.CSH + "계정삭제(탈퇴) 성공");
		} else {
			log.debug(TeamColor.CSH + "계정삭제(탈퇴) 실패");
			return "redirect:/safari/workspaceMemberOne?errorMsg=Delete Account Fail";
		}
		
		return "redirect:/safari/logout";
	}
}
