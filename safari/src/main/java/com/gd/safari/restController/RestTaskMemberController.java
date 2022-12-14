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
	
	// 프로젝트멤버 가져오기
	@GetMapping("/safari/taskMember")
	public List<Map<String, Object>> taskMember(HttpSession session){
		log.debug(TeamColor.CSH + this.getClass() + " 프로젝트멤버 가져오기");
		
		// 서비스호출
		// 리턴값 List<Map<String, Object>>
		List<Map<String, Object>> result = taskMemberService.getTaskMember((int)session.getAttribute("projectNo"));
		
		log.debug(TeamColor.CSH + "조회에 따른 프로젝트멤버 : " + result.size());
		
		return result;
	}
	
	// 프로젝트 멤버에서 해당 업무 멤버 뺀 나머지
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
	@PostMapping("/member/insertTaskMember")
	public String insertTaskMember(HttpSession session, TaskMember taskMember) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무멤버 생성");
		// 디버깅
		log.debug(TeamColor.CSH + taskMember);

		// 파라미터 파싱
		Map<String, Object> m = new HashMap<>();
		m.put("taskMember", taskMember);
		m.put("projectNo", session.getAttribute("projectNo"));
		m.put("workMemberName", session.getAttribute("workMemberName"));
				
		// 서비스 호출
		// 리턴값 int - 0일 경우 실행되지 않음
		int row = taskMemberService.addTaskMember(m);
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
	@PostMapping("/member/deleteTaskMember")
	public String deleteTaskMember(HttpSession session, TaskMember taskMember) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무멤버 삭제");
		// 디버깅
		log.debug(TeamColor.CSH + taskMember);
		
		// 파라미터 파싱
		Map<String, Object> m = new HashMap<>();
		m.put("taskMember", taskMember);
		m.put("projectNo", session.getAttribute("projectNo"));
		m.put("workMemberName", session.getAttribute("workMemberName"));
		
		// 서비스 호출
		// 리턴값 int - 0일 경우 실행되지 않음
		int row = taskMemberService.removeTaskMember(m);
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
