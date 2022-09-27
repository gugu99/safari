package com.gd.safari.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.mapper.IFeedbackMapper;
import com.gd.safari.mapper.IFeedbackReceiverMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class FeedbackService implements IFeedbackService {
	@Autowired
	private IFeedbackMapper feedbackMapper;
	@Autowired
	private IFeedbackReceiverMapper feedbackReceiverMapper;
	
	// 피드백 작성
	// 피드백 작성 후 피드백 번호 가져와서 피드백 받는 사람 추가
	@Override
	@Transactional(rollbackFor = Exception.class)
	public void addFeedback(Map<String, Object> map) {
		log.debug(TeamColor.GDE + "map --- " + map);
		
		// 피드백 받는 사람 배열로 가공하기
		String tmp = (String)map.get("scheduleMemberList");
		String[] feedbackReceiverList = tmp.split(",");
		
		// feedbackReceiverList map에서 삭제
		map.remove("scheduleMemberList");
		
		// 피드백 작성하기
		int row = feedbackMapper.insertFeedback(map);
		log.debug(TeamColor.GDE + "row --- " + row);
		// selectKey로 feedbackNo 잘 받아왔는지 확인
		log.debug(TeamColor.GDE + "map --- " + map);
		
		// 피드백 받는 사람만큼 피드백 recevier 추가
		for (String receiverEmail : feedbackReceiverList) {
			map.put("feedbackReceiver", receiverEmail);
			
			feedbackReceiverMapper.insertFeedbackReceiver(map);
		}
	}

}
