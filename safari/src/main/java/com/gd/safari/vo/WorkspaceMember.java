package com.gd.safari.vo;

import lombok.Data;

@Data

public class WorkspaceMember {

	
	private int workMemberNo;			// 워크스페이스 멤버번호
	private String workMemberName;   	// 워크스페이스 멤버이름
	private String workMemberAddr;		// 워크스페이스 멤버주소
	private String workMemberBirth;		// 워크스페이스 멤버생년월일
	private String workMemberPhone;		// 워크스페이스 멤버전화번호
	private String workMemberDept;		// 워크스페이스 멤버부서
	private String workMemberPos;		// 워크스페이스 멤버직급
	private String active;				// 워크스페이스 멤버활동여부
	private String workMemberLevel;		// 워크스페이스 멤버권한레벨	
	private String createDate;			// 워크스페이스 멤생성일
	private String updateDate;			// 워크스페이스 멤버수정일	
	private int workNo;					// 워크스페이스 번호
	private String workMemberEmail;		// 워크스페이스 멤버이메일
	private String workMemberCode;      // 워크스페이스 멤버코드
	
}
