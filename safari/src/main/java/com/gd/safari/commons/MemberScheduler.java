package com.gd.safari.commons;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.gd.safari.service.IMemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class MemberScheduler {
	@Autowired private IMemberService memberService;
	
	@Scheduled(cron = "0 0 0 * * *")
	public void modifyMemberActiveN() {
		log.debug(TeamColor.CSH + this.getClass() + " modifyMemberActiveN() 스케쥴러 실행");
		int row = memberService.modifyMemberActiveN();
		log.debug(TeamColor.CSH + row + "개의 계정이 비활성화 되었습니다.");
	}
}
