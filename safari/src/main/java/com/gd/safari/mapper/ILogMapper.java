package com.gd.safari.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.safari.vo.Log;

@Mapper

public interface ILogMapper {
	
	// 업무 리스트 추가 로그
	int insertTaskListLog(Log log);
	
	// 업무 추가 로그
	int insertTaskLog(Log log);
	
	// 업무리스트 수정 로그
	int insertUpdateTaskListLog(Log log);
	
	// 업무 수정 로그
	int insertUpdateTaskLog(Log log);
	
	// 업무리스트 삭제 로그
	int insertDeleteTaskListLog(Log log);
	
	// 업무 삭제로그
	int insertDeleteTaskLog(Log log);
	
	//로그 리스트 띄우기
	List<Log> selectLogList (Map<String, Object> map);
	
	// 로그리스트 행수구하기
	int selectLogCount(Map<String,Object> map);
	
	// 로그에 추가된 멤버 이메일가져오기
	List<Log> selectLogMemberList(int projectNo);
}
