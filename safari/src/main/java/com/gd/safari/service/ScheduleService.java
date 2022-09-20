package com.gd.safari.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.mapper.IProjectMemberMapper;
import com.gd.safari.mapper.IScheduleMapper;
import com.gd.safari.mapper.IScheduleMemberMapper;
import com.gd.safari.vo.ScheduleMember;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ScheduleService implements IScheduleService {
	
	@Autowired
	private IScheduleMapper scheduleMapper;
	@Autowired
	private IScheduleMemberMapper scheduleMemberMapper;
	@Autowired
	private IProjectMemberMapper projectMemberMapper;
	
	// 일정 리스트 (프로젝트 멤버리스트, 일정, 일정 멤버, 일정 댓글)
	@Override
	public Map<String, Object> getScheduleList(int projectNo, int workNo) {
		// 프로젝트 멤버리스트와 일정리스트를 담을 map 
		 Map<String, Object> map = new HashMap<>();
		// 프로젝트 멤버리스트
		List<Map<String, Object>> projectMemberList = projectMemberMapper.selectProjectMemberList(projectNo);
		
		// 일정 리스트
		List<Map<String, Object>> scheduleList = scheduleMapper.selectScheduleList(projectNo, workNo);
		
		map.put("projectMemberList", projectMemberList);
		map.put("scheduleList", scheduleList);
		
		return map;
	}
	
	
	// 일정 생성
	// 일정 생성하면서 일정 멤버 추가
	@Override
	@Transactional(rollbackFor = Exception.class)
	public void addSchedule(Map<String, Object> map) {
		// 자바스크립트 일정 멤버 배열 가공
		String tmp = (String)map.get("scheduleMemberList");
		String[] scheduleMemberList = tmp.split(",");
		
		// scheduleMemberList map에서 삭제
		map.remove("scheduleMemberList");
		
		// 일정 추가
		int row = scheduleMapper.insertSchedule(map);
		log.debug(TeamColor.GDE + "row --- " + row);
		
		// 일정 생성 성공하고 selectKey로 가져온 scheduleNo 세팅
		ScheduleMember scheduleMember = new ScheduleMember();
		scheduleMember.setScheduleNo((int)map.get("scheduleNo"));
		
		// 일정 멤버 추가하기
		for (String memberEmail : scheduleMemberList) {
			scheduleMember.setScheduleMemberEmail(memberEmail);
			
			scheduleMemberMapper.insertScheduleMember(scheduleMember);
		}
	}

}
