package com.gd.safari.service;

import java.util.ArrayList;
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
import com.gd.safari.vo.Schedule;
import com.gd.safari.vo.ScheduleAttendList;
import com.gd.safari.vo.ScheduleList;
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
	// int projectNo, int workNo, int workMemberNo, String search
	@Override
	public Map<String, Object> getScheduleList(Map<String, Object> paramMap) {
		log.debug(TeamColor.GDE + "paramMap --- " + paramMap);
		// 프로젝트 멤버리스트와 일정리스트를 담을 map 
		 Map<String, Object> map = new HashMap<>();
		// 프로젝트 멤버리스트
		List<Map<String, Object>> projectMemberList = projectMemberMapper.selectProjectMemberList((int)paramMap.get("projectNo"));
		// 프로젝트 관리자인지 조회
		Integer managerNo = projectMemberMapper.selectProjectManager((int)paramMap.get("projectNo"), (int)paramMap.get("workMemberNo"));
		boolean manager = (managerNo == null) ? false : true;
		// 일정 리스트
		List<ScheduleList> scheduleList = scheduleMapper.selectScheduleList(paramMap);
		
		
		for(int i = 0; i < scheduleList.size(); i++) {
			// 일정 리스트에 담겨있는 참석여부 리스트를 꺼내온다.
			List<ScheduleAttendList> list = scheduleList.get(i).getScheduleAttendances();
			
			// 참석여부 값인 U, Y, N을 넣어줄 임시 맵을 만든다.
			Map<String, String> uyn = new HashMap<>();
			uyn.put("U", "U");
			uyn.put("Y", "Y");
			uyn.put("N", "N");
			
			// 반복문을 돌려 참석여부 값이 있는 건 맵에서 삭제
			for(ScheduleAttendList s : list) {
				if(uyn.get(s.getScheduleAttendance()) != null) {
					uyn.remove(s.getScheduleAttendance());
				}
			}
			
			// uyn에 있는 값을 넣음 -> uyn에 값이 있다는건 리스트에 없다는 의미
			for (String key : uyn.keySet()) {
				ScheduleAttendList s = new ScheduleAttendList();
				s.setScheduleAttendance(key);
				
				list.add(s);
			}
			
			scheduleList.get(i).setScheduleAttendances(list);
		}
		
		map.put("projectMemberList", projectMemberList);
		map.put("scheduleList", scheduleList);
		map.put("manager", manager);
		
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
	
	// 일정 한개 데이터 조회
	// 일정 멤버 조회
	// 프로젝트 멤버 조회
	@Override
	public Map<String, Object> getScheduleOneByScheduleNo(int scheduleNo, int projectNo, int workNo) {
		log.debug(TeamColor.GDE + "scheduleNo --- " + scheduleNo);
		
		// 일정과 일정 멤버를 담을 Map
		Map<String, Object> map = new HashMap<>();
		
		// 일정 한개 데이터
		Schedule scheduleOne = scheduleMapper.selectScheduleOneByScheduleNo(scheduleNo);
		log.debug(TeamColor.GDE + "scheduleOne --- " + scheduleOne);
		
		// 일정 멤버
		List<Map<String, Object>> scheduleMembers = scheduleMemberMapper.selectScheduleMemberEmailByScheduleNo(scheduleNo, projectNo, workNo);
		log.debug(TeamColor.GDE + "scheduleMembers --- " + scheduleMembers);
		
		// Map에 담아준다.
		map.put("scheduleOne", scheduleOne);
		map.put("scheduleMembers", scheduleMembers);
		
		return map;
	}
	
	// 일정 수정
	// 일정 수정 성공하면 멤버 수정
	// scheduleMemberList=asdf@asdf.com,admin@admin.com,
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int modifySchedule(Map<String, Object> map) {
		log.debug(TeamColor.GDE + "map --- " + map);
		
		// 자바스크립트 일정 멤버 배열 가공
		String tmp = (String)map.get("scheduleMemberList");
		String[] arr = tmp.split(",");
		// 수정 멤버 이메일 배열을 담을 새로운 리스트
		List<String> scheduleMemberList = new ArrayList<>();
		// 리스트에 수정멤버 이메일을 담는다.
		for (String s : arr) {
			scheduleMemberList.add(s);
		}
		log.debug(TeamColor.GDE + "scheduleMemberList --- " + scheduleMemberList);
		
		// scheduleMemberList map에서 삭제
		map.remove("scheduleMemberList");
		
		// 일정 멤버 수정시 필요한 파라미터 vo 생성 후 세팅
		ScheduleMember scheduleMember = new ScheduleMember();
		scheduleMember.setScheduleNo(Integer.parseInt((String) map.get("scheduleNo")));
		
		// 기존 일정 멤버 리스트
		List<String> preMember = scheduleMemberMapper.selectScheduleMember(scheduleMember);
		log.debug(TeamColor.GDE + "preMember --- " + preMember);
		
		// 추가할 일정 멤버 (수정멤버 - 기존멤버)
		List<String> insertMember = new ArrayList<>(scheduleMemberList);
		insertMember.removeAll(preMember);
		log.debug(TeamColor.GDE + "insertMember --- " + insertMember);
		
		// 삭제할 일정 멤버 (기존 멤버 - 수정멤버)
		List<String> deleteMember = preMember;
		deleteMember.removeAll(scheduleMemberList);
		log.debug(TeamColor.GDE + "deleteMember --- " + deleteMember);
		
		// 멤버 수만큼 추가
		for(String insertMemberEmail : insertMember) {
			scheduleMember.setScheduleMemberEmail(insertMemberEmail);
			scheduleMemberMapper.insertScheduleMember(scheduleMember);
		}
		
		// 멤버 수만큼 삭제
		for (String deleteMemberEmail : deleteMember) {
			scheduleMember.setScheduleMemberEmail(deleteMemberEmail);
			scheduleMemberMapper.deleteScheduleMemberByScheduleNoAndScheduleMemberEmail(scheduleMember);
		}
		
		// 일정 수정
		int row = scheduleMapper.updateSchedule(map);
		
		return row;
	}


	@Override
	public void removeSchedule(int scheduleNo) {
		log.debug(TeamColor.GDE + "scheduleNo --- " + scheduleNo);
		
		int row = scheduleMapper.deleteSchedule(scheduleNo);
		log.debug(TeamColor.GDE + "row --- " + row);
	}

//	// 트랜잭션 처리하기
//		// 일정 삭제하기
//			// 일정 멤버 삭제 
//			// 일정 좋아요 삭제
//			// 일정 댓글 삭제
//				//일정 댓글 좋아요 삭제 
//	@Override
//	@Transactional(rollbackFor = Exception.class)
//	public void removeSchedule(int scheduleNo) {
//		log.debug(TeamColor.GDE + "scheduleNo --- " + scheduleNo);
//		
//		// 일정에 등록된 댓글 번호 조회
//		List<Integer> list = scheduleCommentMapper.selectScheduleCmtNoByScheduleNo(scheduleNo);
//		// 조회된 댓글 번호 만큼 댓글 좋아요 삭제
//		for (Integer i : list) {
//			scheduleCommentLikeMapper.deleteScheduleCommentLike(i);
//		}
//		// 댓글 좋아요 삭제 후 일정에 등록된 댓글 삭제
//		scheduleCommentMapper.deleteScheduleComment(scheduleNo);
//		// 일정 좋아요 삭제
//		scheduleLikeMapper.deleteScheduleLike(scheduleNo);
//		// 일정 멤버 삭제
//		scheduleMemberMapper.deleteScheduleMember(scheduleNo);
//		
//		// 일정에 포함된 데이터들을 모두 지운 후 일정 삭제하기
//		int row = scheduleMapper.deleteSchedule(scheduleNo);
//		log.debug(TeamColor.GDE + "row --- " + row);
//	}
//
//	// 프로젝트 삭제 시 일정 전체 삭제
//	@Override
//	@Transactional(rollbackFor = Exception.class)
//	public void removeScheduleByprojectNo(int projectNo) {
//		log.debug(TeamColor.GDE + "projectNo --- " + projectNo);
//		
//		// 프로젝트 내 일정 번호 리스트
//		List<Integer> scheduleNoList = scheduleMapper.selectScheduleNoByProjectNo(projectNo);
//		
//		// 일정 개수만큼 댓글 좋아요/댓글/일정 좋아요/일정 멤버 삭제하기
//		for (Integer scheduleNo : scheduleNoList) {
//			// 일정에 등록된 댓글 번호 조회
//			List<Integer> scheduleCmtNoList = scheduleCommentMapper.selectScheduleCmtNoByScheduleNo(scheduleNo);
//			// 조회된 댓글 번호 만큼 댓글 좋아요 삭제
//			for (Integer scheduleCmtNo : scheduleCmtNoList) {
//				scheduleCommentLikeMapper.deleteScheduleCommentLike(scheduleCmtNo);
//			}
//			// 댓글 좋아요 삭제 후 일정에 등록된 댓글 삭제
//			scheduleCommentMapper.deleteScheduleComment(scheduleNo);
//			// 일정 좋아요 삭제
//			scheduleLikeMapper.deleteScheduleLike(scheduleNo);
//			// 일정 멤버 삭제
//			scheduleMemberMapper.deleteScheduleMember(scheduleNo);
//		}
//		// 일정에 포함된 데이터들을 모두 지운 후 프로젝트 내 일정 전체 삭제하기
//		int row = scheduleMapper.deleteScheduleByProjectNo(projectNo);
//		log.debug(TeamColor.GDE + "row --- " + row);
//	}
}
