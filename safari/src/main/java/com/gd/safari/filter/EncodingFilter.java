package com.gd.safari.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;

import com.gd.safari.commons.TeamColor;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@WebFilter("/*")
public class EncodingFilter extends HttpFilter implements Filter {
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		request.setCharacterEncoding("utf-8");
//		log.debug(TeamColor.GDE + "***EncodingFilter***");
		
		
		chain.doFilter(request, response);
		
	}

}
