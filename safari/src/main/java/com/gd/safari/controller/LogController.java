package com.gd.safari.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.service.ILogService;
import com.gd.safari.vo.Log;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LogController {
	@Autowired
	private ILogService logService;

	// 워크스페이스게스트 정렬 리스트
	@GetMapping("/safari/logList")
	public String logList(Model model, HttpSession session,
			@RequestParam(value = "currentPage", required = false) Integer currentPage,
			@RequestParam Map<String, Object> map) {
		
		// currentPage 가 null 이면 1로설정
		if (currentPage == null) {
			currentPage = 1;
		}

		// rowPerpage 5 로 초기화
		int rowPerPage = 5;

		// 현재페이지에 따른 시작페이지 설정
		int beginRow = (currentPage - 1) * rowPerPage;

		// 현재페이지 매핑
		map.put("currentPage", currentPage);

		// 시작페이지 매핑
		map.put("beginRow", beginRow);

		// 보여줄 페이지 매핑
		map.put("rowPerPage", rowPerPage);

		// projectNo 세션 가져오기
		int projectNo = (int) session.getAttribute("projectNo");

		// map에 프로젝트 넘버 넣기
		map.put("projectNo", projectNo);

		// 로그 리스트 설정
		List<Log> list = logService.getLogList(map);

		// 총 count 가져오기
		int totalRow = logService.getLogCount(map);

		// 마지막 페이지 계산
		int lastPage = totalRow / rowPerPage;

		// 마지막 페이지에 5로 나누어 떨어지지 않으면 1더하기
		if (totalRow % rowPerPage != 0) {
			lastPage += 1;
		}

		// 페이지 시작 넘버
		int pageBegin = ((currentPage - 1) / rowPerPage) * rowPerPage + 1;

		// 페이지 끝 구하기
		int pageEnd = pageBegin + rowPerPage - 1;

		// 시작페이지 와 마지막 페이지중 다른것이 마지막 페이지로
		pageEnd = Math.min(pageEnd, lastPage);

		// LogList 디버깅
		log.debug(TeamColor.CJM + "noticeList" + list);

		
		log.debug(TeamColor.CJM + "lastPage" + lastPage);
		log.debug(TeamColor.CJM + "pageBegin" + pageBegin);
		log.debug(TeamColor.CJM + "pageEnd" + pageEnd);
		log.debug(TeamColor.CJM + "rowPerPage" + rowPerPage);
		log.debug(TeamColor.CJM + "currentPage" + currentPage);

		// model에 LogList page 매핑
		model.addAttribute("logList", list);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("pageBegin", pageBegin);
		model.addAttribute("pageEnd", pageEnd);
		model.addAttribute("rowPerPage", rowPerPage);
		model.addAttribute("currentPage", currentPage);

		// forward logList로
		return "log/logList";
	}
}
