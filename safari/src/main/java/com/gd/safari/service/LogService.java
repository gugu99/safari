package com.gd.safari.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.mapper.ILogMapper;
import com.gd.safari.vo.Log;

import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class LogService implements ILogService{
	@Autowired private ILogMapper logMapper;
	
	@Override
	public List<Log> getLogList(int projectNo) {
		
		// 로그 디버깅
		LogService.log.debug(TeamColor.CJM + projectNo + "Service projectNo");
	
		// 로그 리스트 보여주기
		List<Log> list = logMapper.selectLogList(projectNo);
		
		LogService.log.debug(TeamColor.CJM + list + "Service list");
		
		return list;
	}

}
