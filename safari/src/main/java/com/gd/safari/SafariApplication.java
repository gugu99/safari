package com.gd.safari;

import java.util.Properties;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.PropertySource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.scheduling.annotation.EnableScheduling;

@ServletComponentScan
@EnableScheduling
// 시큐리티 페이지 안나오게 하기
@SpringBootApplication(exclude = SecurityAutoConfiguration.class)
@PropertySource("classpath:my.properties")
public class SafariApplication {
	// 메일 구동을 위한 유저이름, 비밀번호 my.properties에서 받아오기
	@Value("${naver.username}")
	private String username;
	@Value("${naver.password}")
	private String password;
	
	// Application을 구동하는 main 메서드
	public static void main(String[] args) {
		SpringApplication.run(SafariApplication.class, args);
	}
	
	// mail 구현을 위한 세팅
	@Bean
	public JavaMailSender javaMailService() {
		JavaMailSenderImpl javaMailSender = new JavaMailSenderImpl();
		// smtp 서버 주소
		javaMailSender.setHost("smtp.naver.com"); 
		// 네이버 아이디
		javaMailSender.setUsername(username); 
		// 네이버 비밀번호
		javaMailSender.setPassword(password); 
		// 메일 인증서버 포트
		javaMailSender.setPort(465); 
		// 메일 인증서버 정보 가져오기
		javaMailSender.setJavaMailProperties(getMailProperties()); 
		
		return javaMailSender;
	}
	
	private Properties getMailProperties() {
		Properties properties = new Properties();
		// 프로토콜 설정
		properties.setProperty("mail.transport.protocol", "smtp");
		// smtp 인증
		properties.setProperty("mail.smtp.auth", "true");
		// smtp starttls 사용
		properties.setProperty("mail.smtp.starttls.enable", "true");
		// 디버그 사용
		properties.setProperty("mail.debug", "true");
		// ssl 인증 서버 = smtp.naver.com
		properties.setProperty("mail.smtp.ssl.trust", "smtp.naver.com");
		// ssl 사용
		properties.setProperty("mail.smtp.ssl.enable", "true");
		
		return properties;
	}
}