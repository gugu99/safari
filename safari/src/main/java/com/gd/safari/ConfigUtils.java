package com.gd.safari;

import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

// @Value를 사용하기 위해 @Component 추가
// 해당 클래스를 Bean으로 생성해둠
// 추후 사용할 일이 있을 때, Bean 인스턴스를 꺼내 활용

@Component
public class ConfigUtils {
	// 소셜로그인(구글)을 위한 auth.url, login.url, redirect.url, id, secret을 my.properties에서 받아오기
	@Value("${google.auth.url}")
	private String googleAuthUrl;	
	@Value("${google.login.url}")
	private String googleLoginUrl;
	@Value("${google.redirect.url}")
	private String googleRedirectUrl;
	@Value("${google.client.id}")
	private String googleClientId;
	@Value("${google.secret}")
	private String googleSecret;
	@Value("${google.auth.scope}")
	private String googleAuthScopes;
	
	// Google 로그인 URL 생성 로직
    public String googleInitUrl() {
        Map<String, Object> params = new HashMap<>();
        params.put("client_id", getGoogleClientId());
        params.put("redirect_uri", getGoogleRedirectUrl());
        params.put("response_type", "code");
        params.put("scope", getScopeUrl());

        String paramStr = params.entrySet().stream()
                .map(param -> param.getKey() + "=" + param.getValue())
                .collect(Collectors.joining("&"));

        return getGoogleLoginUrl()
                + "/o/oauth2/v2/auth"
                + "?"
                + paramStr;
    }
	
	// 소셜로그인(구글)을 위한 getter
	public String getGoogleAuthUrl() {
		return googleAuthUrl;
	}

	public String getGoogleLoginUrl() {
		return googleLoginUrl;
	}

	public String getGoogleRedirectUrl() {
		return googleRedirectUrl;
	}

	public String getGoogleClientId() {
		return googleClientId;
	}

	public String getGoogleSecret() {
		return googleSecret;
	}
	
	// scope의 값을 보내기 위해 띄어쓰기 값을 UTF-8로 변환하는 로직 포함 
    public String getScopeUrl() {
        return googleAuthScopes.replaceAll(",", "%20");
    }
}
