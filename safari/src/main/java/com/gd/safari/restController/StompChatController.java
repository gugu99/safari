package com.gd.safari.restController;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.mapper.ChatRoomRepository;
import com.gd.safari.service.IChatService;
import com.gd.safari.vo.ChatMsg;
import com.gd.safari.vo.ChatRoom;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RestController
@RequiredArgsConstructor
public class StompChatController {
	@Autowired
	private SimpMessagingTemplate template; // 특정 브로커로 메시지 전달
	@Autowired
	private IChatService chatService;
	
	// 채팅방 입장
    @GetMapping("/member/chatRoom")
    public List<Map<String, Object>> getChatRoom(@RequestParam Map<String, Object> map, Model model, HttpSession session){
    	map.put("workNo", (int)session.getAttribute("workNo"));
    	map.put("workMemberName", (String)session.getAttribute("workMemberName")); // 방 이름 만들기
    	map.put("workMemberEmail", (String)session.getAttribute("login")); // 스스로의 이름
    	
    	log.debug(TeamColor.CSK + "getChatRoom: " + map);
    	
    	List<Map<String, Object>> msgList = chatService.getChatRoom(map);
    	log.debug(TeamColor.CSK + "msgList: " + msgList);
    	
    	// 없으면 insert한 뒤 return 해줌
    	// log.debug(TeamColor.CSK + chatRoom);
    	
        return msgList;
    }
	
	// Client가 send할 수 있는 경로
	// stompConfig에서 설정한 applicationDestinationPrefixeds와 @MessageMapping 경로 병합
	// /pub/chat/enter
//	@MessageMapping(value = "/chat/enter")
//	public void enter(Map<String, Object> map) {
//		// @MessageMapping: 웹소켓으로 들어오는 메시지 발행 처리
//		// 클라이언트에서 "/pub/chat/enter"로 발행 요청을 하면 /sub/chat?chatRoomno=로 메시지가 전송됨
//		
//		log.debug(TeamColor.CSK + "환영 인사!!!");
//		
//		map.put("chatMsg", map.get("workMemberName") + "님이 입장하였습니다." );
//		map.put("option", "notice" );
//		template.convertAndSend("/sub/chat?chatRoomNo=" + map.get("chatRoomNo"), map);
//		log.debug(TeamColor.CSK + "message: " + map);
//	}
	
	// 일반 메시지 매핑
	@MessageMapping(value="/chat/message")
	public void message(Map<String, Object> map) {
		log.debug(TeamColor.CSK + "일반 메시지");
		template.convertAndSend("/sub/chat?chatRoomNo=" + map.get("chatRoomNo"), map);
		log.debug(TeamColor.CSK + "message: " + map);
	}
}
