package com.gd.safari.restController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.service.ILowerTaskService;

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
	
	// 하위업무가 아닌 리스트
	@PostMapping("/safari/lowerTaskN")
	public List<Map<String, Object>> lowerTaskN(int projectNo, int taskNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 하위업무가 아닌 리스트");
		
		// param 값 가공
		Map<String, Integer> m = new HashMap<>();
		m.put("projectNo", projectNo);
		m.put("taskNo", taskNo);
				
		// 서비스호출
		// 리턴값 List<Map<String, Object>>
		List<Map<String, Object>> lowerTask = lowerTaskService.getLowerTaskByProjectNo(m);
		
		log.debug(TeamColor.CSH + "하위업무가 아닌 리스트 개수 : " + lowerTask.size());
		
		return lowerTask;
	}
	
	// 하위 업무 추가
	@PostMapping("/safari/insertLowerTask")
	public String insertLowerTask(int taskNo, int lowerTaskNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 하위 업무 추가");
		// 디버깅
		log.debug(TeamColor.CSH + "lowerTaskNo : " + lowerTaskNo + "taskNo : " + taskNo);
		
		// param 값 가공
		Map<String, Integer> m = new HashMap<>();
		m.put("taskNo", taskNo);
		m.put("lowerTaskNo", lowerTaskNo);
		
		// 서비스 호출
		// 리턴값 int - 0일 경우 실행되지 않음
		int row = lowerTaskService.modifyinsertLowerTask(m);
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
	
	// 하위 업무 해제
	@PostMapping("/safari/deleteLowerTask")
	public String deleteLowerTask(int lowerTaskNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 하위 업무 해제");
		// 디버깅
		log.debug(TeamColor.CSH + lowerTaskNo);
		
		// 서비스 호출
		// 리턴값 int - 0일 경우 실행되지 않음
		int row = lowerTaskService.modifydeleteLowerTask(lowerTaskNo);
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
