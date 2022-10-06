package com.gd.safari.commons;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Aspect
@Component
public class LogAspect {
	@Before("execution(* com.gd.safari.controller.TaskController")
	public void beforeMathod() {
		log.debug(TeamColor.CSH + "***Before : LogAspect***");
	}

	@After("execution(* com.gd.safari.controller.TaskController")
	public void afterMathod() {
		log.debug(TeamColor.CSH + "***After : LogAspect***");
	}
}
