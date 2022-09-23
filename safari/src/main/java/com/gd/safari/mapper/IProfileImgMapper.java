package com.gd.safari.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.safari.vo.ProfileImg;


@Mapper
public interface IProfileImgMapper {
	
	// 프로필 이미지 삽입 메서드
	int insertProfileImg(Map<String, Object> map);
	
	// 프로필 이미지 보여주는 메서드
	ProfileImg selectProfileImgOne(int workMemberNo);
	
	// 프로필 이미지 삭제
	int deleteProfileImg(int workMemberNo);
}
