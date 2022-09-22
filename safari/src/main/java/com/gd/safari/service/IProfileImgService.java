package com.gd.safari.service;

import java.util.Map;

import com.gd.safari.vo.ProfileImg;

public interface IProfileImgService {
	
	// 이미지 추가 메서드
	int addProfileImg(Map<String, Object> map);
	
	// 프로필 상세보기 메서드
	ProfileImg getProfileImgOne(int workMemberNo);
	
	// 프로필 삭제 메서드
	int removeProfileImg(int workMemberNo, String path);
}
