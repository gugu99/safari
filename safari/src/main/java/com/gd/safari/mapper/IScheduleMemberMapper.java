package com.gd.safari.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gd.safari.vo.ScheduleMember;

@Mapper
public interface IScheduleMemberMapper {
	
	// 일정 멤버 추가
	int insertScheduleMember(ScheduleMember scheduleMember);
	// 일정 멤버 리스트
	
	// 일정 멤버 수정(참석여부)
	
	// 일정 멤버 삭제
}
