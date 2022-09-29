package com.gd.safari.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.safari.vo.Log;

@Mapper

public interface ILogMapper {
	int insertTaskListLog(Log log);
	int insertTaskLog(Log log);
	int insertUpdateTaskListLog(Log log);
	int insertUpdateTaskLog(Log log);
	int insertDeleteTaskListLog(Log log);
	int insertDeleteTaskLog(Log log);
	List<Log> selectLogList (Map<String, Object> map);
	int selectLogCount(Map<String,Object> map);
}
