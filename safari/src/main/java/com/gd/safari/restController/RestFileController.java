package com.gd.safari.restController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.service.IFileService;
import com.gd.safari.vo.Task;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class RestFileController {
	@Autowired private IFileService fileService;
	
	
	// 아이디에 맞는 Code 가져오기
		@PostMapping("/member/tasklist")
		public @ResponseBody List<Task> TaskList(@RequestParam(value="tasklistNo") int tasklistNo) {
			
			// 업무리스트번호 디버깅
			log.debug(TeamColor.CJM+tasklistNo +"tasklistNo RestController");
			
			// code 불러오기
			List<Task> list = fileService.getTaskList(tasklistNo);	  
			
			// task 리턴 코드
			return list;
		}

}
