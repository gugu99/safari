package com.gd.safari.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.safari.vo.ProfileImg;


@Mapper
public interface IProfileImgMapper {
	int insertProfileImg(Map<String, Object> map);
	ProfileImg selectProfileImgOne(int workMemberNo);
}
