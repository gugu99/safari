package com.gd.safari.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.mapper.IScheduleCommentLikeMapper;
import com.gd.safari.vo.ScheduleCommentLike;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ScheduleCommentLikeService implements IScheduleCommentLikeService {
	@Autowired
	IScheduleCommentLikeMapper scheduleCommentLikeMapper;

	@Override
	public int addScheduleCommentLike(ScheduleCommentLike scheduleCommentLike) {
		// 좋아요가 추가됐는지 확인용 리턴값
		int row = 0;
		
		// 댓글좋아요 했는지 안했는지 이메일 조회
		String email = scheduleCommentLikeMapper.selectScheduleCommentLikeByScheduleCmtNoAndMemberEmail(scheduleCommentLike);
		
		// email이 null이면 댓글 좋아요 안한 사람, null이 아니면 이미 댓글 좋아요 한사람
		// 댓글 좋아요 안한 사람일 경우만 좋아요 추가
		if (email == null) {
			row = scheduleCommentLikeMapper.insertScheduleCommentLike(scheduleCommentLike);
		}
		
		log.debug(TeamColor.GDE + "row --- " + row);
		
		return row;
	}
}
