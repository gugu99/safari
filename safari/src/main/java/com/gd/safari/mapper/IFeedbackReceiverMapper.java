package com.gd.safari.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IFeedbackReceiverMapper {
	// 피드백 멤버 추가
	int insertFeedbackReceiver(Map<String, Object> map);
}
