package com.gd.safari.vo;

import lombok.Data;

@Data
public class Member {
	private String memberEmail;
	private String memberPw;
	private String active;
	private String createDate;
}