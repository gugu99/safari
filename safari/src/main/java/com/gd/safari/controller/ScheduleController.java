package com.gd.safari.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.service.IScheduleService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ScheduleController {
	
	@Autowired
	private IScheduleService scheduleService;

	// 일정 리스트 페이지 이동
	@GetMapping("/safari/scheduleList")
	public String scheduleList(HttpSession session, Model model, @RequestParam(value = "search", required = false) String search) {
		log.debug(TeamColor.GDE + "search --- " + search);
		Map<String, Object> paramMap = new HashMap<>();
		
		// 세션에 저장된 projectNo 가져오기
		int projectNo = (int)session.getAttribute("projectNo");
		log.debug(TeamColor.GDE + "projectNo --- " + projectNo);
		
		// 세션에 저장된 workNo 가져오기
		int workNo = (int)session.getAttribute("workNo");
		log.debug(TeamColor.GDE + "workNo --- " + workNo);
		
		// 세션에 저장된 workMemberNo 가져오기
		if (session.getAttribute("guest") == null) {
			int workMemberNo = (int)session.getAttribute("workMemberNo");
			log.debug(TeamColor.GDE + "workMemberNo --- " + workMemberNo);
			paramMap.put("workNo", workNo);
		}
		// map에 담아 준다.
		paramMap.put("search", search);
		paramMap.put("projectNo", projectNo);
		log.debug(TeamColor.GDE + "paramMap --- " + paramMap);
		
		// 일정 리스트 가져오기
		Map<String, Object> map = scheduleService.getScheduleList(paramMap);
		log.debug(TeamColor.GDE + "scheduleList --- " + map.get("scheduleList"));
		log.debug(TeamColor.GDE + "projectMemberList --- " + map.get("projectMemberList"));
		
		// map에 담긴 각 리스트를 model에 저장
		model.addAttribute("scheduleList", map.get("scheduleList"));
		model.addAttribute("projectMemberList", map.get("projectMemberList"));
		model.addAttribute("manager", map.get("manager"));
		
		return "schedule/scheduleList";
	}
	
	// 일정 추가 
	@PostMapping("/member/addScheduleList")
	public String addSchedule(HttpSession session, @RequestParam Map<String, Object> map) {
		log.debug(TeamColor.GDE + "map --- " + map);
		// 세션에 저장된 projectNo 가져와서 map에 넣어주기
		int projectNo = (int)session.getAttribute("projectNo");
		map.put("projectNo", projectNo);
		log.debug(TeamColor.GDE + "projectNo --- " + projectNo);
		
		// 일정 추가
		scheduleService.addSchedule(map);
		
		return "redirect:/safari/scheduleList";
	}
	
	// 일정 수정 폼으로 이동
	@GetMapping("/member/modifySchedule")
	public String modifySchedule(HttpSession session ,Model model, @RequestParam int scheduleNo) {
		log.debug(TeamColor.GDE + "scheduleNo --- " + scheduleNo);
		
		// 세션에 저장된 workNo 가져오기
		int workNo = (int)session.getAttribute("workNo");
		log.debug(TeamColor.GDE + "workNo --- " + workNo);
		
		// 세션에 저장된 projectNo 가져오기
		int projectNo = (int)session.getAttribute("projectNo");
		log.debug(TeamColor.GDE + "projectNo --- " + projectNo);
		
		// 일정 한개 데이터와 일정 멤버리스트를 Map에 담아준다.
		Map<String, Object> map = scheduleService.getScheduleOneByScheduleNo(scheduleNo, projectNo, workNo);
		log.debug(TeamColor.GDE + "scheduleMembers --- " + map.get("scheduleMembers"));
		// 페이지에 나타내주기위해 모델에 저장
		model.addAttribute("scheduleOne", map.get("scheduleOne"));
		model.addAttribute("scheduleMembers", map.get("scheduleMembers"));
		
		return "schedule/modifySchedule";
	}
	
	// 일정 수정
	@PostMapping("/member/modifySchedule")
	public String modifySchedule(RedirectAttributes redirectAttributes, @RequestParam Map<String, Object> map) {
		log.debug(TeamColor.GDE + "map --- " + map);
		
		int row = scheduleService.modifySchedule(map);
		
		if (row == 0) { // 일정 수정에 실패했을 때
			redirectAttributes.addFlashAttribute("scheduleModifyMsg", "일정 수정 실패!");
			return "redirect:/safari/scheduleList";
		}
		
		redirectAttributes.addFlashAttribute("scheduleModifyMsg", "일정 수정 성공!");
		
		return "redirect:/safari/scheduleList";
	}
	
	// 일정 삭제
	@GetMapping("/member/removeSchedule")
	public String removeSchedule(@RequestParam int scheduleNo) {
		log.debug(TeamColor.GDE + "scheduleNo --- " + scheduleNo);
		
		// 일정 삭제하기
		scheduleService.removeSchedule(scheduleNo);
		
		return "redirect:/safari/scheduleList";
	}
}
