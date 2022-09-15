package com.gd.safari.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@WebFilter("/account/*")
public class AccountFilter extends HttpFilter implements Filter {
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// 디버깅
		log.debug(TeamColor.CSH + "***AccountFilter***");
		
		HttpSession session = null;
		if(request instanceof HttpServletRequest) {
			session = ((HttpServletRequest)request).getSession();
			
			// 세션에 값 분리하기 
			Member member = (Member)session.getAttribute("login");
			
			// 인증범위에 따라 분기시키기
			if(member != null && "Y".equals(member.getActive())) { // login에 값이 있고 활성화된 계정일 경우 인덱스 페이지로 재요청하기
				// 디버깅
				log.debug(TeamColor.CSH + "AccountFilter login : 로그인 되어 있습니다. - 인덱스 페이지로 이동");
				((HttpServletResponse)response).sendRedirect(((HttpServletRequest)request).getContextPath() + "/safari/index");
				return;
			} else if(member != null && "N".equals(member.getActive())) { // 비활성화된 계정일 경우 재요청하기
				// 디버깅
				log.debug(TeamColor.CSH + "AuthFilter login : 비활성화된 계정입니다. - 계정잠금해제 페이지로 이동");
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
