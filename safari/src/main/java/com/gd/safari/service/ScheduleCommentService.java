package com.gd.safari.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.mapper.IScheduleCommentMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ScheduleCommentService implements IScheduleCommentService {
	@Autowired
	IScheduleCommentMapper scheduleCommentMapper;

	// 댓글 작성하기
	@Override
	public int addScheduleComment(Map<String, Object> map) {
		log.debug(TeamColor.GDE + "댓글 작성 service");
		int row = scheduleCommentMapper.insertScheduleComment(map);
		log.debug(TeamColor.GDE + "row --- " + row);
		return row;
	}

	// 댓글 삭제하기
	@Override
	public int removeScheduleComment(int scheduleCmtNo) {
		log.debug(TeamColor.GDE + "댓글 삭제 service");
		int row = scheduleCommentMapper.deleteScheduleComment(scheduleCmtNo);
		log.debug(TeamColor.GDE + "row --- " + row);
		return row;
	}
}
