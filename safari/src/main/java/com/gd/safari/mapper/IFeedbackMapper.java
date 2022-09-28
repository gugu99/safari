package com.gd.safari.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.safari.vo.Feedback;
import com.gd.safari.vo.FeedbackList;
import com.gd.safari.vo.WorkspaceMember;

@Mapper
public interface IFeedbackMapper {
	// 피드백 작성하기
	int insertFeedback(Map<String, Object> map);
	
	// 피드백 리스트 조회
	List<FeedbackList> selectFeedbackByWorkspaceMember(WorkspaceMember workspaceMember);
	
	// 피드백 수정을 위한 피드백 한개 조회
	Map<String, Object> selectFeedbackOne(int feedbackNo);
	
	// 피드백 수정하기
	int updateFeedback(Map<String, Object> map);
		
}
