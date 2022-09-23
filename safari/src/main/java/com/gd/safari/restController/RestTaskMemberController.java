package com.gd.safari.restController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.service.ITaskMemberService;
import com.gd.safari.vo.TaskMember;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class RestTaskMemberController {
	@Autowired private ITaskMemberService taskMemberService;
	
	// 프로젝트 멤버 - 해당 업무 멤버
	@GetMapping("/safari/resultTaskMember")
	public List<Map<String, Object>> resultTaskMember(HttpSession session, int taskNo){
		log.debug(TeamColor.CSH + this.getClass() + " 프로젝트 멤버 - 해당 업무 멤버");
		
		// 메서드 실행을 위해 필요한 프로젝트번호와 업무번호 받기
		Map<String,Integer> m = new HashMap<String, Integer>();
		m.put("projectNo", (int)session.getAttribute("projectNo"));
		m.put("taskNo", taskNo);
		
		// 서비스호출
		// 리턴값 List<Map<String, Object>>
		List<Map<String, Object>> result = taskMemberService.getTaskMemberByProjectNoAndTaskNo(m);
		
		log.debug(TeamColor.CSH + "조회에 따른 프로젝트멤버 : " + result.size());
		
		return result;
	}
	
	// 해당 업무에 따른 업무멤버 조회
	@PostMapping("/safari/taskMemberByTaskNo")
	public List<Map<String, Object>> taskMemberByTaskNo(HttpSession session, int taskNo){
		log.debug(TeamColor.CSH + this.getClass() + " 해당 업무에 따른 업무멤버 조회");
		
		// 메서드 실행을 위해 필요한 프로젝트번호와 업무번호 받기
		Map<String,Integer> m = new HashMap<String, Integer>();
		m.put("projectNo", (int)session.getAttribute("projectNo"));
		m.put("taskNo", taskNo);

		// 서비스호출
		// 리턴값 List<Map<String, Object>>
		List<Map<String, Object>> taskMember = taskMemberService.getTaskMemberByTaskNo(m);
		
		log.debug(TeamColor.CSH + "조회에 따른 업무멤버 개수 : " + taskMember.size());
		
		return taskMember;
	}
	
	// 업무멤버 생성
	@PostMapping("/safari/insertTaskMember")
	public String insertTaskMember(TaskMember taskMember) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무멤버 생성");
		// 디버깅
		log.debug(TeamColor.CSH + taskMember);
		
		// 서비스 호출
		// 리턴값 int - 0일 경우 실행되지 않음
		int row = taskMemberService.addTaskMember(taskMember);
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
	
	// 업무멤버 삭제
	@PostMapping("/safari/deleteTaskMember")
	public String deleteTaskMember(TaskMember taskMember) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무멤버 삭제");
		// 디버깅
		log.debug(TeamColor.CSH + taskMember);
		
		// 서비스 호출
		// 리턴값 int - 0일 경우 실행되지 않음
		int row = taskMemberService.removeTaskMember(taskMember);
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
