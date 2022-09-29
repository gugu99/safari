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
	@Autowired private ILogService logService;
	
	
	// 워크스페이스게스트 정렬 리스트
		@GetMapping("/safari/logList")
		public String logList (Model model,HttpSession session,@RequestParam(value = "currentPage", required = false) Integer currentPage,
								@RequestParam Map<String,Object> map) {
			
			if(currentPage == null) {
				 currentPage = 1;
			}
			int rowPerPage = 5;
			int beginRow = (currentPage - 1) * rowPerPage;
			map.put("currentPage", currentPage);
			map.put("beginRow", beginRow);
			map.put("rowPerPage", rowPerPage);
			// projectNo 세션 가져오기
			int projectNo = (int)session.getAttribute("projectNo");
			// map에 프로젝트 넘버 넣기
			map.put("projectNo", projectNo);
			
			List<Log> list= logService.getLogList(map);
			
			int totalRow = logService.getLogCount(map);
			int lastPage = totalRow/rowPerPage;
			if(totalRow %rowPerPage!=0){
				lastPage +=1;}
			
			
			int pageBegin = ((currentPage - 1) / rowPerPage) * rowPerPage + 1; // 페이지 시작 넘버
			int pageEnd = pageBegin + rowPerPage - 1; // 페이지 끝 글 구하는 공식
			pageEnd = Math.min(pageEnd, lastPage); // 둘 중에 작은 값이 pageEnd
			
			// LogList 디버깅
			log.debug(TeamColor.CJM+"noticeList"+list);
			log.debug(TeamColor.CJM+"lastPage"+lastPage);
			log.debug(TeamColor.CJM+"pageBegin"+pageBegin);
			log.debug(TeamColor.CJM+"pageEnd"+pageEnd);
			log.debug(TeamColor.CJM+"rowPerPage"+rowPerPage);
			log.debug(TeamColor.CJM+"totalRow"+totalRow);
			log.debug(TeamColor.CJM+"currentPage"+currentPage);
			
			// model에 LogList 매핑
			model.addAttribute("logList",list);
			model.addAttribute("lastPage",lastPage);
			model.addAttribute("pageBegin",pageBegin);
			model.addAttribute("pageEnd",pageEnd);
			model.addAttribute("rowPerPage",rowPerPage);
			model.addAttribute("currentPage",currentPage);
			
			
			
			
			
			
			
			// forward logList로
			return "log/logList";  										   
		}
}
