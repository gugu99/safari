package com.gd.safari.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.mapper.IScheduleMemberMapper;
import com.gd.safari.vo.ScheduleMember;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ScheduleMemberService implements IScheduleMemberService {
	@Autowired
	private IScheduleMemberMapper scheduleMemberMapper;

	// 일정 참석 여부 변경
	@Override
	public int modifyScheduleAttend(ScheduleMember scheduleMember) {
		log.debug(TeamColor.GDE + scheduleMember);
		
		int row = 0;
		// 기존 참석 여부
		String attend = scheduleMemberMapper.selectScheduleAttend(scheduleMember);
		
		// 기존 참석 여부와 변경하려는 참석여부가 다르면
		if (!attend.equals(scheduleMember.getScheduleAttend())) {
			// 일정 참석여부 변경하기
			row = scheduleMemberMapper.updateScheduleAttend(scheduleMember);
		}
		log.debug(TeamColor.GDE + "row --- " + row);
		
		return row;
	}

}
