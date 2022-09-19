package com.gd.safari.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IScheduleLikeMapper {

	// 일정 별 좋아요 조회
	Map<String, Object> selectScheduleLikeByScheduleNo();
}
