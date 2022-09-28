package com.gd.safari.controller;
import java.util.List;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

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
		public String logList (Model model,HttpSession session, Log paramlog) {
			log.debug(TeamColor.CJM+paramlog +"Controller paramlog");
			
			// projectNo 세션 가져오기
			int projectNo = (int)session.getAttribute("projectNo");
			
			// log Vo에 ProjectNo 담기
			paramlog.setProjectNo(projectNo);
			
			List<Log> list= logService.getLogList(paramlog);
			
			model.addAttribute("logList",list);
			
			return "log/logList";  										   
		}
}
