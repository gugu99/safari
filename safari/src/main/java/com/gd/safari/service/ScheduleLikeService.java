package com.gd.safari.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.mapper.IScheduleLikeMapper;
import com.gd.safari.vo.ScheduleLike;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ScheduleLikeService implements IScheduleLikeService {
	@Autowired
	IScheduleLikeMapper scheduleLikeMapper;

	@Override
	public int addScheduleLike(ScheduleLike scheduleLike) {
		// 좋아요가 추가됐는지 확인용 리턴값
		int row = 0;
		
		// 좋아요 했는지 안했는지 조회
		String email = scheduleLikeMapper.selectScheduleLikeByScheduleNoAndMemberEmail(scheduleLike);
		log.debug(TeamColor.GDE + "email --- " + email);
		
		// email이 null이면 좋아요 안한 사람, null이 아니면 좋아요 한 사람
		// 좋아요 안한 사람일 경우만 좋아요 추가
		if (email == null) {
			row = scheduleLikeMapper.insertScheduleLike(scheduleLike);
		}
		log.debug(TeamColor.GDE + "row --- " + row);
		
		return row;
	}
	
}
