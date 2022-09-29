package com.gd.safari.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.mapper.IFeedbackMapper;
import com.gd.safari.mapper.IFeedbackReceiverMapper;
import com.gd.safari.mapper.ITaskMapper;
import com.gd.safari.mapper.ITaskMemberMapper;
import com.gd.safari.mapper.IWorkspaceMapper;
import com.gd.safari.mapper.IWorkspaceMemberMapper;
import com.gd.safari.vo.Feedback;
import com.gd.safari.vo.FeedbackList;
import com.gd.safari.vo.WorkspaceMember;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class FeedbackService implements IFeedbackService {
	@Autowired
	private IFeedbackMapper feedbackMapper;
	@Autowired
	private IFeedbackReceiverMapper feedbackReceiverMapper;
	@Autowired
	private IWorkspaceMemberMapper workspaceMemberMapper;
	@Autowired
	private IWorkspaceMapper workspaceMapper;
	@Autowired
	private ITaskMapper taskMapper;
	@Autowired
	private ITaskMemberMapper taskMemberMapper;
	
	// 피드백 작성
	// 피드백 작성 후 피드백 번호 가져와서 피드백 받는 사람 추가
	@Override
	@Transactional(rollbackFor = Exception.class)
	public void addFeedback(Map<String, Object> map) {
		log.debug(TeamColor.GDE + "map --- " + map);
		
		// 피드백 받는 사람 배열로 가공하기
		String tmp = (String)map.get("feedbackReceiverList");
		String[] feedbackReceiverList = tmp.split(",");
		
		// feedbackReceiverList map에서 삭제
		map.remove("feedbackReceiverList");
		
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

	@Override
	public Map<String, Object> getFeedbackListAndMemberInfoByWorkspaceMember(WorkspaceMember workspaceMember, Map<String, Object> sender) {
		// 피드백 작성할 때 - 작성자가 관리자인지 아닌지 조회
		String admin = workspaceMapper.selectWorkspaceAdminEmail(sender);
		log.debug(TeamColor.GDE + "admin --- " + admin);
		
		List<Map<String, Object>> taskList = null;
		
		// 작성자가 워크스페이스 관리자일 때 피드백 수신자의 완료된 업무 전체 조회
		if (admin != null) {
			taskList = taskMapper.selectCompleteTaskListByReceiverNo(workspaceMember.getWorkMemberNo());
		} else {
			Map<String, Integer> workMemberNo = new HashMap<>();
			workMemberNo.put("feedbackSenderNo", (Integer)sender.get("senderWorkMemberNo"));
			workMemberNo.put("feedbackReceiverNo", workspaceMember.getWorkMemberNo());
			log.debug(TeamColor.GDE + "workMemberNo --- " + workMemberNo);
			// 작성자가 워크스페이스 관리자가 아닐 때
			taskList = taskMapper.selectCompleteTaskListByReceiverNoAndSenderNo(workMemberNo);
		}
		log.debug(TeamColor.GDE + "taskList --- " + taskList);
		
		// 해당 회원의 정보
		Map<String, Object> member = workspaceMemberMapper.selectWorkspaceMemberOne(workspaceMember.getWorkMemberNo());
		log.debug(TeamColor.CSK + "member: " + member);

		workspaceMember.setWorkMemberEmail((String)member.get("workMemberEmail"));
		// 피드백 리스트
		List<FeedbackList> feedbackList = feedbackMapper.selectFeedbackByWorkspaceMember(workspaceMember);
		log.debug(TeamColor.CSK + "feedbackList: " + feedbackList);
		
		Map<String, Object> map = new HashMap<>();
		map.put("feedbackList", feedbackList);
		map.put("member", member);
		map.put("taskList", taskList);
		
		return map;
	}

	// 피드백 한개 조회 - 수정 폼
	@Override
	public Map<String, Object> getFeedbackOne(int feedbackNo) {
		log.debug(TeamColor.GDE + "feedbackNo --- " + feedbackNo);
		
		// 피드백 한개 조회
		Map<String, Object> feedbackOne = feedbackMapper.selectFeedbackOne(feedbackNo);
		log.debug(TeamColor.GDE + feedbackOne);
		
		// 해당 피드백의 수신자와 업무멤버 리스트
		List<Map<String, Object>> feedbackReceiverList = feedbackReceiverMapper.selectFeedbackReceiverAndtaskMember((int)feedbackOne.get("feedbackNo"), (int)feedbackOne.get("taskNo"));
		log.debug(TeamColor.GDE + "feedbackReceiverList --- " + feedbackReceiverList);
		
		Map<String, Object> map = new HashMap<>();
		map.put("feedbackOne", feedbackOne);
		map.put("feedbackReceiverList", feedbackReceiverList);
		
		return map;
	}

	// 피드백 수정하기 - 피드백 수정, 피드백 수신자 수정
	@Override
	@Transactional(rollbackFor = Exception.class)
	public void modifyFeedback(Map<String, Object> map) {
		log.debug(TeamColor.GDE + "map --- " + map);
		
		// 피드백 수정
		int row = feedbackMapper.updateFeedback(map);
		log.debug(TeamColor.GDE + "row --- " + row);
		
		// 피드백 받는 사람 배열로 가공하기
		String tmp = (String)map.get("feedbackReceiverList");
		String[] arr = tmp.split(",");
		// 수정 수신자 이메일 배열을 담을 새로운 리스트
		List<String> feedbackReceiverList = new ArrayList<>();
		// 리스트에 수정 수신자 이메일을 담는다.
		for (String s : arr) {
			feedbackReceiverList.add(s);
		}
		log.debug(TeamColor.GDE + "feedbackReceiverList --- " + feedbackReceiverList);
		// feedbackReceiverList map에서 삭제
		map.remove("feedbackReceiverList");
		
		log.debug(TeamColor.GDE + map.get("feedbackNo").getClass());
		
		// 기존 수신자 리스트
		List<String> preReceiver = feedbackReceiverMapper.selectFeedbackReceiverByFeedbackNo(Integer.parseInt((String) map.get("feedbackNo")));
		log.debug(TeamColor.GDE + "preReceiver --- " + preReceiver);
		
		// 추가할 피드백 수신자 리스트 (수정 수신자 - 기존 수신자)
		List<String> insertReceiver = new ArrayList<>(feedbackReceiverList);
		insertReceiver.removeAll(preReceiver);
		log.debug(TeamColor.GDE + "insertReceiver --- " + insertReceiver);
		
		// 삭제할 피드백 수신자 (기존 수신자 - 수정 수신자)
		List<String> deleteReceiver = preReceiver;
		deleteReceiver.removeAll(feedbackReceiverList);
		log.debug(TeamColor.GDE + "deleteReceiver --- " + deleteReceiver);
		
		// 수신자 수만큼 추가
		for (String insertReceiverEmail : insertReceiver) {
			map.put("feedbackReceiver", insertReceiverEmail);
			feedbackReceiverMapper.insertFeedbackReceiver(map);
		}
		
		// 수신자 수만큼 삭제
		for (String deleteReceiverEmail : deleteReceiver) {
			map.put("feedbackReceiver", deleteReceiverEmail);
			feedbackReceiverMapper.deleteFeedbackReceiverByFeedbackNoAndEmail(map);
		}
	}
}
