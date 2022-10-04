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
	
	// 업무코멘트 좋아요 생성
	@PostMapping("/member/insertTaskCommentLike")
	public String insertTaskCommentLike(HttpSession session, int taskCmtNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무코멘트 좋아요 생성");
		
		// 파라미터 가공
		TaskCommentLike taskCommentLike = new TaskCommentLike();
		taskCommentLike.setMemberEmail((String) session.getAttribute("login"));
		taskCommentLike.setTaskCmtNo(taskCmtNo);
		
		int row = taskCommentLikeService.addTaskCommentLike(taskCommentLike);
		
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
