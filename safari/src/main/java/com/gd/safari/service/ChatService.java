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
	
	// 하나의 채팅방 정보 리턴 (기존 채팅 내역, 채팅방 정보)
	@Override
	@Transactional
	public Map<String, Object> getChatRoom(Map<String, Object> paramMap) {
		log.debug(TeamColor.CSK + "getChatRoom");
		log.debug(TeamColor.CSK + paramMap);
		
		// 기존 채팅 메시지 정보 불러오기
		Map<String, Object> map = new HashMap<>();
		
		// 기존 메시지 리스트
		List<Map<String, Object>> msgList = chatMsgMapper.selectMsgListByChatRoomNo(paramMap);
		map.put("msgList", msgList);
		
		int chatMemberNo = chatMemberMapper.selectChatMemberNoByWorkMemberEmail(paramMap);
		map.put("chatMemberNo", chatMemberNo);
		
		return map;
	}
	
	@Override
	@Transactional
	public Map<String, Object> addChatRoom(Map<String, Object> paramMap) {
	    // 채팅방 만들기
	    // 채팅 상대의 정보 불러오기
        Map<String, Object> workMember = workspaceMemberMapper.selectWorkspaceMemberOne(Integer.parseInt((String)paramMap.get("workMemberNo")));
        log.debug(TeamColor.CSK + "workMember: " + workMember);
        
        // TODO 멀티채팅 구현 시 방 이름 바꾸기
        // String chatRoomName = String.valueOf(workMember.get("workMemberName"));
        paramMap.put("chatRoomName", workMember.get("workMemberName"));  // 상대 이름
        paramMap.put("workNo", workMember.get("workNo"));
        
        // chat_room_name, work_no (chat_room)
        // chat_room_no, chat_member_email(chat_member)

        // 채팅 방 만들기
        chatRoomMapper.insertChatRoom(paramMap);
        log.debug(TeamColor.CSK + paramMap);
       
        // 채팅방에 멤버 추가
        // #{chatRoomNo} , #{chatMemberEmail}
        ChatMember chatMember = new ChatMember();
        chatMember.setChatRoomNo((int)paramMap.get("chatRoomNo")); // select key로 받아온 채팅방 번호 세팅
        
        // 자기 자신
        chatMember.setChatMemberEmail(String.valueOf(paramMap.get("login")));
        chatMemberMapper.insertChatMember(chatMember);
        
        // 상대
        chatMember.setChatMemberEmail(String.valueOf(workMember.get("workMemberEmail")));
        chatMemberMapper.insertChatMember(chatMember);
        
	    return paramMap;
	}
	
	// 채팅 메시지 저장
	@Override
	@Transactional
	public void addChatMsg(Map<String, Object> map) {
	    int result = chatMsgMapper.insertChatMsg(map);
	    
	    if(result != 1) {
	        throw new RuntimeException();
	    }
	}
}
