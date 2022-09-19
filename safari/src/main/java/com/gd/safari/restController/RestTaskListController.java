package com.gd.safari.restController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.service.ITaskListService;
import com.gd.safari.vo.TaskList;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class RestTaskListController {
	@Autowired private ITaskListService taskListService;
	
	// 업무리스트 생성
	@GetMapping("/safari/insertTaskList")
	public @ResponseBody String insertTaskList(TaskList tasklist) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무리스트 생성");
		// 디버깅
		log.debug(TeamColor.CSH + tasklist);
		
		// 서비스 호출
		// 리턴값 int - 0일 경우 실행되지 않음
		int row = taskListService.addTaskList(tasklist);
		// json으로 만들 변수 초기화
		String jsonStr = "";
		
		// 메서드의 결과에 따라 json 분기
		if(row != 0) { // 성공
			jsonStr = "ok";
		} else { // 실패
			jsonStr = "not ok";
		}
		
		return jsonStr;
	}
	
	// 업무리스트 수정
	@GetMapping("/safari/updateTaskList")
	public @ResponseBody String updateTaskList(TaskList tasklist) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무리스트 수정");
		// 디버깅
		log.debug(TeamColor.CSH + tasklist);
		
		// 서비스 호출
		// 리턴값 int - 0일 경우 실행되지 않음
		int row = taskListService.modifyTaskList(tasklist);
		// json으로 만들 변수 초기화
		String jsonStr = "";
		
		// 메서드의 결과에 따라 json 분기
		if(row != 0) { // 성공
			jsonStr = "ok";
		} else { // 실패
			jsonStr = "not ok";
		}
		
		return jsonStr;
	}
	
	// 업무리스트 삭제
	@GetMapping("/safari/deleteTaskList")
	public @ResponseBody String deleteTaskList(int tasklistNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무리스트 삭제");
		// 디버깅
		log.debug(TeamColor.CSH + tasklistNo);
		
		// 서비스 호출
		// 리턴값 int - 0일 경우 실행되지 않음
		int row = taskListService.removeTaskList(tasklistNo);
		// json으로 만들 변수 초기화
		String jsonStr = "";
		
		// 메서드의 결과에 따라 json 분기
		if(row != 0) { // 성공
			jsonStr = "ok";
		} else { // 실패
			jsonStr = "not ok";
		}
		
		return jsonStr;
	}
}
