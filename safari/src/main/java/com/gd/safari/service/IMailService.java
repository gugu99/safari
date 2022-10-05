package com.gd.safari.service;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

public interface IMailService {
	// 회원가입 메일내용 작성
	MimeMessage createMessageForRegister(String to) throws MessagingException, UnsupportedEncodingException;
	// 휴면계정 활성화 메일내용 작성
	MimeMessage createMessageForUnlockUser(String to) throws MessagingException, UnsupportedEncodingException;
	// 비밀번호 복구 메일내용 작성
	MimeMessage createMessageForRecoverPw(String to) throws MessagingException, UnsupportedEncodingException;
	// 인증번호 생성되는 메서드
	String createKey();
	// 회원가입 메일 발송
	String sendSimpleMessageForRegister(String to) throws Exception;
	// 휴면계정 활성화 메일 발송
	String sendSimpleMessageForUnlockUser(String to) throws Exception;
	// 비밀번호 복구 메일 발송
	String sendSimpleMessageForRecoverPw(String to) throws Exception;
}
