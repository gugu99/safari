package com.gd.safari.restController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.service.ILowerTaskService;
import com.gd.safari.vo.Task;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class RestLowerTaskController {
	@Autowired private ILowerTaskService lowerTaskService;
	
	// 하위업무 리스트 Map<String, Integer> map
	@PostMapping("/safari/lowerTask")
	public List<Map<String, Object>> lowerTask(int taskNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 하위업무 리스트");
		
		// 서비스호출
		// 리턴값 List<Map<String, Object>>
		List<Map<String, Object>> lowerTask = lowerTaskService.getLowerTaskByTaskNo(taskNo);
		
		log.debug(TeamColor.CSH + "하위업무 리스트 개수 : " + lowerTask.size());
		
		return lowerTask;
	}
	
	// 프로젝트번호에 맞는 업무 가져오기 (단, 자신이 아닌 것)
	@PostMapping("/safari/taskForLowerTask")
	public List<Map<String, Object>> taskForLowerTask(int projectNo, int taskNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 자신이 아닌 프로젝트번호에 맞는 업무 가져오기");
		
		// param 값 가공
		Map<String, Integer> m = new HashMap<>();
		m.put("projectNo", projectNo);
		m.put("taskNo", taskNo);
				
		// 서비스호출
		// 리턴값 List<Map<String, Object>>
		List<Map<String, Object>> task = lowerTaskService.getTaskByProjectNoForLowerTask(m);
		
		log.debug(TeamColor.CSH + "조회에 따른 업무 개수 : " + task.size());
		
		return task;
	}
	
	// 하위 업무 생성
	@PostMapping("/member/insertLowerTask")
	public String insertLowerTask(HttpSession session, int tasklistNo, int taskNo, String taskTitle) {
		log.debug(TeamColor.CSH + this.getClass() + " 하위 업무 생성");
		// 디버깅
		log.debug(TeamColor.CSH + "tasklistNo : " + tasklistNo + " taskNo : " + taskNo + " taskTitle" + taskTitle);
		
		// 파라미터 가공
		Task task = new Task();
		task.setTaskTitle(taskTitle);
		task.setTaskWriter((String)session.getAttribute("login"));
		task.setTasklistNo(tasklistNo);
		task.setTaskUpperNo(taskNo);

		// 서비스 호출
		// 리턴값 int - 0일 경우 실행되지 않음
		int row = lowerTaskService.addLowerTask(task);
		String jsonStr = "";
		
		// 메서드의 결과에 따라 json 분기
		if(row != 0) { // 성공
			jsonStr = "ok";
		} else { // 실패
			jsonStr = "not ok";
		}
		return jsonStr;
	}
	
	// 하위 업무 전환
	@PostMapping("/member/updateLowerTask")
	public String updateLowerTask(int taskNo, int lowerTaskNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 하위 업무 전환");
		// 디버깅
		log.debug(TeamColor.CSH + " taskNo : " + taskNo + " lowerTaskNo" + lowerTaskNo);
		
		// 파라미터 가공
		Map<String, Integer> m = new HashMap<>();
		m.put("taskNo", taskNo);
		m.put("lowerTaskNo", lowerTaskNo);

		// 서비스 호출
		// 리턴값 int - 0일 경우 실행되지 않음
		int row = lowerTaskService.modifyChangeLowerTask(m);
		String jsonStr = "";
		
		// 메서드의 결과에 따라 json 분기
		if(row != 0) { // 성공
			jsonStr = "ok";
		} else { // 실패
			jsonStr = "not ok";
		}
		return jsonStr;
	}
	
	// 메인 업무 전환
	@PostMapping("/member/deleteLowerTask")
	public String deleteLowerTask(int lowerTaskNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 하위 업무 해제");
		// 디버깅
		log.debug(TeamColor.CSH + lowerTaskNo);
		
		// 서비스 호출
		// 리턴값 int - 0일 경우 실행되지 않음
		int row = lowerTaskService.modifyChangeTask(lowerTaskNo);
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
