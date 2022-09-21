package com.gd.safari.service;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

public interface IMemberMailService {
		// 메일내용 작성
		MimeMessage createMessage(String[] to) throws MessagingException, UnsupportedEncodingException;
		// 인증번호 생성되는 메서드
		String createKey();
		// 메일 발송
		String sendSimpleMessage(String[] to) throws Exception;
}
