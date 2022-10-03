package com.gd.safari.restController;

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

	// 업무 코멘트리스트 가져오기
	@GetMapping("/member/taskCommentList")
	public List<Map<String, Object>> taskCommentList(int taskNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무 코멘트리스트 가져오기");
		List<Map<String, Object>> taskCommentList = taskCommentService.getTaskComment(taskNo);
		
		return taskCommentList;
	}
	
	// 수정하기 위한 업무 코멘트 가져오기
	@GetMapping("/member/taskCommentOne")
	public Map<String, Object> taskCommentOne(int taskCmtNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 수정하기 위한 업무 코멘트 가져오기");
		Map<String, Object> taskComment = taskCommentService.getTaskCommentByTaskCmtNo(taskCmtNo);
		
		return taskComment;
	}
	
	// 업무 코멘트 생성
	@PostMapping("/member/insertTaskComment")
	public String insertTaskComment(HttpSession session, int taskNo, String taskCmtContent) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무 코멘트 생성");
		
		// 디버깅
		log.debug(TeamColor.CSH + "taskNo : " + taskNo + " taskCmtContent : " + taskCmtContent);

		// 파라미터 가공 (파싱)
		TaskComment taskCmt = new TaskComment();
		// 작성자
		taskCmt.setTaskCmtWriter((String) session.getAttribute("login"));
		taskCmt.setTaskNo(taskNo);
		taskCmt.setTaskCmtContent(taskCmtContent);
		
		// 서비스호출
		int row = taskCommentService.addTaskComment(taskCmt);
		
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
	public String updateTaskComment(int taskCmtNo, String taskCmtContent) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무 코멘트 수정");
		
		// 디버깅
		log.debug(TeamColor.CSH + "taskNo : " + taskCmtNo + " taskCmtContent : " + taskCmtContent);

		// 파라미터 가공 (파싱)
		TaskComment taskCmt = new TaskComment();
		// 작성자 
		taskCmt.setTaskNo(taskCmtNo);
		taskCmt.setTaskCmtContent(taskCmtContent);
		
		// 서비스호출
		int row = taskCommentService.modifyTaskComment(taskCmt);
		
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
	public String deleteTaskComment(int taskCmtNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무 코멘트 삭제");
		
		// 디버깅
		log.debug(TeamColor.CSH + "taskNo : " + taskCmtNo);
		
		// 서비스호출
		int row = taskCommentService.removeTaskComment(taskCmtNo);
		
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
