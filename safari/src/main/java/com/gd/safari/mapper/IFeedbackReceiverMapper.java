package com.gd.safari.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IFeedbackReceiverMapper {
	// 피드백 멤버 추가
	int insertFeedbackReceiver(Map<String, Object> map);
	
	// 피드백 수정을 위한 기존 피드백 수신자 조회
	List<String> selectFeedbackReceiverByFeedbackNo(int feedbackNo);
	
	// 기존 수신자와 해당 피드백의 업무 멤버 조회
	List<Map<String, Object>> selectFeedbackReceiverAndtaskMember(int feedbackNo, int taskNo);
	
	// 피드백 수신자 삭제
	int deleteFeedbackReceiverByFeedbackNoAndEmail(Map<String, Object> map);
}
