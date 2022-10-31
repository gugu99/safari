package com.gd.safari;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

import com.gd.safari.commons.TeamColor;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Configuration
@EnableWebSocketMessageBroker
public class StompWebSocketConfig implements WebSocketMessageBrokerConfigurer {
	
    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
        // http://safari.o-r.kr/
        registry.addEndpoint("/stomp/chat")
                .setAllowedOrigins("http://localhost:80", "http://safari.o-r.kr/", "http://43.200.96.123/")
                .withSockJS();
    }

    // 어플리케이션 내부에서 사용할 path를 지정할 수 있음
    @Override
    public void configureMessageBroker(MessageBrokerRegistry registry) {
    	log.debug(TeamColor.CSK + "configureMessageBroker");
    	
    	// Client에서 SEND 요청을 처리
        registry.setApplicationDestinationPrefixes("/pub"); // /topic, /queue
        registry.enableSimpleBroker("/sub");
    }
}
