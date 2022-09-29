package com.gd.safari.service;

import java.util.List;
import java.util.Map;

import com.gd.safari.vo.Log;

public interface ILogService {
	List<Log> getLogList (Map<String,Object> map);
	int getLogCount(Map<String,Object> map);
}
