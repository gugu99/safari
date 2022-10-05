package com.gd.safari.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.safari.vo.Log;

@Mapper

public interface ILogMapper {
	
	// 로그 추가
	int insertLog(Map<String,Object> map);
	
	//로그 리스트 띄우기
	List<Log> selectLogList (Map<String, Object> map);
	
	// 로그리스트 행수구하기
	int selectLogCount(Map<String,Object> map);
	
}
