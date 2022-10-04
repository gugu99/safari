package com.gd.safari.restController;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.service.ITaskCommentLikeService;
import com.gd.safari.vo.TaskCommentLike;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class RestTaskCommentLikeController {
	@Autowired private ITaskCommentLikeService taskCommentLikeService;
	
	// 세션안에 이메일 보내기 (본인이 작성한 코멘트만 수정 / 삭제하게 하기위해)
	@GetMapping("/member/memberEmail")
	public String memberEmail(HttpSession session) {
		log.debug(TeamColor.CSH + this.getClass() + " 세션안에 이메일 보내기 (본인이 작성한 코멘트만 수정 / 삭제하게 하기위해)");
		return (String) session.getAttribute("login");
	}
	
	// 해당 업무번호에 따른 업무코멘트 좋아요 가져오기
	@GetMapping("/member/taskCommentLikeList")
	public List<Map<String, Object>> taskCommentLikeList(int taskNo){
		log.debug(TeamColor.CSH + this.getClass() + " 해당 업무번호에 따른 업무코멘트 좋아요 가져오기");
		
		// 서비스 호출
		List<Map<String, Object>> taskCommentLikeList = taskCommentLikeService.getTaskCommentLike(taskNo);
		
		// 디버깅
		log.debug(TeamColor.CSH + taskCommentLikeList);
		
		return taskCommentLikeList;
	}
	
	// 업무코멘트 좋아요 확인 후 생성 혹은 삭제
	@PostMapping("/member/taskCommentLike")
	public String taskCommentLike(HttpSession session, int taskCmtNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무코멘트 좋아요 확인 후 생성 혹은 삭제");

		// 메서드 실행 전 변수 초기화
		int row = 0;
		// json으로 만들 변수 초기화
		String jsonStr = "";
		
		// 파라미터 가공
		TaskCommentLike taskCommentLike = new TaskCommentLike();
		taskCommentLike.setMemberEmail((String) session.getAttribute("login"));
		taskCommentLike.setTaskCmtNo(taskCmtNo);
		
		// 생성 전 이미 존재하는 지 확인
		TaskCommentLike taskCommentLikeCheck = taskCommentLikeService.getTaskCommentLikeCheck(taskCommentLike);
		// null 이라면 존재하지 않음 - 생성 가능
		if(taskCommentLikeCheck == null) {
			row = taskCommentLikeService.addTaskCommentLike(taskCommentLike);
		} else { // 존재할 경우 - 삭제 가능
			row = taskCommentLikeService.removeTaskCommentLike(taskCommentLike);
		}
		
		// 메서드의 결과에 따라 json 분기
		if(row != 0 && taskCommentLikeCheck == null) { // 생성 성공
			jsonStr = "insert ok";
		} else if(row != 0 && taskCommentLikeCheck != null) { // 삭제 성공
			jsonStr = "delete ok";
		} else {
			jsonStr = "not ok";
		}
		
		return jsonStr;
	}
}
