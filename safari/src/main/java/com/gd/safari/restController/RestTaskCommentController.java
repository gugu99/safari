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
import com.gd.safari.service.ITaskCommentService;
import com.gd.safari.vo.TaskComment;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class RestTaskCommentController {
	@Autowired private ITaskCommentService taskCommentService;

	// 업무 코멘트리스트 개수 가져오기 - app-kanban.js 에서 사용할 것
	@GetMapping("/member/taskCommentCnt")
	public List<Map<String, Object>> taskCommentCnt(HttpSession session) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무 코멘트리스트 개수 가져오기 - app-kanban.js 에서 사용할 것");
		List<Map<String, Object>> taskCommentCnt = taskCommentService.getTaskCommentCnt((int) session.getAttribute("projectNo"));
		
		// 디버깅
		log.debug(TeamColor.CSH + taskCommentCnt);
		
		return taskCommentCnt;
	}

	// 업무 코멘트리스트 가져오기
	@GetMapping("/member/taskCommentList")
	public List<Map<String, Object>> taskCommentList(int taskNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무 코멘트리스트 가져오기");
		List<Map<String, Object>> taskCommentList = taskCommentService.getTaskComment(taskNo);
		
		// 디버깅
		log.debug(TeamColor.CSH + taskCommentList);
		
		return taskCommentList;
	}
	
	// 업무 코멘트 가져오기 (수정 / 상위코멘트)
	@GetMapping("/member/taskCommentOne")
	public Map<String, Object> taskCommentOne(int taskCmtNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무 코멘트 가져오기");
		Map<String, Object> taskComment = taskCommentService.getTaskCommentByTaskCmtNo(taskCmtNo);

		// 디버깅
		log.debug(TeamColor.CSH + taskComment);
		
		return taskComment;
	}

	// 고정된 코멘트 있을 경우 가져오기
	@GetMapping("/member/fixedTaskComment")
	public Map<String, Object> fixedTaskComment(int taskNo){
		log.debug(TeamColor.CSH + this.getClass() + " 고정된 코멘트 있을 경우 가져오기");
		Map<String, Object> fixedTaskComment = taskCommentService.getFixTaskCommentByTaskNo(taskNo);

		// 디버깅
		log.debug(TeamColor.CSH + fixedTaskComment);
		
		return fixedTaskComment;
	}
	
	// 업무 코멘트를 업무로 만들기 위해 내용 가져오기
	@GetMapping("/member/taskCommentContent")
	public String taskCommentContent(int taskCmtNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무 코멘트 생성");
		
		// 디버깅
		log.debug(TeamColor.CSH + "taskCmtNo : " + taskCmtNo);
		
		// 서비스호출
		String taskCommentContent = taskCommentService.getTaskCommentToTask(taskCmtNo);
		
		return taskCommentContent;
	}
	
	// 업무 코멘트 생성
	@PostMapping("/member/insertTaskComment")
	public String insertTaskComment(HttpSession session, TaskComment taskComment) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무 코멘트 생성");
		
		// 파라미터 파싱
		taskComment.setTaskCmtWriter((String) session.getAttribute("login"));
		
		// 디버깅
		log.debug(TeamColor.CSH + taskComment);
		
		// 서비스호출
		int row = taskCommentService.addTaskComment(taskComment);
		
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
	
	// 업무 코멘트 수정
	@PostMapping("/member/updateTaskComment")
	public String updateTaskComment(HttpSession session, TaskComment taskComment) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무 코멘트 수정");
		
		// 디버깅
		log.debug(TeamColor.CSH + taskComment);

		// 세션의 이메일과 해당 코멘트 작성자가 같아야 수정 가능
		// 파라미터 가공 (파싱)
		taskComment.setTaskCmtWriter((String) session.getAttribute("login"));
		
		// 서비스호출
		int row = taskCommentService.modifyTaskComment(taskComment);
		
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
	
	// 업무 코멘트 고정하기
	@PostMapping("/member/fixTaskComment")
	public String fixTaskComment(HttpSession session, int taskCmtNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무 코멘트 고정하기");
		
		// 디버깅
		log.debug(TeamColor.CSH + "taskCmtNo : " + taskCmtNo);
			// 파라미터 파싱
		Map<String, Object> m = new HashMap<>();
		m.put("taskCmtNo", taskCmtNo);
		m.put("projectNo", session.getAttribute("projectNo"));
		m.put("workMemberName", session.getAttribute("workMemberName"));
		
		// 서비스호출
		int row = taskCommentService.modifyFixTaskComment(m);
		
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
	
	// 업무 코멘트 삭제
	@PostMapping("/member/deleteTaskComment")
	public String deleteTaskComment(HttpSession session, int taskCmtNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무 코멘트 삭제");
		
		// 디버깅
		log.debug(TeamColor.CSH + "taskCmtNo : " + taskCmtNo);
		
		// 세션의 이메일과 해당 코멘트 작성자가 같아야 삭제 가능
		// 파라미터 가공
		TaskComment taskCmt = new TaskComment();
		// 작성자 
		taskCmt.setTaskCmtNo(taskCmtNo);
		taskCmt.setTaskCmtWriter((String) session.getAttribute("login"));
		
		// 서비스호출
		int row = taskCommentService.removeTaskComment(taskCmt);
		
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
