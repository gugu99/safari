package com.gd.safari.service;

import java.io.UnsupportedEncodingException;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.safari.commons.TeamColor;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class MailService implements IMailService {
	// Bean에 등록 한 MailConfig를 emailsender라는 이름으로 가져온다.
	@Autowired private JavaMailSender emailsender;
	// 인증번호 생성 -> createKey() 메서드로 생성된다.
	private final String ePw = createKey();
	
	// 메일내용 작성
	@Override
	public MimeMessage createMessage(String to) throws MessagingException, UnsupportedEncodingException {
		log.debug(TeamColor.CSH + this.getClass() + " createMessage (메일내용 작성)");
		MimeMessage message = emailsender.createMimeMessage();
		
		// 보내는 대상
		message.addRecipients(RecipientType.TO, to);
		// 메일 제목
		message.setSubject("Safari 회원가입 이메일 인증");
		
		// 메일 내용
		String msg = "";
		msg += "<div stype='margin:100px;'>";
		msg += "<h1>Safari</h1>";
		msg += "<h2>협업사이트 Safari입니다.</h2>";
		msg += "<br>";
		msg += "<p>아래 코드를 회원가입 창으로 돌아가 입력해주세요.</p>";
		msg += "<br>";
		msg += "<p>감사합니다.</p>";
		msg += "<br>";
		msg += "<div align='center' style='border:1px solid black; font-family:verdana;'>";
		msg += "<h3 style='color:blue;'>회원가입 인증 코드입니다.</h3>";	
		msg += "<div style='font-size:130%;'>";
		msg += "CODE : <strong>";
		// 인증번호 넣기
		msg += ePw + "</strong></div><br>";
		msg += "</div>";
		// 내용, charset 타입, subtype
		message.setText(msg, "utf-8", "html");
		// 보내는 사람의 메일 주소, 보내는 사람 이름
		message.setFrom(new InternetAddress("choseunghyun33@naver.com", "Safari_Admin"));
		
		return message;
	}
	
	// 인증번호 생성
	@Override
	public String createKey() {
		log.debug(TeamColor.CSH + this.getClass() + " createKey (인증번호 생성)");
		StringBuffer key = new StringBuffer();
		Random random = new Random();
		
		// 8자리 인증번호
		for(int i = 0; i < 8; i++) {
			 // 0-2 까지 랜덤, random값에 따라서 아래 switch 문이 실행됨
			int index = random.nextInt(3);
			
			switch(index) { 
			// case 0: 영어 소문자 a~z
			case 0:
				key.append((char)((int)(random.nextInt(26)) + 97));
				break;
			// case 1: 영어 대문자 A~Z
			case 1: 
				key.append((char)((int)(random.nextInt(26)) + 65));
				break;
			// case 2: 숫자 0~9
			case 2:
				key.append(random.nextInt(10));
				break;
			}
		}
		
		return key.toString();
	}
	
	// 메일 발송
	// sendSimpleMessage의 매개변수로 들어온 to는 이메일을 받을 주소이다.
	// MimeMessage 객체 안에 내가 전송할 메일의 내용을 담는다.
	// 그리고 bean으로 등록해둔 javaMail 객체를 사용해서 보낸다.
	@Override
	public String sendSimpleMessage(String to) throws Exception {
		log.debug(TeamColor.CSH + this.getClass() + " sendSimpleMessage (메일 발송)");
		MimeMessage message = createMessage(to);
		
		emailsender.send(message);
		
		// 메일로 보냈던 인증 코드를 서버로 반환
		return ePw;
	}
}
