package com.gd.safari.service;

import java.util.List;

import com.gd.safari.vo.Log;

public interface ILogService {
	List<Log> getLogList (int projectNo);
}
