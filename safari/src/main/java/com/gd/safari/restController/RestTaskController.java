package com.gd.safari.restController;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.service.ITaskService;
import com.gd.safari.vo.Task;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class RestTaskController {
	@Autowired private ITaskService taskService;
	
	// 프로젝트 번호에 맞는 업무 조회
	@PostMapping("/safari/task")
	public List<Task> task(HttpSession session) {
		log.debug(TeamColor.CSH + this.getClass() + " 프로젝트 번호에 맞는 업무 조회");
		
		// 서비스호출
		// 리턴값 List<Task>
		List<Task> tasks = taskService.getTaskByProjectNo((int)session.getAttribute("projectNo"));
		
		log.debug(TeamColor.CSH + "조회에 따른 업무 개수 : " + tasks.size());
		
		return tasks;
	}
	
	// 업무 상세보기
	@GetMapping("/safari/taskDetail")
	public Map<String, Object> taskDetail(int taskNo){
		log.debug(TeamColor.CSH + this.getClass() + " 업무 상세보기");
		
		// 서비스호출
		// 리턴값 Map<String, Object>
		Map<String, Object> task = taskService.getTaskByTaskNo(taskNo);
		
		log.debug(TeamColor.CSH + "업무 상세내용 : " + task);
		
		return task;
	}
	
	// 업무 생성
	@PostMapping("/safari/insertTask")
	public String insertTask(HttpSession session, Task task) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무 생성");
		// 디버깅
		log.debug(TeamColor.CSH + task);
		
		// 세션값에 있는 작성자 task VO에 setter로 담기
		task.setTaskWriter((String) session.getAttribute("login"));
		
		// 서비스 호출
		// 리턴값 int - 0일 경우 실행되지 않음
		int row = taskService.addTask(task);
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
	
	// 업무 삭제
	@PostMapping("/safari/deleteTask")
	public String deleteTask(int taskNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무 삭제");
		// 디버깅
		log.debug(TeamColor.CSH + taskNo);
		
		// 서비스 호출
		// 리턴값 int - 0일 경우 실행되지 않음
		int row = taskService.removeTask(taskNo);
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
