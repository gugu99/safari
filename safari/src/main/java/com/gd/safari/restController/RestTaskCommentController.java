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
		
		// 디버깅
		log.debug(TeamColor.CSH + taskCommentList);
		
		return taskCommentList;
	}
	
	// 수정하기 위한 업무 코멘트 가져오기
	@GetMapping("/member/taskCommentOne")
	public Map<String, Object> taskCommentOne(int taskCmtNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 수정하기 위한 업무 코멘트 가져오기");
		Map<String, Object> taskComment = taskCommentService.getTaskCommentByTaskCmtNo(taskCmtNo);

		// 디버깅
		log.debug(TeamColor.CSH + taskComment);
		
		return taskComment;
	}

	// 고정된 코멘트 있을 경우 가져오기
	@GetMapping("/member/fixedTaskComment")
	public Map<String, Object> fixedTaskComment(int taskNo){
		log.debug(TeamColor.CSH + this.getClass() + " 고정된 코멘트 있을 경우 가져오기");
		Map<String, Object> fixedTaskComment = taskCommentService.getTaskCommentByTaskCmtNo(taskNo);

		// 디버깅
		log.debug(TeamColor.CSH + fixedTaskComment);
		
		return fixedTaskComment;
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
	public String updateTaskComment(HttpSession session, int taskCmtNo, String taskCmtContent) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무 코멘트 수정");
		
		// 디버깅
		log.debug(TeamColor.CSH + "taskCmtNo : " + taskCmtNo + " taskCmtContent : " + taskCmtContent);

		// 세션의 이메일과 해당 코멘트 작성자가 같아야 수정 가능
		// 파라미터 가공 (파싱)
		TaskComment taskCmt = new TaskComment();
		// 작성자 
		taskCmt.setTaskCmtNo(taskCmtNo);
		taskCmt.setTaskCmtContent(taskCmtContent);
		taskCmt.setTaskCmtWriter((String) session.getAttribute("login"));
		
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
	
	// 업무 코멘트 고정하기
	@PostMapping("/member/fixTaskComment")
	public String fixTaskComment(int taskCmtNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무 코멘트 고정하기");
		
		// 디버깅
		log.debug(TeamColor.CSH + "taskCmtNo : " + taskCmtNo);
		
		// 서비스호출
		int row = taskCommentService.modifyFixTaskComment(taskCmtNo);
		
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
