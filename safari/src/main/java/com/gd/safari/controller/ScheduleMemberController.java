package com.gd.safari.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.service.IScheduleMemberService;
import com.gd.safari.vo.ScheduleMember;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ScheduleMemberController {
	@Autowired
	private IScheduleMemberService scheduleMemberService;
	
	// 일정 참석여부 변경
	@GetMapping("/member/modifyScheduleAttend")
	public String modifyScheduleAttend(HttpSession session, RedirectAttributes redirectAttributes, @RequestParam Map<String, Object> map) {
		log.debug(TeamColor.GDE + map);
		
		// 세션에 있는 이메일 값을 가져오기
		String email = (String)session.getAttribute("login");
		// 이메일 값을 scheduleMember에 setter
		map.put("scheduleMemberEmail",email);
		
		// 일정 참석여부 변경
		int row = scheduleMemberService.modifyScheduleAttend(map);
		log.debug(TeamColor.GDE + "row --- " + row);
		
		if (row == 0) { // 업데이트 된게 없으면 이미 누른 참석여부
			redirectAttributes.addFlashAttribute("scheduleAttendMsg", "이미 해당 참석여부에 투표하였습니다.");
			return "redirect:/safari/scheduleList";
		}
		
		redirectAttributes.addFlashAttribute("scheduleAttendMsg", "참석여부에 투표되었습니다.");
		
		return "redirect:/safari/scheduleList";
	}
}
