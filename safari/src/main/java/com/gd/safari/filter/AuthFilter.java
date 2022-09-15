package com.gd.safari.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.boot.reactor.DebugAgentEnvironmentPostProcessor;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@WebFilter("/safari/*")
public class AuthFilter extends HttpFilter implements Filter {
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// 디버깅
		log.debug(TeamColor.CSH + "***AuthFilter***");
		
		HttpSession session = null;
		if(request instanceof HttpServletRequest) {
			session = ((HttpServletRequest)request).getSession();
			
			// 세션에 값 분리하기 
			Member member = (Member)session.getAttribute("login");
			
			// 인증범위에 따라 분기시키기
			if(member == null) { // login에 값이 없을 경우 재요청하기
				// 디버깅
				log.debug(TeamColor.CSH + "AuthFilter login : null - 로그인 페이지로 이동");
				((HttpServletResponse)response).sendRedirect(((HttpServletRequest)request).getContextPath() + "/account/login");
				return;
			}
			
			if("N".equals(member.getActive())) {
				// 디버깅
				log.debug(TeamColor.CSH + "AuthFilter login : 비활성화된 계정 - 계정잠금해제 페이지로 이동");
				((HttpServletResponse)response).sendRedirect(((HttpServletRequest)request).getContextPath() + "/lock/unlock-user");
				return;
			}
		} else {
			log.debug(TeamColor.CSH + "AuthFilter login : 웹요청이 아닙니다.");
			// 404 page를 띄어줄 수도 있고(redirect) 아니면  처리를 해야함
			return;
		}
		
		chain.doFilter(request, response);
	}
}
