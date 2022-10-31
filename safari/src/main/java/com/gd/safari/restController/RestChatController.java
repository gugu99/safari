package com.gd.safari.restController;

import java.time.LocalTime;
import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.service.IChatService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/member/chat")
public class RestChatController {
	@Autowired
	private SimpMessagingTemplate template; // 특정 브로커로 메시지 전달
	@Autowired
	private IChatService chatService;
	
	@GetMapping("")
    public ModelAndView chat(ModelAndView mv, HttpSession session, Map<String, Object> paramMap) {
	   log.debug(TeamColor.CSK + "채팅방 메인 페이지");
       // log.debug(TeamColor.CSK + (String)session.getAttribute("login"));
        
       paramMap.put("workNo", (int)session.getAttribute("workNo"));
       paramMap.put("workMemberEmail", (String)session.getAttribute("login"));
        
       Map<String, Object> map = chatService.getChatListByWorkNo(paramMap);
        
       // ModelAndView 세팅 
       mv.setViewName("chat/chat");
       mv.addObject("chatRoomList", map.get("chatRoomList"));
       mv.addObject("workspaceMemberList", map.get("workspaceMemberList"));
        
       log.debug(TeamColor.CSK + "workspaceMemberList: " + map.get("workspaceMemberList"));
        
	   return mv;
    }
	
	// 채팅방 만들기
    @PostMapping("")
    public Map<String, Object> chat(HttpSession session, @RequestParam Map<String, Object> paramMap){
        // 필요한 data: chat_room_name, work_no(chat_room) / chat_room_no(select key로 받아오기), chat_member_email(내 이메일 - 세션, 상대 이메일) - (chat_member)
        paramMap.put("login", (String)session.getAttribute("login"));
        log.debug(TeamColor.CSK + "paramMap: " + paramMap);
        
        Map<String, Object> chatRoom = chatService.addChatRoom(paramMap);
        log.debug(TeamColor.CSK + "chatRoom: " + chatRoom);
        
        return chatRoom;
    }
	
	// 채팅방 입장
	// @RequestMapping(value="/chat", method= RequestMethod.GET)
	@GetMapping("/{chatRoomNo}")
    public Map<String, Object> getChatRoom(ModelAndView mv, @RequestParam Map<String, Object> map, @PathVariable int chatRoomNo, HttpSession session){
	    log.debug(TeamColor.CSK + "getChatRoom1 : " + map);
	    
	    map.put("workNo", (int)session.getAttribute("workNo"));
    	map.put("chatRoomNo", chatRoomNo);
    	map.put("workMemberEmail", session.getAttribute("login"));
    	
    	log.debug(TeamColor.CSK + "getChatRoom: " + map);
    	
    	Map<String, Object> chatRoom = chatService.getChatRoom(map);
    	log.debug(TeamColor.CSK + "chatRoom: " + chatRoom);
    	
    	// 없으면 insert한 뒤 return 해줌
    	// log.debug(TeamColor.CSK + chatRoom);
    	
        return chatRoom;
    }
	
	// 일반 메시지 매핑
    @MessageMapping(value="/chat/message")
    public void message(Map<String, Object> map) {
       // message: {chatRoomNo=1, chatMsg=반갑습니다, workMemberName=서경, chatMemberEmail=stringbuckwheat@gmail.com}
       log.debug(TeamColor.CSK + "message: " + map);
       map.put("time", LocalTime.now());
       
       // DB에 저장
       chatService.addChatMsg(map);
        
       template.convertAndSend("/sub/chat/" + map.get("chatRoomNo"), map);
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
//		w
//		map.put("chatMsg", map.get("workMemberName") + "님이 입장하였습니다." );
//		map.put("option", "notice" );
//		template.convertAndSend("/sub/chat?chatRoomNo=" + map.get("chatRoomNo"), map);
//		log.debug(TeamColor.CSK + "message: " + map);
//	}
	
}
