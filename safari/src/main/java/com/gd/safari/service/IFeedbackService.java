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
}
