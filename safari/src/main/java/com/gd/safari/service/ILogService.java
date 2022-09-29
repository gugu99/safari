package com.gd.safari.service;

import java.util.List;
import java.util.Map;

import com.gd.safari.vo.Log;

public interface ILogService {
	
	// 로그 리스트 띄우기
	List<Log> getLogList (Map<String,Object> map);
	
	// 로그 총 개수 구하기
	int getLogCount(Map<String,Object> map);
	
	// 로그에 올라간사람 리스트
	List<Log> getLogMemberList(int projectNo);
}
