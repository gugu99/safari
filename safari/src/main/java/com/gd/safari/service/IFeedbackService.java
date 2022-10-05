package com.gd.safari.service;

import java.util.Map;

import com.gd.safari.vo.WorkspaceMember;

public interface IFeedbackService {
	// 피드백 작성하기
	void addFeedback(Map<String, Object> map);
	
	// 피드백 리스트, 회원정보 출력
	Map<String, Object> getFeedbackListAndMemberInfoByWorkspaceMember(WorkspaceMember workspaceMember, Map<String, Object> sender);
	
	// 피드백 한개 조회 - 수정 폼
	Map<String, Object> getFeedbackOne(int feedbackNo);
	
	// 피드백 수정하기 - 피드백 수신자, 피드백 내용, 공개권한
	void modifyFeedback(Map<String, Object> map);
	
	// 피드백 삭제
	void removeFeedback(Map<String, Object> map);
}
