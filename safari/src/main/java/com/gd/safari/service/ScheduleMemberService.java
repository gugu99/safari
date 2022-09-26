package com.gd.safari.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.mapper.IScheduleCommentMapper;
import com.gd.safari.mapper.IScheduleMemberMapper;
import com.gd.safari.vo.ScheduleMember;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ScheduleMemberService implements IScheduleMemberService {
	@Autowired
	private IScheduleMemberMapper scheduleMemberMapper;
	@Autowired
	private IScheduleCommentMapper scheduleCommentMapper;

	// 일정 참석 여부 변경
	// 일정 여부 변경 사항을 댓글로 등록
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int modifyScheduleAttend(Map<String, Object> map) {
		log.debug(TeamColor.GDE + map);
		
		int row = 0;
		// 기존 참석 여부
		String attend = scheduleMemberMapper.selectScheduleAttend(map);
		
		// 기존 참석 여부와 변경하려는 참석여부가 다르면
		if (!attend.equals(map.get("scheduleAttend"))) {
			// 일정 참석여부 변경하기
			row = scheduleMemberMapper.updateScheduleAttend(map);
			
			// 참석 여부 변경 성공 후 변경 내용 댓글에 추가
			// 댓글 추가 메소드에 파라미터로 넣어줄 Map 생성하여 put
			Map<String, Object> paramMap = new HashMap<>();
			paramMap.put("cmtMemberEmail", map.get("scheduleMemberEmail"));
			paramMap.put("scheduleNo", map.get("scheduleNo"));
			
			if (map.get("scheduleAttend").equals("Y")) { // 참석일 때
				paramMap.put("scheduleCmtContent", "'" + map.get("workMemberName") + "' 님이 참석합니다.");
				scheduleCommentMapper.insertScheduleComment(paramMap);
			} else { // 불참일 때
				paramMap.put("scheduleCmtContent", "'" + map.get("workMemberName") + "' 님이 불참합니다.");
				scheduleCommentMapper.insertScheduleComment(paramMap);
			}
		}
		log.debug(TeamColor.GDE + "row --- " + row);
		
		return row;
	}

}
