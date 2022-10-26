package com.gd.safari.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.mapper.IChatMemberMapper;
import com.gd.safari.mapper.IChatMsgMapper;
import com.gd.safari.mapper.IChatRoomMapper;
import com.gd.safari.mapper.IProjectSummaryMapper;
import com.gd.safari.mapper.IWorkspaceMemberMapper;
import com.gd.safari.vo.ChatMember;
import com.gd.safari.vo.ChatRoom;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ChatService implements IChatService {
	@Autowired
	IProjectSummaryMapper projectSummaryMapper;
	@Autowired
	IChatRoomMapper chatRoomMapper;
	@Autowired
	IChatMemberMapper chatMemberMapper;
	@Autowired
	IWorkspaceMemberMapper workspaceMemberMapper;
	@Autowired
	IChatMsgMapper chatMsgMapper;
	
	// 채팅방 리스트 및 채팅방 생성 가능한 워크스페이스 멤버 리스트
	@Override
	public Map<String, Object> getChatListByWorkNo(Map<String, Object> paramMap) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("chatRoomList", chatRoomMapper.selectChatRoomListByWorkMemberEmail(paramMap));
		
		log.debug(TeamColor.CSK + "chatRoomList" + map.get("chatRoomList"));
		map.put("workspaceMemberList", projectSummaryMapper.selectWorkspaceMemberListWithProfileImgByWorkNo((int)paramMap.get("workNo")));
		
		return map;
	}
	
	// 채팅 내역 리턴
	

	// 하나의 채팅방 정보 리턴
	@Override
	@Transactional
	public List<Map<String, Object>> getChatRoom(Map<String, Object> map) {
		log.debug(TeamColor.CSK + "getChatRoom");
		log.debug(TeamColor.CSK + map);
		
//		if(map.get("workMemberNo") != null) {
//			// INSERT 대상
//			// chatRoomName 만들기: '승현,다은' 모양의 채팅방 이름 생성
//			Map<String, Object> workMember = workspaceMemberMapper.selectWorkspaceMemberOne(Integer.parseInt((String)map.get("workMemberNo")));
//			
//			String chatRoomName = (String) map.get("workMemberName");
//			chatRoomName += "," + workMember.get("workMemberName");
//			
//			log.debug(TeamColor.CSK + chatRoomName);
//			map.put("chatRoomName", chatRoomName);
//			
//			// 채팅 방 만들기
//			chatRoomMapper.insertChatRoom(map);
//			log.debug(TeamColor.CSK + map);
//			
//			// 채팅방에 멤버 추가
//			// #{chatRoomNo} , #{chatMemberEmail}
//			ChatMember chatMember = new ChatMember();
//			chatMember.setChatRoomNo((int)map.get("chatRoomNo"));
//			
//			// 자기 자신
//			chatMember.setChatMemberEmail(String.valueOf(workMember.get("workMemberEmail")));
//			chatMemberMapper.insertChatMember(chatMember);
//			
//			// 상대
//			chatMember.setChatMemberEmail(String.valueOf(map.get("workMemberEmail")));
//			chatMemberMapper.insertChatMember(chatMember);
//			
//			return null;
//					// chatMsgMapper.selectMsgListByChatRoomNo((int)map.get("chatRoomNo"));
//		}
		
		// 기존 채팅 메시지 정보 불러오기
		
		return chatMsgMapper.selectMsgListByChatRoomNo(map);
	}
}
